module Operacion (num1, num2, sig1, oper, resultado, signo_resultado);
	input [9:0]num1;
	input [9:0]num2;
	input sig1;
	input [1:0]oper;
	output reg [19:0] resultado;
	output reg [1:0] signo_resultado;
	
	always @(*)begin
		case(oper)
			'd0: begin	if (sig1 == 0) begin // Si num 1 es positivo
						resultado = num1 + num2;
						signo_resultado = 'd0;
					end else begin
						if (num1 > num2)begin
							resultado = num1 - num2;
							signo_resultado = 'd1;
						end else begin
							resultado = num2 - num1;
							signo_resultado = 'd0;
						end
					end
				end
			'd1: begin	if (sig1 == 1) begin // Si num1 es negativo
						resultado = num1 + num2;
						signo_resultado = 'd1;
					end else begin
						if (num2 > num1)begin
							resultado = num2 - num1;
							signo_resultado = 'd1;
						end else begin
							resultado = num1 - num2;
							signo_resultado = 'd0;
						end
					end
				end
			'd2: begin resultado = num1*num2;
							if (sig1 == 0) begin // Si num 1 es positivo
								signo_resultado = 'd0;
							end else signo_resultado = 'd1;
			end
			'd3: begin if(num1 % num2 == 0) begin
								resultado = num1/num2;
							
								if (sig1 == 0) begin // Si num 1 es positivo
									signo_resultado = 'd0;
								end else signo_resultado = 'd1;	
					
							end else signo_resultado = 'd2;
			end
		endcase
	
		
		
	end
	
	
	
endmodule
