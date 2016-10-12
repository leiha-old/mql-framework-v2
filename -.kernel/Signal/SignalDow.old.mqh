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
class SignalDow 
   : public Signal
{

protected
   :
   
   Serie * sar  ;
   
   Serie * ma ;
   Serie * ma2 ;
   Serie * low ;
   Serie * high;
   Serie * close;
   bool    trend;
   
   Serie            * peakTop;
   Array < bool   > * peakTopTrend;
   Array < double > * peakTopOnly;
   Serie            * trendDOWN;
   
   Serie            * peakBot ;
   Array < bool   > * peakBotTrend;
   Array < double > * peakBotOnly;
   Serie            * trendUP;
   
public
   :
   
   static int PEAK_TOP          ;
   static int PEAK_TOP_TREND    ;
   static int PEAK_BOTTOM       ;
   static int PEAK_BOTTOM_TREND ;
   
   SignalDow
      ( Serie * sarSerie , Serie * maSerie , Serie * lowSerie , Serie * highSerie , Serie * closeSerie , Serie * ma2Serie )
      : Signal(   ) , 
         sar  ( sarSerie   ) , 
         ma   ( maSerie    ) ,
         low  ( lowSerie   ) ,
         high ( highSerie  ) ,
         close( closeSerie ) ,
         ma2  ( ma2Serie   )
   {
      // ---   
      
      peakTop      = new Serie( );
      peakTopOnly  = new Array < double > ( true );
      peakTopTrend = new Array < bool   > ( true );
      series.update( PEAK_TOP , peakTop );
      
      
      // ---   
      
      peakBot      = new Serie( );
      peakBotOnly  = new Array < double > ( true );
      peakBotTrend = new Array < bool   > ( true );
      series.update( PEAK_BOTTOM , peakBot );
      
      
      trendUP   = new Serie( );
      trendDOWN = new Serie( );      
      series.update( PEAK_TOP_TREND    , trendUP   );
      series.update( PEAK_BOTTOM_TREND , trendDOWN );
      
     
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {   
      
      bool prevTrend;
      for( int i = toCopy - 1 , t = 0 ; i > t ; i-- ) 
      {      
         /*
          * Delete all points of PSAR indicator who are useless for the signal
          */
         int peakFound = -1;
         if (  sar.isInferior( ma , i ) 
            && sar.isSuperior( ma , i + 1 ) 
         ) {
            peakFound = PEAK_BOTTOM;
            peakBotOnly.update( peakBot.items[ i ] = ( sar.items[ i ] ) ) ;  
         }         
         else if( sar.isSuperior( ma , i ) 
               && sar.isInferior( ma , i + 1 ) 
         ) {
            peakFound = PEAK_TOP;
            peakTopOnly.update( peakTop.items[ i ] = ( sar.items[ i ] ) );
         }         
         
         trendDOWN.items[ i ] = ( peakBotOnly.get( -1 ) + peakTopOnly.get( -1 )  + peakBotOnly.get( -2 ) + peakTopOnly.get( -2w ) ) / 4;
         
         /*
          * Detect trend peak
          */
         if ( peakFound == PEAK_TOP && peakTopOnly.total( ) > 2 ) 
         {
            peakTopTrend.update( peakTopOnly.get( -1 ) > peakTopOnly.get( -2 ) );
         }
         else if( peakFound == PEAK_BOTTOM && peakBotOnly.total( ) > 2 ) 
         {
            peakBotTrend.update( peakBotOnly.get( -1 ) > peakBotOnly.get( -2 ) );
         }
         
         /*
          * Populate trend serie
         
         int trendTop = peakTopTrend.get( -1 );
         int trendBot = peakBotTrend.get( -1 );
         
         if 
            ( trendTop == true && trendBot == true ) 
         {
             trendUP.items[ i ] = ma.items[ i ];
             prevTrend = true;
         }
         else if 
            ( trendTop == false && trendBot == false ) 
         {
             trendDOWN.items[ i ] = ma.items[ i ];
             prevTrend = false;
         }
         else if 
            ( prevTrend == false ) 
         {
            if 
               ( trendTop == true && trendBot == true ) 
            {
               trendDOWN.items[ i ] = ma.items[ i ];
            }
         
             
         }*/
         
         /*
         if 
            ( trendTop == false ) 
         {
            if ( ma.items[ i ] < peakTopOnly.get( -1 ) ) 
            {
               trendDOWN.items[ i ] = ma.items[ i ];
               prevTrend = false;
            }
            else
            {
               if ( ma.items[ i ] > peakBotOnly.get( -1 ) ) 
               {
                  trendUP.items[ i ] = ma.items[ i ];
                  prevTrend = true;
               }
            }
         } 
         
         /*
         if 
            ( trendTop == false ) 
         {
            if ( ma.items[ i ] < peakTopOnly.get( -1 ) ) 
            {
               trendDOWN.items[ i ] = ma.items[ i ];
               prevTrend = false;
            }
            else
            {
               if ( ma.items[ i ] > peakBotOnly.get( -1 ) ) 
               {
                  trendUP.items[ i ] = ma.items[ i ];
                  prevTrend = true;
               }
            }
         } 
         else if
            ( trendBot == false ) 
         {
            if( prevTrend == false ) 
            {
               if ( ma.items[ i ] < peakTopOnly.get( -1 ) ) 
               {
                  trendDOWN.items[ i ] = ma.items[ i ];
                  prevTrend = false;
               } 
               else if ( trendTop == true ) 
               {
                  //trendUP.items[ i ] = ma.items[ i ];
                  prevTrend = true;
               }
            } 
            else if ( prevTrend == true ) 
            {
               if ( ma.items[ i ] > peakBotOnly.get( -1 ) ) 
               {
                  trendUP.items[ i ] = ma.items[ i ];
                  prevTrend = true;
               } 
            }
         } 
         
         // --
         
         if 
            ( trendTop == true ) 
         {
            if ( 
                  ma.items[ i ] > peakTopOnly.get( -1 ) 
               && ma.items[ i ] > peakBotOnly.get( -1 )
               ) 
            {
               trendUP.items[ i ] = ma.items[ i ];
               prevTrend = true;
            }
         } 
         else if
            ( trendBot == true ) 
         {
           if ( 
                  ma.items[ i ] > peakBotOnly.get( -1 )
               ) 
            {
               trendUP.items[ i ] = ma.items[ i ];
               prevTrend = true;
            }
         
            
            //trendUP.items[ i ] = ma.items[ i ];
            
         } 
         
         
         /*if( trendTop == true && trendBot == true ) 
         {
            if ( 
                  ma.items[ i ] > peakBotOnly.get( -1 )
               && ma.items[ i ] > peakTopOnly.get( -1 )
            ) {
               trendUP.items[ i ] = ma.items[ i ];
            }
         }
         else if( trendTop == false && trendBot == false ) 
         {
            if ( 
                  ma.items[ i ] < peakBotOnly.get( -1 )
               && ma.items[ i ] < peakTopOnly.get( -1 )
            ) {
               trendDOWN.items[ i ] = ma.items[ i ];
            }
         }
         else if( trendBot == false )
         {
            trendDOWN.items[ i ] = ma.items[ i ];
         }*/
         
      }      
      
   };

};
int SignalDow::PEAK_TOP          = 4;
int SignalDow::PEAK_TOP_TREND    = 5;
int SignalDow::PEAK_BOTTOM       = 6;
int SignalDow::PEAK_BOTTOM_TREND = 7;