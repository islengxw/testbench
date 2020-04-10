module dut(c);
    reg a;
    reg b;
   output c;
  assign c = a|b;
endmodule

module test(d);
 input d;
endmodule

module chip();
  wire f1;
  wire f2;
  dut dut1(.c (f1));
  test dut2(.d (f2));
  assign f2=f1;
endmodule

module test_top();
  chip chip1();
  
  initial begin
    force chip1.dut2.d = chip1.dut1.c;
    chip1.dut1.a = 0;
    #10;
    chip1.dut1.b = 1;
    #10;
    chip1.dut1.b = 0;
    #10;
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,test_top);
  end
endmodule
