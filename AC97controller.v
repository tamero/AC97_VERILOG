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
 ) ;


input clk, rst ;
input 		 dmaw_irq;
input 		 dmar_irq;
input 		 rec;
input 		 play;
input 		 operation;
output reg	[13:0]	 csr_addr;
output reg	[31:0]	 csr_data;
reg			dmar=0;
reg			dmaw=0;
reg			csr_addr_D, csr_dat_D;

//Define parameters
reg [31:0]	 DMA_adress_down=0;
reg [31:0]	 DMA_adress_up=0;
// direct verilog code if needed


always @ (clk or rst or dmaw_irq or dmar_irq or rec or play or operation) begin //posedge clk) begin
  
if (operation & play & ! rec)
	begin
	if (!dmar)
		begin
		dmar = dmar_irq;
		 
		csr_addr= 14'h00;
		csr_data[0]= 1'b1 ;
		csr_data[1]= 1'b1 ;

		csr_addr[13:0]= 14'h24;
		csr_data[31:0]= DMA_adress_up;

		csr_addr[13:0]= 14'h20;
		csr_data[31:0]= 1;
		
		end
	else
		begin
		DMA_adress_up=DMA_adress_up+3'b100;
		dmar = 1'b0;
		end
end

else if (operation & ! play & rec)
	begin
		if (!dmaw)
			begin
			dmaw = dmaw_irq;

			csr_addr[13:0]= 14'h00;
			csr_data[0]= operation ;
			csr_data[1]= 1'b1;

			csr_addr[13:0]= 14'h14;
			csr_data[31:0]= DMA_adress_down;

			csr_addr[13:0]= 14'h10;
			csr_data[0]= 1;
			end	
		else
			begin
			DMA_adress_down=DMA_adress_down+3'b100;
			dmaw = 1'b0;
			end
	end
else
	DMA_adress_down=DMA_adress_down;
end
endmodule