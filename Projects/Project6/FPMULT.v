`timescale 1ns/1ns
module FPMULT(input clk,rst,input [31:0] inBus,input startFP,output reg [31:0] resBus,output reg doneFP);
    //states
    parameter 
              idle         = 4'd0,
              init         = 4'd1,
              get_a         = 4'd2,
              get_b         = 4'd3,
              unpack        = 4'd4,
              special_cases = 4'd5,
              normalise_a   = 4'd6,
              normalise_b   = 4'd7,
              multiply_0    = 4'd8,
              multiply_1    = 4'd9,
              normalise_1   = 4'd10,
              normalise_2   = 4'd11,
              round         = 4'd12,
              pack          = 4'd13,
              result        = 4'd14;
    reg [3:0] ns,ps;
    reg [31:0] Areg;

    reg [31:0] Breg;

    reg [31:0] z;

    reg [9:0] a_e, b_e, z_e;
    reg a_s, b_s, z_s;
    reg       guard, round_bit, sticky;
    reg       [47:0] product;
    reg       [31:0] s_output_z;
    reg       [23:0] a_m, b_m, z_m;
    always @(*) begin
      ns <= idle;
      doneFP <= 1'b0;
      case(ps)
          idle : begin
            ns <= startFP ? init : idle;
            doneFP <= 1'b1;
          end

          init : begin
            ns <= startFP ? init : get_a;
            
          end

          get_a:
          begin
            Areg <= inBus;
            ns <= get_b;            
          end

          get_b:
          begin
            Breg <= inBus;
            ns <= unpack;
          end

          unpack:
          begin
            a_m <= Areg[22 : 0];
            b_m <= Breg[22 : 0];
            a_e <= Areg[30 : 23] - 127;
            b_e <= Breg[30 : 23] - 127;
            a_s <= Areg[31];
            b_s <= Breg[31];
            ns <= special_cases;
          end

          special_cases:
          begin
            //if a is NaN or b is NaN return NaN 
            if ((a_e == 128 && a_m != 0) || (b_e == 128 && b_m != 0)) begin
              z[31] <= 1;
              z[30:23] <= 255;
              z[22] <= 1;
              z[21:0] <= 0;
              ns <= result;
            //if a is inf return inf
            end else if (a_e == 128) begin
              z[31] <= a_s ^ b_s;
              z[30:23] <= 255;
              z[22:0] <= 0;
              //if b is zero return NaN
              if (($signed(b_e) == -127) && (b_m == 0)) begin
                z[31] <= 1;
                z[30:23] <= 255;
                z[22] <= 1;
                z[21:0] <= 0;
              end
              ns <= result;
            //if b is inf return inf
            end else if (b_e == 128) begin
              z[31] <= a_s ^ b_s;
              z[30:23] <= 255;
              z[22:0] <= 0;
              //if a is zero return NaN
              if (($signed(a_e) == -127) && (a_m == 0)) begin
                z[31] <= 1;
                z[30:23] <= 255;
                z[22] <= 1;
                z[21:0] <= 0;
              end
              ns <= result;
            //if a is zero return zero
            end else if (($signed(a_e) == -127) && (a_m == 0)) begin
              z[31] <= a_s ^ b_s;
              z[30:23] <= 0;
              z[22:0] <= 0;
              ns <= result;
            //if b is zero return zero
            end else if (($signed(b_e) == -127) && (b_m == 0)) begin
              z[31] <= a_s ^ b_s;
              z[30:23] <= 0;
              z[22:0] <= 0;
              ns <= result;
            end else begin
              //Denormalised Number
              if ($signed(a_e) == -127) begin
                a_e <= -126;
              end else begin
                a_m[23] <= 1;
              end
              //Denormalised Number
              if ($signed(b_e) == -127) begin
                b_e <= -126;
              end else begin
                b_m[23] <= 1;
              end
              ns <= normalise_a;
            end
          end

          normalise_a:
          begin
            if (a_m[23]) begin
              ns <= normalise_b;
            end else begin
              a_m <= a_m << 1;
              a_e <= a_e - 1;
            end
          end

          normalise_b:
          begin
            if (b_m[23]) begin
              ns <= multiply_0;
            end else begin
              b_m <= b_m << 1;
              b_e <= b_e - 1;
            end
          end

          multiply_0:
          begin
            z_s <= a_s ^ b_s;
            z_e <= a_e + b_e + 1;
            product <= a_m * b_m;
            ns <= multiply_1;

          end

          multiply_1:
          begin
            z_m <= product[47:24];
            guard <= product[23];
            round_bit <= product[22];
            sticky <= (product[21:0] != 0);
            ns <= normalise_1;
          end

          normalise_1:
          begin
            if (z_m[23] == 0) begin
              z_e <= z_e - 1;
              z_m <= z_m << 1;
              z_m[0] <= guard;
              guard <= round_bit;
              round_bit <= 0;
                ns <= normalise_1;
            end 
            else begin
              ns <= normalise_2;
            end
            
          end

          normalise_2:
          begin
            if ($signed(z_e) < -126) begin
              z_e <= z_e + 1;
              z_m <= z_m >> 1;
              guard <= z_m[0];
              round_bit <= guard;
              sticky <= sticky | round_bit;
              ns <= normalise_2;
            end else begin
              ns <= round;
            end
          end

          round:
          begin
            if (guard && (round_bit | sticky | z_m[0])) begin
              z_m <= z_m + 1;
              if (z_m == 24'hffffff) begin
                z_e <=z_e + 1;
              end
            end
            ns <= pack;
          end

          pack:
          begin
            z[22 : 0] <= z_m[22:0];
            z[30 : 23] <= z_e[7:0] + 127;
            z[31] <= z_s;
            if ($signed(z_e) == -126 && z_m[23] == 0) begin
              z[30 : 23] <= 0;
            end
            //if overflow occurs, return inf
            if ($signed(z_e) > 127) begin
              z[22 : 0] <= 0;
              z[30 : 23] <= 255;
              z[31] <= z_s;
            end
            ns <= result;
          end

          result:
          begin
            s_output_z <= z;
            ns <= idle;
          end

        endcase
    end

    //Sequential
    always @(posedge clk,posedge rst) begin
      if(rst)
        ps <= idle;
      else
        ps <= ns;
    end

  assign resBus = s_output_z;
endmodule