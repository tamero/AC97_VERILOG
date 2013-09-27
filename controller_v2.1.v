// Created by csrGen.pl, http://asics.chuckbenz.com 
// csrGenId: csrGen.pl,v 1.32 2004/09/16 23:59:48 cbenz Exp cbenz $ 
// from input revision: AC97controller.csrs,v 1.0 2013/08/01 Ozgur $



module AC97controller (clk, rst 
 ,csr_addr
 ,csr_data
 ,dmaw_irq
 ,dmar_irq
 ,rec
 ,play
 ,operation
 ,crreq
 ) ;


input clk, rst ;
input 		 dmaw_irq;
input 		 dmar_irq;
input 		 rec;
input 		 play;
input 		 operation;
output reg		 crreq;
output reg [13:0]	 csr_addr;
output reg [31:0]	 csr_data;
reg				 crreq_D;
reg	[13:0]	 csr_addr_D;
reg	[31:0]	 csr_data_D;
reg 	[31:0]	 DMA_adress_down = 0, DMA_adress_down_D;
reg 	[31:0]	 DMA_adress_up = 0, DMA_adress_up_D;
reg		[2:0]	dmar_counter, dmar_counter_D =0;
reg		[2:0]	dmaw_counter, dmaw_counter_D=0;
//reg			dmar=0;
//reg			dmaw=0;

// direct verilog code if needed


always @ (dmaw_irq
or crreq
or dmar_irq
or rec
or play
or operation
or DMA_adress_down
or DMA_adress_up
or dmar_counter
or dmaw_counter
or dmar_counter_D
or dmaw_counter_D
or csr_addr_D
or csr_data_D
or csr_addr
or csr_data
or clk
or rst
) begin
  
  if ( rst) begin
	 DMA_adress_down_D = 0 ;	 
	 DMA_adress_up_D=0;
	 dmar_counter_D=0;
	 dmaw_counter_D=0;
	end
	else
	begin
if (operation & play ) begin

case (dmar_counter)
0: begin // 0x0
  			crreq_D = 1'b1;
			csr_addr_D[13:0]= 14'h00;		//CSR Read mode csr data x...x01
			csr_data_D[31:0]= 32'h00000001 ;
	end
1: begin // 0x4
			crreq_D = 1'b1;
  			csr_addr_D[13:0]= 14'h14;
			csr_data_D[31:0]= DMA_adress_down;
	end
2: begin // 0x8
			crreq_D = 1'b1;
			csr_addr_D[13:0]= 14'h10;
			csr_data_D[31:0]= 32'h00000001;
	end
3: begin // 0x8
			crreq_D = 1'b0;
			DMA_adress_down_D=DMA_adress_down+3'b100;
	end
endcase
dmar_counter_D=dmar_counter+1'b1;
end

if (operation & rec ) begin

case (dmaw_counter)
0: begin // 0x0
  			crreq_D = 1'b1;
			csr_addr_D[13:0]= 14'h00;				//CSR Read mode csr data x...x11
			csr_data_D[1:0]= 32'h00000003 ;
	end
1: begin // 0x4
  			crreq_D = 1'b1;
			csr_addr_D[13:0]= 14'h24;
			csr_data_D[31:0]= DMA_adress_up;
	end
2: begin // 0x8
			crreq_D = 1'b1;
			csr_addr_D[13:0]= 14'h20;
			csr_data_D[0]= 32'h00000001;
	end
3: begin // 0x8
			crreq_D = 1'b0;
			DMA_adress_up_D=DMA_adress_up+3'b100;
	end
endcase
dmaw_counter_D=dmaw_counter+1'b1;
end
end
end

always @ (posedge clk or posedge rst)
  if ( rst) begin
    DMA_adress_down <= 0 ;
//  DMA_adress_down_D <= 0 ;	 
    DMA_adress_up <= 0 ;
//	 DMA_adress_up_D<=0;
	 csr_addr<=0;
	 csr_data<=0;
	 dmar_counter<=0;
	 dmaw_counter<=0;
//	 dmar_counter_D<=0;
//	 dmaw_counter_D<=0;
	 crreq<=0;
  end
  else begin
   crreq<=crreq_D;
	csr_addr<=csr_addr_D;
	csr_data<=csr_data_D;
	dmar_counter<=dmar_counter_D;
	dmaw_counter<=dmaw_counter_D;	
	if (!dmar_irq)
		begin
		DMA_adress_down<=DMA_adress_down_D;
		
		end
	else 
		dmar_counter<=0;
		
	
	if (!dmaw_irq)
		begin
		DMA_adress_up<=DMA_adress_up_D;
		end	
	else 
		dmaw_counter<=0;
		
  end
endmodule
