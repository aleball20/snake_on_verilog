module numbers (number_pixel, clock_25, number_count, selected_number);

/*per permettere la lettura dei numeri, le celle sono di dimensione 10x10 pixel. Quindi ogni quadrato ha 100 bit.
di conseguenza ogni figura è rappresentata con 200 bit (2 per ogni pixel). La lettura avviene partendo  
dalla coppie dei 2 MSB che rappresentano il pixel [1][1], per poi procedere leggendo il pixel successivo [2][1]
e cosi via. In uscita si ha un vettore di 2 bit raffigurante il colore del pixel selezionato */
input clock_25;
input [3:0] selected_number;   //Tramite selective decido quale numero prelevare dalla ROM
input [7:0]number_count;              
output [1:0]number_pixel;
reg [199:0] num[0:9];
reg [199:0] s;

initial begin

    
num[0] = 100'b00000101010101010000000100000000000001000100000000000000000101000000000000000001010000000000000000010100000000000000000101000000000000000001010000000000000000010001000000000000010000000101010101010000; // 0
num[1] = 100'b00000000000000000001000000000000000000010000000000000000000100000000000000000001000000000000000000010000000000000000000100000000000000000001000000000000000000010000000000000000000100000000000000000001;//1
num[2] = 100'b01010101010101010101000000000000000000010000000000000000000100000000000000000001000101010101010101000100000000000000000001000000000000000000010000000000000000000100000000000000000000010101010101010101; // 2
num[3] = 100'b01010101010101010100000000000000000000010000000000000000000100000000000000000001000000010101010101000000000000000000000100000000000000000001000000000000000000010000000000000000000101010101010101010100; // 3
num[4] = 100'b01000000000000000001010000000000000000010100000000000000000101000000000000000001010101010101010101010000000000000000000100000000000000000001000000000000000000010000000000000000000100000000000000000001; // 4
num[5] = 100'b01010101010101010101010000000000000000000100000000000000000001000000000000000000010101010101010101010000000000000000000100000000000000000001000000000000000000010000000000000000000101010101010101010101; // 5
num[6] = 100'b01010101010101010101010000000000000000000100000000000000000001000000000000000000010101010101010101010100000000000000000101000000000000000001010000000000000000010100000000000000000101010101010101010101; // 6
num[7] = 100'b01010101010101010101000000000000000000010000000000000000000100000000000000000001000001010101010101010000000000000000000100000000000000000001000000000000000000010000000000000000000100000000000000000001; // 7
num[8] = 100'b01010101010101010101010000000000000000010100000000000000000101000000000000000001010101010101010101010100000000000000000101000000000000000001010000000000000000010100000000000000000101010101010101010101; // 8
num[9] = 100'b01010101010101010101010000000000000000010100000000000000000101000000000000000001010000000000000000010101010101010101010100000000000000000001000000000000000000010000000000000000000100000000000000000001; // 9

end


always @ (posedge clock_25)
	begin
		s<= num[selected_number];
	end

assign number_pixel[0] = s[199-number_count];
assign number_pixel[1] = s[198-number_count];



endmodule