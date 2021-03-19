module MyComparator(
    input a0,a1,a2,a3,b0,b1,b2,b3,
    output w
);
    wire g,p,t,z;
    MyXOR G1(a0,b0,g);
    MyXOR G2(a1,b1,p);
    MyXOR G3(a2,b2,t);
    MyXOR G4(a3,b3,z);
    MyNOR G5(g,p,t,z,w);
endmodule