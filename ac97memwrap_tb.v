`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:13:57 09/09/2013
// Design Name:   ac97memwrap
// Module Name:   D:/Calisma_Klasorleri/OT/work_ozgur/ac97/design/mmac97/ac97memwrap_tb.v
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

module ac97memwrap_tb;

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

	initial begin
		// Initialize Inputs
		AC97_RST = 0;
		AC_97_BIT_CLK = 0;
		AC97_SDATA_IN = 0;
		play = 0;
		rec = 0;
		operate = 0;
		clk = 0;
		rst = 0;
	begin 

		clk = 1'b0; 

		forever #0.0125 clk = ~clk; 

	end 
	begin 

		rst = 1'b1; 

		#123 rst = 1'b0; 

	end
	
	begin 

		#0 AC97_SDATA_IN = 1'b1; 

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

		#5 AC97_SDATA_IN = 1'b1; 

		end 
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
			begin 

			play = 1'b0; 

			forever #100 

			play = ~play; 

			end 
	end
      
endmodule

