module example (a,b,c,d);
    input a,b,c;
    output d;
    assign d = (~a & b & c) | (a & b & c) | (~b & ~c);
endmodule