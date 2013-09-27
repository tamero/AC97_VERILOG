`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:27 07/16/2013 
// Design Name: 
// Module Name:    ac97memwrap 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
`include "ram_wb_defines.v"
module ac97memwrap(
    input AC97_RST,
    output AC97_SDATA_OUT,
    output AC97_SYNC,
    input AC_97_BIT_CLK,
    input AC97_SDATA_IN,
	 input play,
	 input rec,
	 input operate,
	 input clk,
	 input rst
    );
	 

   parameter adr_width = `RAM_WB_ADR_WIDTH;

// Local Wires
//
 // wishbone signals
wire	[15:0]	out_slt0;
  
wire [31:0]          dat_i;
wire [31:0]         	dat_o;
wire [adr_width-1:0] adr_i;
wire 		 				we_i;
wire [3:0] 		 		sel_i;
wire 		 				cyc_i;
wire 		 				stb_i;
wire 		 				ack;
wire 		 				cti;
wire [31:0]				csr_dat;
wire [13:0]				csr_adr;
wire						dmar;
wire						dmaw;
wire						crreq;





// Modules
//

ac97 u0(
	.sys_clk(clk), 
	.sys_rst(rst),	
	

	.wbm_dat_i(dat_o), 
	.wbm_dat_o(dat_i), 
	.wbm_adr_o(adr_i[adr_width-1:0]), 
	.wbm_we_o(we_i), 
	.wbm_cyc_o(cyc_i),
	.wbm_stb_o(stb_i), 
	.wbm_ack_i(ack), 
	.wbm_cti_o(cti), 
	
/* Control interface */
	.csr_a(csr_adr), 
	.csr_we(rec), 
	.csr_di(csr_dat),
	.csr_do(/*wire*/),
	
	/* Interrupts */
	.crrequest_irq(),//crreq),
	.crreply_irq(),
	.dmar_irq(dmar),
	.dmaw_irq(dmaw),
	
	/*WB DMA */
	.ac97_clk(AC_97_BIT_CLK), 
	.ac97_sync(AC97_SYNC), 
	.ac97_sout(AC97_SDATA_OUT), 
	.ac97_sin(AC97_SDATA_IN), 
	.ac97_rst_n(AC97_RST)
	);
	
ram_wb u1( 
	.dat_i(dat_i), 
	.dat_o(dat_o), 
	.adr_i(adr_i), 
	.we_i(we_i), 
//	.sel_i(sel_i), 
	.cyc_i(cyc_i), 
	.stb_i(stb_i), 
	.ack_o(ack), 
	.cti_i(cti), 
	.clk_i(clk), 
	.rst_i(rst)
);

AC97controller u2(
	.clk(clk), 
	.rst(rst),
	.csr_addr(csr_adr),
	.csr_data(csr_dat),
	.dmaw_irq(dmaw),
	.dmar_irq(dmar),
	.rec(rec),
	.play(play),
	.operation(operate),
	.crreq(crreq)
 );


endmodule
