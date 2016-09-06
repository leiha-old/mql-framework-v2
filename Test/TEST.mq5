
// ------------------------------------------------

#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

// -------------------------


#property indicator_separate_window 
#property indicator_buffers 20
#property indicator_plots   20

// ------------------------------------------------

#include "../WorkSpace/WorkSpace.mqh"

class Test 
   : public WorkSpace
{

public 
   :
   
   /** 
    */
   void onInit () 
   {  
      Time * tf = time( NULL , PERIOD_CURRENT );      
      
      Indicator * sar = tf.sar( );
      sar
         .plot( )
            .c0lor( clrRed       )
            .type ( DRAW_ARROW   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      /*
      sar.average(  )
         .plot( )
            .c0lor( clrBlue      )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;*/
      
      Indicator * ma = tf.average( 5 );
      ma
         .plot( )
            .c0lor( clrBlue      )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      Indicator * ma2 = tf.average( 21 );
      ma2
         .plot( )
            .c0lor( clrGreen      )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      /*
      Indicator * rsi = tf.rsi( 7 );      
      rsi
         .minimum(   0 )
         .maximum( 100 )
         .digits (   2 )
         .level  (  30 )
         .level  (  50 )
         .level  (  70 )
         .plot( )
            .c0lor( clrGreen     )
            .type ( DRAW_LINE    )
            .style( STYLE_DOT    )
            .width( 1            )
      ;
     
      rsi.average( 7 )
         .plot( )
            .c0lor( clrBlue      )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      rsi.average( 21 )
         .plot( )
            .c0lor( clrRed       )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;*/
      
   };
};

Test * test = new Test( );

// ------------------------------------------------

#include "bootstrap.mqh"