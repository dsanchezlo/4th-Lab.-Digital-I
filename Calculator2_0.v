module Calculator2_0(clk, col, fil, Sseg, anodos);
	input clk;
	input [3:0] col;
	output [3:0] fil;
	output [6:0] Sseg;
	output [7:0] anodos;
	wire clk1kHz;
	wire [3:0]tecla;
	wire tipo;
	wire [20:0]Ssegnum1;
	wire [20:0]Ssegnum2;
	wire [6:0]signo1;
	wire [6:0]operador;
	
	//Guarda el valor ingresado con la tecla
	wire [6:0] CSseg;
	
	//Divide la freq del relog de 50MHz a 1kHz
	divfreq div(clk, clk1kHz);
	
	Barrido_filas barfil(clk1kHz, fil);
	Comparador_col comp(fil, col, tecla, tipo);
	
	Conversor print(tecla, tipo, CSseg);
	
	Barrido_displays bardisp(CSseg, tipo, clk1kHz, Sseg, anodos, Ssegnum1, Ssegnum2, signo1, operador);
	
	Ssegtobin convsegtobin(Ssegnum1, Ssegnum2, signo1, operador, num1, num2, sig1, sig2);
	
endmodule 