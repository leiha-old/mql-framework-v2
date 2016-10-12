
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
class Test 
   : public WorkSpace < T >
{

public 
   :
   
   /** 
    */
   void onInit () 
   {  
      Time < T >         * tf          = time                      ( NULL , PERIOD_CURRENT );      
//      BullsVsBears       * BvsB        = tf.indicators.bullsVsBears( 89 );
//      BullsVsBearsSignal * BvsBSignal  = BvsB.signal               ( 55 , 34 );
//      Indicator          * BvsBAverage = BvsB.average              ( 13 );
      ParabolicSAR       * Psar        = tf.indicators.parabolicSAR ( 0.02 , 0.2 , 89 , 21 );
      ParabolicSARSignal * PsarSignal  = Psar.signal                (  );
      // ---      
      
      /*
      Psar
         .plot( ParabolicSAR::LINE_MAIN )
            //.emptyValue( 0 )
            .c0lor( clrSilver    )
            .type ( DRAW_ARROW   )
            .style( STYLE_DOT  )
            .width( 1            )
      ;*/
      
      Psar
         .plot( ParabolicSAR::LINE_AVERAGE )
            //.emptyValue( 0 )
            .c0lor( clrBrown     )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      Psar
         .plot( ParabolicSAR::LINE_PRICE )
            //.emptyValue( 0 )
            .c0lor( clrOrange    )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      Psar
         .plot( ParabolicSARSignal::LINE_TRENDUP , false )
            .emptyValue( 0 )
            .c0lor( clrGreen     )
            .type ( DRAW_LINE   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      Psar
         .plot( ParabolicSARSignal::LINE_TRENDDOWN , false )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_LINE   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      PsarSignal
         .plot( ParabolicSARSignal::LINE_PEAKUP , false )
            .emptyValue( 0 )
            .c0lor( clrGreen     )
            .type ( DRAW_ARROW   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      PsarSignal
         .plot( ParabolicSARSignal::LINE_PEAKDOWN , false )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_ARROW   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      /*
      BvsBAverage
         .plot( BullsVsBears::LINE_MAIN )
            //.emptyValue( 0 )
            .c0lor( clrBlue      )
            .type ( DRAW_LINE    )
            .style( STYLE_DOT    )
            .width( 1            )
      ;*/
   
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
      
      /*
      BvsBSignal
         .plot( BullsVsBearsSignal::LINE_UP , false )
            .emptyValue( 0 )
            .c0lor( clrGreen     )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      BvsBSignal
         .plot( BullsVsBearsSignal::LINE_DOWN , false )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;*/
      
      /*
      dow
         .plot( SignalDow::PEAK_TOP_TREND )
            .emptyValue ( 0 )
            .c0lor( clrGreen     )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 3            )
      ;
      
      dow
         .plot( SignalDow::PEAK_BOTTOM_TREND )
            .emptyValue ( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 2            )
      ;*/
      
      
      /*
      tf.indicators.rsi( 3 )
         .plot( MAIN_LINE )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;*/
   };
      
};

Test < Indicators > * test = new Test < Indicators >( );

// ------------------------------------------------

#include "bootstrap.mqh"