//Name: Jehad Hamayel 
//ID: 1200348		
//Sec: 1
`timescale 1 ns / 1 ps
//Definition of constants
//colors
`define Green 2'b00
`define Yellow 2'b01	
`define Red 2'b10
`define Red_Yellow 2'b11
//states
`define  S0 5'b00000
`define	 S1 5'b00001
`define	 S2 5'b00010
`define	 S3 5'b00011
`define	 S4 5'b00100
`define	 S5 5'b00101
`define	 S6 5'b00110
`define	 S7 5'b00111
`define	 S8 5'b01000
`define	 S9 5'b01001
`define S10 5'b01010
`define S11 5'b01011
`define S12 5'b01100
`define S13 5'b01101
`define S14 5'b01110
`define S15 5'b01111
`define S16 5'b10000
`define S17 5'b10001


// The main module 	 TrafficLight
module TrafficLight (clk,go,rst,High1,High2,Farm1,Farm2);
	parameter n=5;
   input clk ,rst,go;
   output [1:0]High1,High2,Farm1,Farm2;
   reg [4:0]prestate,nexstate;
   reg [n-1:0] counter;
   reg [1:0]High1,High2,Farm1,Farm2;
   	//Assign initial values to variables
   initial counter=0;
   initial nexstate = `S0;

