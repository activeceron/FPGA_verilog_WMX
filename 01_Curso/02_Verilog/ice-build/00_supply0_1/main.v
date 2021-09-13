// Code generated by Icestudio 0.7.1w202108130708

`default_nettype none

//---- Top entity
module main (
 input vee5673,
 output vcbcc41,
 output [0:6] vinit
);
 wire w0;
 wire w1;
 wire w2;
 wire w3;
 assign w2 = vee5673;
 assign vcbcc41 = w3;
 main_ve71416 ve71416 (
  .uno(w1)
 );
 main_v79f6a0 v79f6a0 (
  .cero(w0)
 );
 v5cc6ec v53a3a2 (
  .vb186da(w0),
  .v381ebf(w1),
  .v50d6c6(w2),
  .vc93bbe(w3)
 );
 assign vinit = 7'b0000000;
endmodule

/*-------------------------------------------------*/
/*--   */
/*-- - - - - - - - - - - - - - - - - - - - - - - --*/
/*-- 
/*-------------------------------------------------*/
//---- Top entity
module v5cc6ec (
 input vb186da,
 input v381ebf,
 input v50d6c6,
 output vc93bbe
);
 wire w0;
 wire w1;
 wire w2;
 wire w3;
 assign w0 = v50d6c6;
 assign vc93bbe = w1;
 assign w2 = v381ebf;
 assign w3 = vb186da;
 v5cc6ec_ve4e0df ve4e0df (
  .sel(w0),
  .o(w1),
  .i0(w2),
  .i1(w3)
 );
endmodule

/*-------------------------------------------------*/
/*-- Mux 2 a 1  */
/*-- - - - - - - - - - - - - - - - - - - - - - - --*/
/*-- Multiplexor de 2 a 1
/*-------------------------------------------------*/

module v5cc6ec_ve4e0df (
 input i1,
 input i0,
 input sel,
 output o
);
 //-- Multiplexor de 2 a 1, 
 //-- de 8 bits
 
 reg _o;
 
 always @(*) begin
     case(sel)
         0: _o = i0;
         1: _o = i1;
         default: _o = i0;
     endcase
 end
 
 assign o = _o;
 
endmodule

module main_ve71416 (
 output uno
);
 
 supply1 uno;
endmodule

module main_v79f6a0 (
 output cero
);
 
 
 supply0 cero;
endmodule
