module Digitos_result (resultado, dres0, dres1, dres2, dres3, dres4, dres5);
	input [19:0] resultado;
	output reg [3:0] dres0;
	output reg [3:0] dres1;
	output reg [3:0] dres2;
	output reg [3:0] dres3;
	output reg [3:0] dres4;
	output reg [3:0] dres5;
	
	reg [19:0] Cresult;
	
	reg [3:0] i;
	
	always @(*)begin
		for (i='d0; i < 'd10; i = i + 'd1) begin
			if ((resultado - i) % 'd10 == 'd0)begin
				Cresult = (resultado - i)/'d10;
				dres0 = i;
			end
		end
		for (i='d0; i < 'd10; i = i + 'd1) begin
			if ((Cresult - i) % 'd10 == 'd0)begin
				Cresult = (Cresult - i)/'d10;
				dres1 = i;
			end
		end
		for (i='d100; i < 'd1_000; i = i + 'd100) begin
			if ((Cresult - i) % 'd1_000 == 'd0)begin
				Cresult = Cresult - i;
				dres2 = i;
			end
		end
		for (i='d1_000; i < 'd10_000; i = i + 'd1_000) begin
			if ((Cresult - i) % 'd10_000 == 'd0)begin
				Cresult = Cresult - i;
				dres3 = i;
			end
		end
		for (i='d10_000; i < 'd100_000; i = i + 'd10_000) begin
			if ((Cresult - i) % 'd100_000 == 'd0)begin
				Cresult = Cresult - i;
				dres4 = i;
			end
		end
		for (i='d100_000; i < 'd1_000_000; i = i + 'd100_000) begin
			if ((Cresult - i) % 'd1_000_000 == 'd0)begin
				Cresult = Cresult - i;
				dres5 = i;
			end
		end
	end
endmodule