//The always statement does every posedge clk or changes the value of rst so that if the value of rst is equal to one 
//it returns to the first state and makes the counter zero,and if the value of rst is zero it takes the next state
//cycles between states, so that when it finishes one it moves to the next 
//when the time allotted to the state expires.
//And gives in each state the values of the state of the lights signals
always@(posedge clk, rst,go)
	 begin
	  if(rst)
			begin
				prestate = `S0;
				counter = 0;
				nexstate= `S0	;
			end	
		else
			 prestate=nexstate;
		case(prestate)	
			`S0:	 
			begin 	
				High1 = `Red ;
				High2 = `Red ;
				Farm1 = `Red ;
				Farm2 = `Red ;
/*
The counter works. If the counter does not reach the number to be counted, it continues to rotate in a loop. If the Go is equal to one, it continues to run.
If GO is zero the time becomes frozen,and when rst is equal to 1 the next state is S0 otherwise it works normally,
	when it reaches the number to be calculated it goes to the next
*/
			while (go == 1 && counter != 1 )
				begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0; break;end 
					#1 counter = counter +1; 
 				end
				if(counter == 1 ) 
					begin	
						nexstate=`S1;
						counter=0;
					end
				
			end
			`S1:
			begin
				High1 = `Red_Yellow ;
				High2 = `Red_Yellow ;
				Farm1 = `Red ;
				Farm2 = `Red ;	
				while (go == 1 && counter != 2  )
					begin
				 	if(rst)
						 begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end 
				if(counter == 2 ) 
					begin
						nexstate=`S2;
						counter=0;
					end
			end
			`S2:
			begin
				High1 = `Green ;
				High2 = `Green ;
				Farm1 = `Red ;
				Farm2 = `Red ;
				while (go == 1 && counter != 30  )
					begin
				 	if(rst)
						  begin counter=0;nexstate=`S0; break;end 	
					#1 counter = counter +1; 
 				end 
					
				if(counter == 30 ) 
					begin
						nexstate=`S3;
						counter=0;
					end
			end
			`S3:	 
			begin
				High1 = `Green ;
				High2 = `Yellow ;
				Farm1 = `Red ;
				Farm2 = `Red ;
				while (go == 1 && counter != 2  )
					begin
				 	if(rst)
						 begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end 
					
				if(counter == 2 ) 
					begin	
						nexstate=`S4;
						counter=0;
					end
			end	
			`S4:	
			begin
				High1 = `Green ;
				High2 = `Red ;
				Farm1 = `Red ;
				Farm2 = `Red ;
				while (go == 1 && counter != 10  )
						begin
				 	if(rst)
						 begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end 
					
				if(counter == 10 ) 
					begin	
						nexstate=`S5;
						counter=0;
					end
			end
			`S5:
			begin
				High1 = `Yellow ;
				High2 = `Red ;
				Farm1 = `Red ;
				Farm2 = `Red ;
				while (go == 1 && counter != 2  )
						begin
				 	if(rst)
						 begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end 
					
				if(counter == 2 ) 
					begin			
						nexstate=`S6;
						counter=0;
					end
			end
			`S6:
			begin
				High1 = `Red ;
				High2 = `Red ;
				Farm1 = `Red ;
				Farm2 = `Red ;
				while (go == 1 && counter != 1  )
						begin
				 	if(rst)
						begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end 
					
				if(counter == 1 ) 
					begin		
						nexstate=`S7;
						counter=0;
					end
			end
			`S7:
			begin
				High1 = `Red ;
				High2 = `Red ;
				Farm1 = `Red_Yellow ;
				Farm2 = `Red_Yellow ;
				while (go == 1 && counter != 2  )
						begin
				 	if(rst)
						 begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end 
					
				if(counter == 2 ) 
					begin	
						nexstate=`S8;
						counter=0;
					end
			end
			`S8:
			begin 
				High1 = `Red ;
				High2 = `Red ;
				Farm1 = `Green ;
				Farm2 = `Green ;
				while (go == 1 && counter != 15   )
						begin
				 	if(rst)
						 begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end
					
				if(counter == 15 ) 
					begin	
						nexstate=`S9;
						counter=0;
					end
			end
			`S9:
			begin
				High1 = `Red ;
				High2 = `Red ;
				Farm1 = `Green ;
				Farm2 = `Yellow ;
				while (go == 1 && counter != 2  )
						begin
				 	if(rst)
						 begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end 
					
				if(counter == 2 ) 
					begin		
						nexstate=`S10;
						counter=0;
					end
			end
			`S10:
			begin
				High1 = `Red ;
				High2 = `Red ;
				Farm1 = `Green ;
				Farm2 = `Red ;
				while (go == 1 && counter != 5   )
						begin
				 	if(rst)
						 begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end
					
				if(counter == 5 ) 
					begin	
						nexstate=`S11;
						counter=0;
					end
			end
			`S11:
			begin
				High1 = `Red ;
				High2 = `Red ;
				Farm1 = `Yellow ;
				Farm2 = `Red_Yellow ;
				while (go == 1 && counter != 2 )
						begin
				 	if(rst)
						 begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end 
					
				if(counter == 2 ) 
					begin		
						nexstate=`S12;
						counter=0;
					end
			end
			`S12:
			begin 
				High1 = `Red ;
				High2 = `Red ;
				Farm1 = `Red ;
				Farm2 = `Green ;
				while (go == 1 && counter != 10  )
						begin
				 	if(rst)
						begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end 
					
				if(counter == 10 ) 
					begin							
						nexstate=`S13;
						counter=0;
					end
			end
			`S13:
			begin
				High1 = `Red ;
				High2 = `Red ;
				Farm1 = `Red ;
				Farm2 = `Yellow ;
				while (go == 1 && counter != 2  )
						begin
				 	if(rst)
						 begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end
					
				if(counter == 2 ) 
					begin
						nexstate=`S14;
						counter=0;
					end
			end
			`S14:
			begin 
				High1 = `Red ;
				High2 = `Red ;
				Farm1 = `Red ;
				Farm2 = `Red ;
				while (go == 1 && counter != 1  )
						begin
				 	if(rst)
						 begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end 
					
				if(counter == 1 ) 
					begin							
						nexstate=`S15;
						counter=0;
					end
			end
			`S15:
			begin
				High1 = `Red ;
				High2 = `Red_Yellow ;
				Farm1 = `Red ;
				Farm2 = `Red ;
				while (go == 1 && counter != 2  )
						begin
				 	if(rst)
						 begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end 
					
				if(counter == 2 ) 
					begin	
						nexstate=`S16;
						counter=0;
					end
			end
			`S16:
			begin
				High1 = `Red ;
				High2 = `Green ;
				Farm1 = `Red ;
				Farm2 = `Red ;
				while (go == 1 && counter != 15  )
						begin
				 	if(rst)
						begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end 
					
				if(counter == 15 ) 
					begin							
						nexstate=`S17;
						counter=0;
					end
			end
			`S17:
			begin
				High1 = `Red ;
				High2 = `Yellow ;
				Farm1 = `Red ;
				Farm2 = `Red ;
				while (go == 1 && counter != 3  )
						begin
				 	if(rst)
						 begin counter=0;nexstate=`S0; break;end 
					#1 counter = counter +1; 
 				end
					
				if(counter == 3 ) 
					begin		
						nexstate=`S0;
						counter=0;
					end
			end
		endcase
	 end 
	 		 		
endmodule
//The test_generator creates a special address in the memory 
//that contains the correct data that we want to verify that things are going correctly.
module test_generator (clk,go,rst,addressOfPreStats); 
  parameter n =5;
  input clk,go,rst;
  output [4:0] addressOfPreStats;
  reg [4:0]addressOfPreStats,prestate,nexstate;
  reg [n-1:0] counter;
  //Assign initial values to variables
  initial counter=0;
  initial nexstate=`S0;
//The always statement cycles between states, so that when it finishes one it moves to the next 
//when the time allotted to the state expires.
//In each case, it gives the address value of the memory data
 
  always@(posedge clk, rst,go)
  begin	
	  if(rst)
			begin	
				prestate=`S0; 
				counter=0;
				nexstate= `S0	;
			end	
		else
			prestate=nexstate;
		case(prestate)	
			`S0:	 
			begin 
				addressOfPreStats=prestate;
