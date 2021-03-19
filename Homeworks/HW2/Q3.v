module MyXOR2(input a,output w);
    //Method 1
    xor #(21,25) x1(y,a,b);
    //Method 2
    assign #(21,25) Y = ~a&b | a&~b;
endmodule