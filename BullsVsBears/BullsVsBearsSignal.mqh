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

#include "./BullsVsBears.mqh"

// ---

class BullsVsBearsSignal
   : protected BullsVsBears
{

protected
   :   
   
public
   :
   
   /**
    */
   BullsVsBearsSignal
      ( int handle )
   {
      update( LINE_BEARS   , new SerieBuffer( handle , LINE_BEARS ) );
      update( LINE_BULLS   , new SerieBuffer( handle , LINE_BULLS ) );
      update( LINE_MAIN    , new SerieBuffer( handle , LINE_MAIN ) );
      update( LINE_UP      , new SerieBuffer( handle , LINE_UP ) );
      update( LINE_AVERAGE , new SerieBuffer( handle , LINE_AVERAGE ) );
      update( LINE_DOWN    , new SerieBuffer( handle , LINE_DOWN ) );
      
      
   };
   
   /**    
   BullsVsBearsSignal
      ( T container , BullsVsBears * indicator , int period , int ma1 = 34 , int ma2 = 55 )
         : iContainer( container )
   {
      
   };*/
   
   SerieBuffer * bears ( ) {
      return get( LINE_BEARS );
   };
   
   SerieBuffer * bulls ( ) {
      return get( LINE_BULLS);
   };
   
   SerieBuffer * main ( ) {
      return get( LINE_MAIN );
   };
   
   SerieBuffer * ma ( ) {
      return get( LINE_AVERAGE );
   };
   
   SerieBuffer * trendDown ( ) {
      return get( LINE_DOWN );
   };
   
   SerieBuffer * trendUp ( ) {
      return get( LINE_UP );
   };
}; 


