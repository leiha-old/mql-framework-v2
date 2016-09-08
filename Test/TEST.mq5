
// ------------------------------------------------

#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"

// -------------------------


#property indicator_separate_window 
//#property indicator_chart_window 
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
      
      // ----- SAR
      //sar( tf );
      
      
      // ----- RSI
      rsi( tf );
      
      
      
      
   };
   
   void sar ( Time * tf ) 
   {
      Indicator * sar = tf.sar( );
      sar
         .plot( )
            .c0lor( clrGray       )
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
      
      
      Indicator * ma1 = tf.average( 3 );
      ma1
         .plot( )
            .c0lor( clrBlue      )
            .type ( DRAW_LINE    )
            .style( STYLE_DOT  )
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
      
      Signal * s1 = tf.cross( ma1 , ma2 );
      s1
         .plot( Signal::LONG_OPEN )
            .emptyValue( 0 )
            .c0lor( clrGreen      )
            .type ( DRAW_ARROW   )
            .style( STYLE_SOLID  )
            .width( 5            )
      ;
      
      s1
         .plot( Signal::SHORT_OPEN )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_ARROW   )
            .style( STYLE_SOLID  )
            .width( 5            )
      ;
   };
   
   void rsi ( Time * tf ) {
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
            .type ( DRAW_NONE    )
            .style( STYLE_DOT    )
            .width( 1            )
      ;
      
      // -----
     
      Indicator * rsiMA1= rsi.average( 14 );
      rsiMA1
         .plot( )
            .c0lor( clrSilver      )
            .type (DRAW_NONE   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      Indicator * rsiMA2= rsiMA1.average( 14 );
      rsiMA2
         .plot( )
            .c0lor( clrSilver       )
            .type (  DRAW_LINE     )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      /*
      Indicator * rsiMA3= rsiMA2.average( 55 );
      rsiMA3
         .plot( )
            .c0lor( clrOrange       )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      // -----
      
      Signal * s1 = tf.cross( rsiMA2 , rsiMA3 );
      s1
         .plot( Signal::LONG_OPEN )
            .emptyValue( 0 )
            .c0lor( clrGreen      )
            .type ( DRAW_ARROW   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      s1
         .plot( Signal::SHORT_OPEN )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_ARROW   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;*/
      
      Signal * s2 = tf.trend( rsiMA2 );
      s2
         .plot( Signal::LONG_OPEN )
            .emptyValue( 0 )
            .c0lor( clrGreen      )
            .type ( DRAW_ARROW   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      s2
         .plot( Signal::SHORT_OPEN )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_ARROW   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
   };
};

Test * test = new Test( );

// ------------------------------------------------

#include "bootstrap.mqh"