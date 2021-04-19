module Digitos_result (resultado, dres);
	input [19:0] resultado;
	output reg [23:0] dres;
	
	always @(*)begin
		if (resultado >= 1'd0 && resultado <= 4'd9)begin
			dres[3:0] = resultado[3:0];
			dres[7:4] = 'd0;
			dres[11:8] = 'd0;
			dres[15:12] = 'd0;
			dres[19:16] = 'd0;
			dres[23:20] = 'd0;
		end

		if (resultado >= 'd10 && resultado <= 'd19)begin
			dres[3:0] = resultado - 'd10;
			dres[7:4] = 'd1;
			dres[11:8] = 'd0;
			dres[15:12] = 'd0;
			dres[19:16] = 'd0;
			dres[23:20] = 'd0;
		end 

		if (resultado >= 5'd20 && resultado <= 5'd29) begin 
			dres[3:0] = resultado - 'd20;
			dres[7:4] = 'd2;
			dres[11:8] = 'd0;
			dres[15:12] = 'd0;
			dres[19:16] = 'd0;
			dres[23:20] = 'd0;
		end

		if (resultado >= 5'd30 && resultado <= 6'd39) begin
			dres[3:0] = resultado - 'd30;
			dres[7:4] = 'd3;
			dres[11:8] = 'd0;
			dres[15:12] = 'd0;
			dres[19:16] = 'd0;
			dres[23:20] = 'd0;
		end

		if (resultado >= 6'd40 && resultado <= 6'd49) begin
			dres[3:0] = resultado - 'd40;
			dres[7:4] = 'd4;
			dres[11:8] = 'd0;
			dres[15:12] = 'd0;
			dres[19:16] = 'd0;
			dres[23:20] = 'd0;	
		end

		if (resultado >= 6'd50 && resultado <= 6'd59) begin
			dres[3:0] = resultado - 'd50;
			dres[7:4] = 'd5;
			dres[11:8] = 'd0;
			dres[15:12] = 'd0;
			dres[19:16] = 'd0;
			dres[23:20] = 'd0;
		end

		if (resultado >= 6'd60 && resultado <= 7'd69) begin
			dres[3:0] = resultado - 'd60;
			dres[7:4] = 'd6;
			dres[11:8] = 'd0;
			dres[15:12] = 'd0;
			dres[19:16] = 'd0;
			dres[23:20] = 'd0;	
		end
		
		if (resultado >= 6'd70 && resultado <= 7'd79) begin
			dres[3:0] = resultado - 'd70;
			dres[7:4] = 'd7;
			dres[11:8] = 'd0;
			dres[15:12] = 'd0;
			dres[19:16] = 'd0;
			dres[23:20] = 'd0;	
		end
		
		if (resultado >= 6'd80 && resultado <= 7'd89) begin
			dres[3:0] = resultado - 'd80;
			dres[7:4] = 'd8;
			dres[11:8] = 'd0;
			dres[15:12] = 'd0;
			dres[19:16] = 'd0;
			dres[23:20] = 'd0;	
		end
		
		if (resultado >= 6'd90 && resultado <= 7'd99) begin
			dres[3:0] = resultado - 'd90;
			dres[7:4] = 'd9;
			dres[11:8] = 'd0;
			dres[15:12] = 'd0;
			dres[19:16] = 'd0;
			dres[23:20] = 'd0;	
		end
		
	end
endmodule
