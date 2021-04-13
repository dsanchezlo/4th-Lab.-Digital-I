module Barrido_displays(CSseg, tipo, clk1kHz, Sseg, anodos, Ssegnum1, Ssegnum2, signo1, operador);
	input [6:0] CSseg;
	input tipo;
	input clk1kHz;
	output reg [6:0] Sseg;
	output reg [7:0] anodos;
	output reg [20:0] Ssegnum1;
	output reg [20:0] Ssegnum2;
	output reg [6:0] signo1;
	output reg [6:0] operador;
	
	//Guardan el valor (En 7seg) que toma cada display
	reg [6:0] Sseg0;
	reg [6:0] Sseg1;
	reg [6:0] Sseg2;
	reg [6:0] Sseg3;
	reg [6:0] Sseg4;
	reg [6:0] Sseg5;
	reg [6:0] Sseg6;
	reg [6:0] Sseg7;
	
	//Recorrer los 8 displays
	reg [2:0]contadorbar;
	
	//Guarda la posicion actual de los displays
	reg [2:0]contadorpos;
	
	parameter [6:0] nul = 7'b1111111;
	
	//Inicializar registros
	initial begin
		contadorbar = 3'b0;
		Sseg0 = nul;
		Sseg1 = nul;
		Sseg2 = nul;
		Sseg3 = nul;
		Sseg4 = nul;
		Sseg5 = nul;
		Sseg6 = nul;
		Sseg7 = nul;
		contadorpos = 3'b0;
	end
	
	always @(posedge clk1kHz) begin
		contadorbar = contadorbar + 1'b1;
		case(contadorbar)
			3'b000: begin anodos = 8'b11111110; Sseg = Sseg0; end
			3'b001: begin anodos = 8'b11111101; Sseg = Sseg1; end
			3'b010: begin anodos = 8'b11111011; Sseg = Sseg2; end
			3'b011: begin anodos = 8'b11110111; Sseg = Sseg3; end
			3'b100: begin anodos = 8'b11101111; Sseg = Sseg4; end
			3'b101: begin anodos = 8'b11011111; Sseg = Sseg5; end
			3'b110: begin anodos = 8'b10111111; Sseg = Sseg6; end
			3'b111: begin anodos = 8'b01111111; Sseg = Sseg7; end
		endcase
		
	end
	
	always @(CSseg) begin
		
		case(contadorpos)
			3'b000: if (tipo == 0)begin 
						   Sseg7 = (CSseg == 7'b1101100) ? 7'b1111111:CSseg; 
					  end
			3'b001: if (tipo == 1)begin
							Sseg6 = CSseg;
					  end else begin
							contadorpos = contadorpos - 3'd1;
					  end
			3'b010: if (tipo == 1)begin
							Sseg5 = CSseg;
					  end else begin
							contadorpos = contadorpos - 3'd1;
					  end
			3'b011: if (tipo == 1) begin
							Sseg4 = CSseg;
					  end else begin
							contadorpos = contadorpos - 3'd1;
					  end
			3'b100: if (tipo == 0) begin
							Sseg3 = CSseg;
					  end else begin
							contadorpos = contadorpos - 3'd1;
					  end
			3'b101: if (tipo == 1) begin
							Sseg2 = CSseg;
					  end else begin
							contadorpos = contadorpos - 3'd1;
					  end
			3'b110: if (tipo == 1) begin
							Sseg1 = CSseg;
					  end else begin
							contadorpos = contadorpos - 3'd1;
					  end
			3'b111: begin 
					  if (tipo == 1) begin
							Sseg0 = CSseg;
					  end else begin
							contadorpos = contadorpos - 3'd1;
					  end 
					  signo1 = Sseg7;
					  Ssegnum1[20:14] = Sseg6;
					  Ssegnum1[13:7] = Sseg5;
					  Ssegnum1[6:0] = Sseg4;
					  operador = Sseg3;
					  Ssegnum2[20:14] = Sseg2;
					  Ssegnum2[13:7] = Sseg1;
					  Ssegnum2[6:0] = Sseg0;
					  end
		endcase 
		
		contadorpos = contadorpos + 3'd1;
	end
	
endmodule 

