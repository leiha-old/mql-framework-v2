//+------------------------------------------------------------------+
//|                                                         Time.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "./ParabolicSAR.mqh"
//#include "./ParabolicSARSignalIndicator.mqh"

// ---

template < typename T >
class ParabolicSARSignal
   : public ParabolicSAR
{

protected
   :
   
   T  iContainer;
   
   Serie * peakTop;
   Serie * peakBot;
   Serie * trendUP;
   Serie * trendDOWN;
   
   ParabolicSAR * sarIndicator;
   
public
   :
   
   /**
    */
   ParabolicSARSignal
      ( T container , ParabolicSAR * sar )
         : iContainer( container ) , sarIndicator ( sar )
   {
      peakTop      = new Serie( );
      peakBot      = new Serie( );
      trendUP      = new Serie( );
      trendDOWN    = new Serie( );
      update( LINE_PEAKUP    , peakTop );
      update( LINE_PEAKDOWN  , peakBot );
      update( LINE_TRENDUP   , trendUP );
      update( LINE_TRENDDOWN , trendDOWN );
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      Serie * sar   = sarIndicator.get( ParabolicSAR::LINE_MAIN    );
      Serie * price = sarIndicator.get( ParabolicSAR::LINE_PRICE   );
      Serie * ma    = sarIndicator.get( ParabolicSAR::LINE_AVERAGE );
      
      peakTop.resize( toCopy );
      peakBot.resize( toCopy );
            
      int peakFound = -1;
      for( int i = toCopy - 2 , t = 0 ; i > t ; i-- ) 
      {
         if (  sar.isInferior( price , i ) 
            && sar.isSuperior( price , i + 1 ) 
         ) {
            peakBot.items[ i ] = ( sar.items[ i ] ) ;
         }         
         else if( sar.isSuperior( price , i ) 
               && sar.isInferior( price , i + 1 ) 
         ) {
            peakTop.items[ i ] = ( sar.items[ i ] ) ;
         }         
         
         
      }
   };
   
};

