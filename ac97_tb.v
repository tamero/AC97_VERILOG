`timescale 1ns / 100ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:06:40 09/11/2013
// Design Name:   ac97memwrap
// Module Name:   D:/Calisma_Klasorleri/OT/work_ozgur/ac97/design/mmac97/ac97_tb.v
// Project Name:  mmac97
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ac97memwrap
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ac97_tb;

	// Inputs
	reg AC97_RST;
	reg AC_97_BIT_CLK;
	reg AC97_SDATA_IN;
	reg play;
	reg rec;
	reg operate;
	reg clk;
	reg rst;

	// Outputs
	wire AC97_SDATA_OUT;
	wire AC97_SYNC;
	wire [13:0] csr_adr;
	wire dmaw;
	wire dmar;
	

	// Instantiate the Unit Under Test (UUT)
	ac97memwrap uut (
		.AC97_RST(AC97_RST), 
		.AC97_SDATA_OUT(AC97_SDATA_OUT), 
		.AC97_SYNC(AC97_SYNC), 
		.AC_97_BIT_CLK(AC_97_BIT_CLK), 
		.AC97_SDATA_IN(AC97_SDATA_IN), 
		.play(play), 
		.rec(rec), 
		.operate(operate), 
		.clk(clk), 
		.rst(rst)
	);
		always
		#81.4 clk = ~clk;
//		#10 clk = ~clk;
		always
		#81.4 AC_97_BIT_CLK = ~AC_97_BIT_CLK;		//AC97 Být Clock 12.288 MHZ

	initial begin
		// Initialize Inputs
		AC97_RST = 1;
		AC_97_BIT_CLK = 0;
		AC97_SDATA_IN = 0;
		play = 0;
		rec = 0;
		operate = 0;
		clk = 0;
		rst = 1;
		// Wait 100 ns for global reset to finish
		#100;
    end    
		// Add stimulus here
		always
		#250	rst = 1'b0;
		always
		#200	operate = 1'b1;
/*		always
		#2000	operate = 1'b0;
*/		always begin
		#300	rec =	1'b1;
//		#48000	rec =	1'b0;
		end
/*		always
		#48100	play = 1'b1;
		always
		#98000	play = 1'b0;
*/		always
		#300 AC97_RST = 0;
		always 
		begin 
		#162.8 AC97_SDATA_IN = ~AC97_SDATA_IN;
/*		#220 AC97_SDATA_IN = 1'b1; 

		#8 AC97_SDATA_IN = 1'b0; 

		#11 AC97_SDATA_IN = 1'b1; 

		#5 AC97_SDATA_IN = 1'b0; 

		#12 AC97_SDATA_IN = 1'b1; 

		#13 AC97_SDATA_IN = 1'b0; 

		#13 AC97_SDATA_IN = 1'b1; 

		#10 AC97_SDATA_IN = 1'b0; 

		#7 AC97_SDATA_IN = 1'b1; 

		#11 AC97_SDATA_IN = 1'b0; 

		#13 AC97_SDATA_IN = 1'b1; 

		#8 AC97_SDATA_IN = 1'b0; 

		#7 AC97_SDATA_IN = 1'b1; 

		#9 AC97_SDATA_IN = 1'b0; 

		#3 AC97_SDATA_IN = 1'b1; 

		#14 AC97_SDATA_IN = 1'b0; 

		#10 AC97_SDATA_IN = 1'b1; 

		#8 AC97_SDATA_IN = 1'b0; 

		#14 AC97_SDATA_IN = 1'b1; 

		#7 AC97_SDATA_IN = 1'b0; 

		#16 AC97_SDATA_IN = 1'b1; 

		#15 AC97_SDATA_IN = 1'b0; 

		#14 AC97_SDATA_IN = 1'b1; 

		#7 AC97_SDATA_IN = 1'b0; 

		#13 AC97_SDATA_IN = 1'b1; 

		#10 AC97_SDATA_IN = 1'b0; 

		#17 AC97_SDATA_IN = 1'b1; 

		#10 AC97_SDATA_IN = 1'b0; 

		#17 AC97_SDATA_IN = 1'b1; 

		#13 AC97_SDATA_IN = 1'b0; 

		#4 AC97_SDATA_IN = 1'b1; 

		#9 AC97_SDATA_IN = 1'b0; 

		#12 AC97_SDATA_IN = 1'b1; 

		#4 AC97_SDATA_IN = 1'b0; 

		#13 AC97_SDATA_IN = 1'b1; 

		#12 AC97_SDATA_IN = 1'b0; 

		#8 AC97_SDATA_IN = 1'b1; 

		#6 AC97_SDATA_IN = 1'b0; 

		#5 AC97_SDATA_IN = 1'b1; 

		#11 AC97_SDATA_IN = 1'b0; 

		#5 AC97_SDATA_IN = 1'b1; 

		#3 AC97_SDATA_IN = 1'b0; 

		#10 AC97_SDATA_IN = 1'b1; 

		#11 AC97_SDATA_IN = 1'b0; 

		#6 AC97_SDATA_IN = 1'b1; 

		#8 AC97_SDATA_IN = 1'b0; 

		#9 AC97_SDATA_IN = 1'b1; 

		#2 AC97_SDATA_IN = 1'b0; 

		#3 AC97_SDATA_IN = 1'b1; 

		#11 AC97_SDATA_IN = 1'b0; 

		#12 AC97_SDATA_IN = 1'b1; 

		#16 AC97_SDATA_IN = 1'b0; 

		#16 AC97_SDATA_IN = 1'b1; 

		#10 AC97_SDATA_IN = 1'b0; 

		#13 AC97_SDATA_IN = 1'b1; 

		#12 AC97_SDATA_IN = 1'b0; 

		#11 AC97_SDATA_IN = 1'b1; 

		#5 AC97_SDATA_IN = 1'b0; 

		#7 AC97_SDATA_IN = 1'b1; 

		#9 AC97_SDATA_IN = 1'b0; 

		#10 AC97_SDATA_IN = 1'b1; 

		#11 AC97_SDATA_IN = 1'b0; 

		#11 AC97_SDATA_IN = 1'b1; 

		#6 AC97_SDATA_IN = 1'b0; 

		#9 AC97_SDATA_IN = 1'b1; 

		#5 AC97_SDATA_IN = 1'b0; 

		#3 AC97_SDATA_IN = 1'b1; 

		#6 AC97_SDATA_IN = 1'b0; 

		#8 AC97_SDATA_IN = 1'b1; 

		#15 AC97_SDATA_IN = 1'b0; 

		#4 AC97_SDATA_IN = 1'b1; 

		#7 AC97_SDATA_IN = 1'b0; 

		#14 AC97_SDATA_IN = 1'b1; 

		#12 AC97_SDATA_IN = 1'b0; 

		#16 AC97_SDATA_IN = 1'b1; 

		#6 AC97_SDATA_IN = 1'b0; 

		#6 AC97_SDATA_IN = 1'b1; 

		#4 AC97_SDATA_IN = 1'b0; 

		#12 AC97_SDATA_IN = 1'b1; 

		#17 AC97_SDATA_IN = 1'b0; 

		#5 AC97_SDATA_IN = 1'b1; 

		#15 AC97_SDATA_IN = 1'b0; 

		#9 AC97_SDATA_IN = 1'b1; 

		#6 AC97_SDATA_IN = 1'b0; 

		#14 AC97_SDATA_IN = 1'b1; 

		#16 AC97_SDATA_IN = 1'b0; 

		#5 AC97_SDATA_IN = 1'b1; 

		#7 AC97_SDATA_IN = 1'b0; 

		#10 AC97_SDATA_IN = 1'b1; 

		#6 AC97_SDATA_IN = 1'b0; 

		#4 AC97_SDATA_IN = 1'b1; 

		#10 AC97_SDATA_IN = 1'b0; 

		#9 AC97_SDATA_IN = 1'b1; 

		#4 AC97_SDATA_IN = 1'b0; 

		#16 AC97_SDATA_IN = 1'b1; 

		#7 AC97_SDATA_IN = 1'b0; 

		#9 AC97_SDATA_IN = 1'b1; 

		#13 AC97_SDATA_IN = 1'b0; 

		#14 AC97_SDATA_IN = 1'b1; 

		#11 AC97_SDATA_IN = 1'b0; 

		#5 AC97_SDATA_IN = 1'b1; */

		end 

      
endmodule

