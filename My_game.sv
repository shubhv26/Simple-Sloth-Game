module My_game(input logic clk,rst,SW1,SW2,SW3,
					 output logic LEDR,LEDR2,LEDR3,LEDR4,LEDR5,LEDR6,LEDR7,LEDR8,LEDR9,LEDR10,
					 output logic HEX00,HEX01,HEX02,HEX03,HEX04,HEX05,HEX06,HEX07,
					 output logic HEX10,HEX11,HEX12,HEX13,HEX14,HEX15,HEX16,HEX17,
					 output logic HEX20,HEX21,HEX22,HEX23,HEX24,HEX25,HEX26,HEX27);
					 
reg [4:0]dig1,dig2,dig3;
reg [7:0]count1,count2,count3;
reg [26:0] counter1,counter2,counter3; // for 1ms delay
assign LEDR=rst; // to show reset light
assign LEDR2=SW1; // to show switch 1 light
assign LEDR3=SW2; // to show switch 2 light
assign LEDR4=SW3; // to show switch 3 light

assign LEDR6=0; // LED6-10 no use
assign LEDR7=0;
assign LEDR8=0;
assign LEDR9=0;
assign LEDR10=0;

always_ff@(posedge clk)
begin
	if(!rst)
	begin
		counter1<=0;
		dig1<=0;
	end
	
	else if(counter1==500000)
	begin
		counter1<=0;
		if(dig1<15)
		begin
			if(SW1==0)	
				dig1<=dig1+1;
			else
				dig1<=dig1+0;
		end				
		else
			dig1<=0;
	end
   else
		counter1<=counter1+1;
end

always_ff@(posedge clk)
begin
	if(!rst)
	begin
		counter2<=0;
		dig2<=0;
	end
	
	else if(counter2==500000)
	begin
		counter2<=0;
		if(dig2<15)
		begin
			if(SW2==0)	
				dig2<=dig2+1;
			else
				dig2<=dig2+0;
		end
		else
			dig2<=0;
	end
   else
		counter2<=counter2+1;
end

always_ff@(posedge clk)
begin
	if(!rst)
	begin
		counter3<=0;
		dig3<=0;
	end
	
	else if(counter3==500000)
	begin 
		counter3<=0;
		if(dig3<15)
		begin
			if(SW3==0)	
				dig3<=dig3+1;
			else
				dig3<=dig3+0;
		end
		else
			dig3<=0;
	end
   else
		counter3<=counter3+1;
end

always@(*) // an indication by making LED5 high if we get a match
begin
	if(SW1==1 && SW2==1 && SW3==1)
	begin
		if(dig1==dig2 && dig2==dig3)
			LEDR5<=1;
		else
			LEDR5<=0;
	end
	else
		LEDR5<=0;
end

always@(*)
begin
case(dig1) //include decimal point: eg 2.60--> 2 mins 60 secs...LSB--> DP value low
4'b0000 :  count1 = 8'b00000010; //0.
4'b0001 :  count1 = 8'b10011110; //1.
4'b0010 :  count1 = 8'b00100100; //2.
4'b0011 :  count1 = 8'b00001100; //3.
4'b0100 :  count1 = 8'b10011000; //4.
4'b0101 :  count1 = 8'b01001000; //5. 
4'b0110 :  count1 = 8'b01000000; //6.
4'b0111 :  count1 = 8'b00011110; //7.
4'b1000 :  count1 = 8'b00000000; //8.
4'b1001 :  count1 = 8'b00001000; //9.
4'b1010 :  count1 = 8'b00010000; //A.
4'b1011 :  count1 = 8'b11000000; //B.
4'b1100 :  count1 = 8'b01100010; //C.
4'b1101 :  count1 = 8'b10000100; //D.
4'b1110 :  count1 = 8'b01100000; //E.
4'b1111 :  count1 = 8'b01110000; //F.
endcase

case(dig2) //include decimal point: eg 2.60--> 2 mins 60 secs...LSB--> DP value low
4'b0000 :  count2 = 8'b00000010; //0.
4'b0001 :  count2 = 8'b10011110; //1.
4'b0010 :  count2 = 8'b00100100; //2.
4'b0011 :  count2 = 8'b00001100; //3.
4'b0100 :  count2 = 8'b10011000; //4.
4'b0101 :  count2 = 8'b01001000; //5. 
4'b0110 :  count2 = 8'b01000000; //6.
4'b0111 :  count2 = 8'b00011110; //7.
4'b1000 :  count2 = 8'b00000000; //8.
4'b1001 :  count2 = 8'b00001000; //9.
4'b1010 :  count2 = 8'b00010000; //A.
4'b1011 :  count2 = 8'b11000000; //B.
4'b1100 :  count2 = 8'b01100010; //C.
4'b1101 :  count2 = 8'b10000100; //D.
4'b1110 :  count2 = 8'b01100000; //E.
4'b1111 :  count2 = 8'b01110000; //F.
endcase

case(dig3) //include decimal point: eg 2.60--> 2 mins 60 secs...LSB--> DP value low
4'b0000 :  count3 = 8'b00000010; //0.
4'b0001 :  count3 = 8'b10011110; //1.
4'b0010 :  count3 = 8'b00100100; //2.
4'b0011 :  count3 = 8'b00001100; //3.
4'b0100 :  count3 = 8'b10011000; //4.
4'b0101 :  count3 = 8'b01001000; //5. 
4'b0110 :  count3 = 8'b01000000; //6.
4'b0111 :  count3 = 8'b00011110; //7.
4'b1000 :  count3 = 8'b00000000; //8.
4'b1001 :  count3 = 8'b00001000; //9.
4'b1010 :  count3 = 8'b00010000; //A.
4'b1011 :  count3 = 8'b11000000; //B.
4'b1100 :  count3 = 8'b01100010; //C.
4'b1101 :  count3 = 8'b10000100; //D.
4'b1110 :  count3 = 8'b01100000; //E.
4'b1111 :  count3 = 8'b01110000; //F.
endcase

end

assign HEX00 = count1[7];                
assign HEX01 = count1[6]; 
assign HEX02 = count1[5]; 
assign HEX03 = count1[4];
assign HEX04 = count1[3];
assign HEX05 = count1[2];
assign HEX06 = count1[1];
assign HEX07 = count1[0];

assign HEX10 = count2[7];                
assign HEX11 = count2[6]; 
assign HEX12 = count2[5]; 
assign HEX13 = count2[4];
assign HEX14 = count2[3];
assign HEX15 = count2[2];
assign HEX16 = count2[1];
assign HEX17 = count2[0];

assign HEX20 = count3[7];                
assign HEX21 = count3[6]; 
assign HEX22 = count3[5]; 
assign HEX23 = count3[4];
assign HEX24 = count3[3];
assign HEX25 = count3[2];
assign HEX26 = count3[1];
assign HEX27 = count3[0];
endmodule	
		
		   
