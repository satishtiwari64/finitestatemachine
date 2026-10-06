`timescale 1ns / 1ps
module fsm(
    input clk,reset,in,
    output reg out,
    output reg [1:0]state
    );
    always @(posedge clk , posedge reset)
    begin
    if(reset==1)state=2'b00;
    else
    begin 
    case(state)
                   2'b00: 
                   begin 
                   if(in) state<=2'b01;
                   else state<=2'b10;
                   end
                   2'b01: 
                   begin 
                   if(in) state<=2'b11;
                   else state<=2'b10;
                   end
                   2'b10: 
                   begin 
                   if(in) state<=2'b01;
                   else state<=2'b11;
                   end 
                   2'b11: 
                   begin 
                   if(in) state<=2'b01;
                   else state<=2'b10;
                   end
                   endcase
end end 
       
       
       always @(posedge clk,posedge reset)  
       begin
       if(reset==1) out<=0;
       else if(state==1) out<=1;
       else out<=0;
       end         
endmodule
