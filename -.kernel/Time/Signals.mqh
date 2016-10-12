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

#include "./Indicators.mqh"
#include "../Signal/Signal.mqh"

// ---

class TimeSignals
   : public ArrayMap < string , Signal * >
{

protected
   :
   
   TimeIndicators * indicators;
   
   /**
    */
   Signal * 
      single
         ( string name , bool & is )
   {
      Signal * signal = get( name );
      
      is = signal != NULL;      
      if( is ) 
      {
         signal = new Signal( indicators );
         //signal.update( bufferName , new SerieBuffer( handle ) );
         update( name , signal );
      }
      return signal;
   };
   
public
   :
   
   /**
    */
   TimeSignals 
      ( 
         TimeIndicators * timeIndicators ,
         string         & currencySymbol , 
         ENUM_TIMEFRAMES  frame = PERIOD_CURRENT 
      )
         : ArrayMap ( ) , indicators( timeIndicators )
   {
       
   };
    
};