
module top(clkin_data, in_data, out_data);
  wire moveme;
  wire sig_a;
  reg [8:0] sig_b;
  wire sig_c;
  wire [20:0] sig_d;
  reg sig_e;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [95:0] in_data;
  wire [95:0] in_data;
  output out_data;
  wire out_data;

  logic myfirst, mysecond;
  assign myfirst  = 1'b0;
  assign mysecond = 1'b0;

  always_ff @(posedge clkin_data[0], posedge myfirst, posedge mysecond)
    if (myfirst) sig_e <= 1'b0;
    else if (mysecond) sig_e <= 1'b1;
    else if (clkin_data[128]) sig_e <= sig_d[7];

  always_ff @(posedge clkin_data[128])
    sig_b <= '0;

  // assign moveme = 1'b1;

  assign sig_a = in_data[89]; // 1'b0;
  assign sig_c = | { in_data[61:60], sig_b, sig_a };
  assign sig_d = ~ { moveme, 6'b0, sig_b, 1'b0, sig_c, 3'b0 };
  assign moveme = 1'b1;

  assign out_data = sig_e;
endmodule
