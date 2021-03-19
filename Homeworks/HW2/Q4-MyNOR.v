module MyNOR(input a,b,c,d,output y);
    supply1 Vdd;
    supply0 Gnd;
    wire g,p,t;
    pmos #(5,7,9) T1(g,Vdd,a);
    pmos #(5,7,9) T2(p,g,b);
    pmos #(5,7,9) T3(t,p,c);
    pmos #(5,7,9) T4(y,t,d);
    nmos #(3,5,7) T5(y,Gnd,a);
    nmos #(3,5,7) T6(y,Gnd,b);
    nmos #(3,5,7) T7(y,Gnd,c);
    nmos #(3,5,7) T8(y,Gnd,d);
endmodule

module MyNOR2(input a,b,output y);
    assign #(20,36) Y = ~a&~b&~c&~d;
endmodule