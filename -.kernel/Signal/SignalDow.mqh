//+------------------------------------------------------------------+
//|                                                    Indicator.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "./Signal.mqh"
#include "../Serie/SerieHistory.mqh"

// ---
template < typename T >
class SignalDow 
   : public Signal
{

protected
   :
   
   T timeFrame;
   
   Indicator * sar  ;
   Indicator * ma   ;
   Indicator * ma2  ;
   Indicator * low  ;
   Indicator * high ;
   Indicator * close;
   
   Serie * peakTop;
   Array < double > * peakTopOnly;
   Array < bool   > * peakTopTrend;
   
   Serie * peakBot;
   Array < double > * peakBotOnly;
   Array < bool   > * peakBotTrend;
   
   Serie * trendUP;
   Serie * trendDOWN;
   
public
   :
   
   int PEAK_TOP          ;
   int PEAK_BOTTOM       ;
   int PEAK_TREND_TOP    ;
   int PEAK_TREND_BOT    ;
   
   SignalDow
      ( T tf )
      : Signal(   ) , timeFrame( tf ) ,
      PEAK_TOP   ( 5 ) ,
      PEAK_BOTTOM( 6 ) ,
      PEAK_TREND_TOP ( 7 ) ,
      PEAK_TREND_BOT ( 8 )
      
         
   {      
      //sar   = tf.sar     (  );
      sar   = tf.sar     ( 0.05 , 0.8 );
      
      low   = tf.low     (   );
      high  = tf.high    (   );
      close = tf.close   (   );
      
      ma    = tf.average (  3 );
      ma2   = tf.average ( 55 );
      
      // ---   
      
      peakTop      = new Serie( );
      peakTopTrend = new Array < bool   > ( true );
      peakTopOnly  = new Array < double > ( true );
      update( PEAK_TOP       , peakTop );
      
      // -
      
      peakBot      = new Serie( );
      peakBotTrend = new Array < bool   > ( true );
      peakBotOnly  = new Array < double > ( true );
      update( PEAK_BOTTOM    , peakBot );      
      
      // -
      
      trendUP      = new Serie( );
      trendDOWN    = new Serie( );
      update( PEAK_TREND_TOP , trendUP   );
      update( PEAK_TREND_BOT , trendDOWN );
      
      // ---   
   
      peakTop.plot(  )
            .c0lor( clrGreen     )
            .type ( DRAW_ARROW   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
      peakBot.plot(  )
            .c0lor( clrRed       )
            .type ( DRAW_ARROW   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
      
       // ---   
   
      trendUP.plot(  )
            .emptyValue( 0 )
            .c0lor( clrGreen     )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 2            )
      ;
      
      trendDOWN.plot(  )
            .emptyValue( 0 )
            .c0lor( clrRed       )
            .type ( DRAW_LINE    )
            .style( STYLE_SOLID  )
            .width( 2            )
      ;
      
      ma.plot(  )
            .c0lor( clrOrange     )
            .type ( DRAW_LINE   )
            .style( STYLE_SOLID  )
            .width( 1            )
      ;
   
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      Serie *  maMain = ma .get( MAIN_LINE );
      Serie * sarMain = sar.get( MAIN_LINE );
            
      int peakFound = -1;
      for( int i = toCopy - 1 , t = 0 ; i > t ; i-- ) 
      {
         if (  sarMain.isInferior( maMain , i ) 
            && sarMain.isSuperior( maMain , i + 1 ) 
         ) {
            peakFound = PEAK_BOTTOM;
            peakBotOnly.update( peakBot.items[ i ] = ( sarMain.items[ i ] ) ) ;
         }         
         else if( sarMain.isSuperior( maMain , i ) 
               && sarMain.isInferior( maMain , i + 1 ) 
         ) {
            peakFound = PEAK_TOP;
            peakTopOnly.update( peakTop.items[ i ] = ( sarMain.items[ i ] ) ) ;
         }
         
         // -      
         
         if ( peakTopOnly.total( ) < 2  && peakBotOnly.total( ) < 2 ) {
            continue;
         }
         
         /*
          * Populate trend serie
          */
         
         bool trendTop = peakTopOnly.get( -1 ) > peakTopOnly.get( -2 );
         bool trendBot = peakBotOnly.get( -1 ) > peakBotOnly.get( -2 );
          
          
         if 
            ( trendTop ) 
         {
            if ( peakBotOnly.get( -1 ) < maMain.items[ i ] ) 
            {
               trendUP.items[ i ] = maMain.items[ i ];
            } else {
               trendDOWN.items[ i ] = maMain.items[ i ];
            }           
         }
         /*else if 
            ( !trendTop || !trendBot ) 
         {
            if ( peakTopOnly.get( -1 ) > maMain.items[ i ] ) 
            {
               trendDOWN.items[ i ] = maMain.items[ i ];
            }            
         }*/
         
                  
      }    
   };
};