
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

#include "../-.kernel/WorkSpace/WorkSpace.mqh"
#include "../Indicators.mqh"

template < typename T >
class LiaBvsB 
   : public WorkSpace < T >
{

public 
   :
   
   /** 
    */
   void onInit () 
   {      
      Time < T >         * tf          = time                      ( NULL , PERIOD_CURRENT );      
      BullsVsBears       * BvsB        = tf.indicators.bullsVsBears( 89 , 55 , 13 );
      //Indicator          * BvsBAverage = BvsB.average              ( 21 );
      
      // ---
      
      BvsB
         .plot( BullsVsBears::LINE_MAIN )
            //.emptyValue( 0 )
            .c0lor( clrBlue      )
            .type ( DRAW_LINE    )
            .style( STYLE_DOT    )
            .width( 1            )
      ;     
     
      
      BvsB
         .plot( BullsVsBears::LINE_AVERAGE )
            //.emptyValue( 0 )
            .c0lor( clrPurple    )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
   
      /*
      BvsB.plot( BullsVsBears::LINE_BEARS )
            .emptyValue( 0 )
            .c0lor( clrGreen     )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      BvsB.plot( BullsVsBears::LINE_BULLS )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;*/
      
           
      BvsB
         .plot( BullsVsBears::LINE_UP )
            .emptyValue( 0 )
            .c0lor( clrGreen     )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      BvsB
         .plot( BullsVsBears::LINE_DOWN )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
     
   }
};

LiaBvsB < Indicators > * test = new LiaBvsB < Indicators >( );

// ------------------------------------------------

#include "bootstrap.mqh"