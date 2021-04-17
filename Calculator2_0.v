module Calculator2_0(clk, col, fil, Sseg, anodos);
	input clk;
	input [3:0] col;
	output [3:0] fil;
	output [6:0] Sseg;
	output [7:0] anodos;
	wire clk1kHz;
	wire [3:0]tecla;
	wire tipo;
	wire [3:0]pulsacion;
	wire [20:0]Ssegnum1;
	wire [20:0]Ssegnum2;
	wire [6:0]signo1;
	wire [6:0]operador;
	wire [9:0]num1;
	wire [9:0]num2;
	wire sig1;
	wire [1:0]oper;
	wire [19:0]resultado;
	wire signo_resultado;
	wire [3:0] dres0;
	wire [3:0] dres1;
	wire [3:0] dres2;
	wire [3:0] dres3;
	wire [3:0] dres4;
	wire [3:0] dres5;	

	//Guarda el valor ingresado con la tecla
	wire [6:0] CSseg;
	
	//Divide la freq del relog de 50MHz a 1kHz
	divfreq div(clk, clk1kHz);
	
	Barrido_filas barfil(clk1kHz, fil);
	Comparador_col comp(fil, col, tecla, tipo, pulsacion);
	
	Conversor print(tecla, tipo, CSseg);
	
	Barrido_displays bardisp(pulsacion, CSseg, tipo, clk1kHz, dres0, dres1, dres2, dres3, dres4, dres5, signo_resultado, Sseg, anodos, Ssegnum1, Ssegnum2, signo1, operador);
	
	/*Ssegtobin convsegtobin(Ssegnum1, Ssegnum2, signo1, operador, num1, num2, sig1, oper);
	
	Operacion op(num1, num2, sig1, oper, resultado, signo_resultado);
	
	Digitos_result digres(resultado, dres0, dres1, dres2, dres3, dres4, dres5);*/
	
endmodule