/*
The counter works. If the counter does not reach the number to be counted, it continues to rotate in a loop. If the Go is equal to one, it continues to run.
If GO is zero the time becomes frozen,and when rst is equal to 1 the next state is S0 otherwise it works normally,
	when it reaches the number to be calculated it goes to the next
*/
					while (go == 1 && counter != 1  )	
						begin
				 	if(rst)
						 begin   counter = 0;nexstate= `S0; break ;	end	
					#1 counter = counter +1; 
 				end 
				if(counter == 1 ) 
					begin
						nexstate=`S1;
						counter=0;
					end
			end
			`S1:
			begin
				addressOfPreStats=prestate;	
				while (go == 1 && counter != 2   )
					begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end
				if(counter == 2 ) 
					begin
						nexstate=`S2;
						counter=0;
					end
			end
			`S2:
			begin
				
				addressOfPreStats=prestate;
				while (go == 1 && counter != 30  )
					begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 30 ) 
					begin
							
						nexstate=`S3;
						counter=0;
					end
			end
			`S3:	 
			begin
				addressOfPreStats=prestate;
				while (go == 1 && counter != 2  )
					begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 2 ) 
					begin	
						nexstate=`S4;
						counter=0;
					end
			end	
			`S4:	
			begin
				addressOfPreStats=prestate;
				while (go == 1 && counter != 10 )
						begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 10 ) 
					begin	
						nexstate=`S5;
						counter=0;
					end
			end
			`S5:
			begin
				addressOfPreStats=prestate;
				while (go == 1 && counter != 2 )
						begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 2 ) 
					begin			
						nexstate=`S6;
						counter=0;
					end
			end
			`S6:
			begin
				addressOfPreStats=prestate;
				while (go == 1 && counter != 1  )
						begin
				 	if(rst)
						begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 1 ) 
					begin		
						nexstate=`S7;
						counter=0;
					end
			end
			`S7:
			begin
				addressOfPreStats=prestate;
				while (go == 1 && counter != 2 )
						begin
				 	if(rst)
						begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 2 ) 
					begin	
						nexstate=`S8;
						counter=0;
					end
			end
			`S8:
			begin 
				addressOfPreStats=prestate;
				while (go == 1 && counter != 15  )
						begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end
					
				if(counter == 15 ) 
					begin	
						nexstate=`S9;
						counter=0;
					end
			end
			`S9:
			begin
				addressOfPreStats=prestate;
				while (go == 1 && counter != 2  )
						begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 2 ) 
					begin		
						nexstate=`S10;
						counter=0;
					end
			end
			`S10:
			begin
				addressOfPreStats=prestate;
				while (go == 1 && counter != 5 )
						begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 5 ) 
					begin	
						nexstate=`S11;
						counter=0;
					end
			end
			`S11:
			begin
				addressOfPreStats=prestate;
				while (go == 1 && counter != 2  )
						begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 2 ) 
					begin		
						nexstate=`S12;
						counter=0;
					end
			end
			`S12:
			begin 
				addressOfPreStats=prestate;
				while (go == 1 && counter != 10  )
						begin
				 	if(rst)
						begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 10 ) 
					begin							
						nexstate=`S13;
						counter=0;
					end
			end
			`S13:
			begin
				addressOfPreStats=prestate;
				while (go == 1 && counter != 2  )
						begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 2 ) 
					begin
						nexstate=`S14;
						counter=0;
					end
			end
			`S14:
			begin 
				addressOfPreStats=prestate;
				while (go == 1 && counter != 1  )
						begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 1 ) 
					begin							
						nexstate=`S15;
						counter=0;
					end
			end
			`S15:
			begin
				addressOfPreStats=prestate;
				while (go == 1 && counter != 2  )
						begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 2 ) 
					begin	
						nexstate=`S16;
						counter=0;
					end
			end
			`S16:
			begin
				addressOfPreStats=prestate;
				while (go == 1 && counter != 15  )
						begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 15 ) 
					begin							
						nexstate=`S17;
						counter=0;
					end
			end
			`S17:
			begin
				addressOfPreStats=prestate;
				while (go == 1 && counter != 3  )
						begin
				 	if(rst)
						 begin counter = 0;nexstate= `S0;   break ;	end
					#1 counter = counter +1; 
 				end 
					
				if(counter == 3 ) 
					begin		
						nexstate=`S0;
						counter=0;
					end
			end
		endcase  
  end
endmodule 

//rom contains the original and correct data that we want to compare with the output from the module under test
module rom(addressOfPreStats,Trafficdata);
input [4:0] addressOfPreStats;
output [7:0] Trafficdata;
reg [7:0] memory [0:17] =
					'{
					//Every two bits is data for the state of a traffic light for a specific road
					//High1	High2 Farm1 Farm2
					//10    10    10    10
					8'b10101010,//red red red red
					8'b11111010,//Red-Yellow Red-Yellow	Red	Red
					8'b00001010,
					//High1	High2 Farm1 Farm2
					//00    01    10    10
					8'b00011010,
					8'b00101010,
					8'b01101010,
					8'b10101010,
					8'b10101111,
					8'b10100000,
					8'b10100001,
					8'b10100010,
					8'b10100111,
					8'b10101000,
					8'b10101001,
					8'b10101010,
					8'b10111010,
					8'b10001010,
					8'b10011010
					};
reg [7:0] Trafficdata;	
//The always statement works whenever the value of the address from which we want to read the data changes.
always@(addressOfPreStats)
	begin 
		Trafficdata = memory[addressOfPreStats]; 
	end 
endmodule
//A special module for examining and comparing data from memory and from the module to be checked,
//and if there is an error, a message appears
module Analyzer(Trafficdata,High1,High2,Farm1,Farm2,rest);
 input rest;
 input [7:0]Trafficdata;
 input [1:0]High1,High2,Farm1,Farm2;
 reg[1:0]w1,w2,w3,w4; //registers to store the colors from the rom
 reg[5:0] countWhichState=0; //registers to store in which state the system in
 reg flagCount=0,flagCount2=0; //Flags to organize the shape of the print 
 always@(Trafficdata  or rest)
	 begin
	 if (countWhichState == 18 || rest==1  )//A conditional statement in order to choose which state the system is in
	 	countWhichState=0;
	 if(flagCount2==1 && High1==`Red &&   High2==`Red &&  Farm1==`Red &&  Farm2 ==`Red)	//A conditional statement to put state0 in its proper place because of a particular case
		countWhichState=0; 
	 if(countWhichState < 18 && rest==0 && flagCount!=0)//Conditional statement for correct typing for the user
		 begin
	 countWhichState=countWhichState % 18;//In order to choose states from 0 to 17	
	 //	Store data in registers for comparison
	 w1=Trafficdata[7:6];
	 w2=Trafficdata[5:4];
	 w3=Trafficdata[3:2];
	 w4=Trafficdata[1:0];  
	 $display("state = %d High1 from ROM = %b High1 = %b High2 from ROM = %b High2 = %b Farm1 from ROM = %b Farm1 = %b Farm2 from ROM = %b Farm2 = %b  at a time = %0d ",countWhichState,w1, High1, w2 ,High2 , w3 , Farm1 ,w4 , Farm2,$time);
	 countWhichState=countWhichState+1;
	// If the data is equal, it means that the test succeeded If it is not working, it prints that it failed and then finish the program
	 if (w1== High1 &&  w2== High2 && w3 == Farm1 && w4 == Farm2 )
			$display("The test sucsses");
  else	
	begin
		$display("The test faile");
	 	$finish;
	end
  end 
  //Conditional sentences for correct printing
  if(flagCount==0 )
	  flagCount=1;
	if(rest==1)
		flagCount2=1;
	  end
endmodule

module TrafficLight_test;	
 //Declarations of test inputs and outputs 
reg go, clk, rst;
wire [1:0]High1 ,High2,Farm1,Farm2;
wire [4:0] addressOfPreStats;
wire [7:0]Trafficdata;
//Call test_generator module and give it inputs and outputs
test_generator Tg(clk,go,rst,addressOfPreStats);
defparam Tg.n=5;  //Give a value to its own parameter
 //Call rom module and give it input and output 
rom memo(addressOfPreStats,Trafficdata);
//Call TrafficLight module and give it inputs and outputs
TrafficLight circuit(clk,go,rst,High1,High2,Farm1,Farm2);
defparam circuit.n=5;//Give a value to its own parameter
//Call Analyzer module and give it inputs and outputs
Analyzer a(Trafficdata,High1,High2,Farm1,Farm2,rst);
//Give clk values and change it every 0.5 units of time
initial clk = 1;	
always #0.5 clk = ~clk;
initial #220 $finish;
 initial
	begin
	rst=0;
	go = 1;
	end	
			
endmodule 