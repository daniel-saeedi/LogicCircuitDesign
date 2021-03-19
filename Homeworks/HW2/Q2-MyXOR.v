module MyInverter(input a,output w);
    supply1 Vdd;
    supply0 Gnd;
    pmos #(5,7,9) T1(w,Vdd,a);
    nmos #(3,5,7) T2(w,Gnd,a);
endmodule

module MyXOR(input a,b,output w);
    supply1 Vdd;
    supply0 Gnd;
    wire a_bar,b_bar,t,q,p;
    MyInverter CUT1(a,a_bar);
    MyInverter CUT2(b,b_bar);
    pmos #(5,7,9) T1(t,Vdd,a);
    pmos #(5,7,9) T2(w,t,b_bar);
    pmos #(5,7,9) T3(q,Vdd,a_bar);
    pmos #(5,7,9) T4(w,q,b);
    nmos #(3,5,7) T5(w,p,a);
    nmos #(3,5,7) T6(w,p,b_bar);
    nmos #(3,5,7) T7(p,Gnd,a_bar);
    nmos #(3,5,7) T8(p,Gnd,b);
endmodule
