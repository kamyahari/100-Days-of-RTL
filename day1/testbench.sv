// Code your testbench here
// or browse Examples
module mux21_tb ();

  logic [7:0] a_i;
  logic [7:0] b_i;
  logic       sel_i;
  logic [7:0] y_o;
  logic [7:0] expected;

  mux21 EXAMPLEMUX (.*);

  initial begin
    for (int i = 0; i < 50; i++) begin //50 random cases
      a_i   = $urandom_range (0, 255); //urandom range
      b_i   = $urandom_range (0, 255);
      sel_i = $random%2;
      #1
      
      expected = sel_i ? a_i : b_i; 

      assert (y_o == expected) // checking the logic using assertions (not really required)
      else $error("FAIL at time %0t: sel_i=%0b, a_i=0x%0h, b_i=0x%0h, y_o=0x%0h, expected=0x%0h", 
                  $time, sel_i, a_i, b_i, y_o, expected);
      #4;
    end
  end

  initial begin
    $dumpfile("day1.vcd");
    $dumpvars(0, mux21_tb);
  end

endmodule
