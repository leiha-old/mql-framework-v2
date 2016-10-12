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
#include "./BullsVsBearsSerie.mqh"
#include "./BullsVsBearsSignalIndicator.mqh"

// ---

template < typename T >
class BullsVsBearsIndicator
   : public BullsVsBears
{

protected
   :
   
   int iPeriod;
   T  iContainer;
   
public
   :
   
   /**
    */
   BullsVsBearsIndicator 
      ( T container , int period = 13 )
         : iContainer( container ) , iPeriod( period )
   {
      Serie * bu = iContainer.bulls( iPeriod ).get( LINE_MAIN );
      Serie * be = iContainer.bears( iPeriod ).get( LINE_MAIN );
      update( LINE_MAIN    , new BullsVsBearsSerie( bu , be ) );
      update( LINE_BEARS   , bu );
      update( LINE_BULLS   , be );      
   };
   
   /** 
    * Signal : Bulls Vs Bears Power
    */
   BullsVsBearsSignal * 
      signal
         ( int ma1 = 34 , int ma2 = 55 )
   {
      string name             = StringFormat( "BULLSVSBEARS_SIGNAL.%i", iPeriod );
      BullsVsBearsSignal * bb = iContainer.get( name );
      if ( bb == NULL ) {
         bb = new BullsVsBearsSignalIndicator < TimeIndicators * > 
            ( iContainer , GetPointer( this ) , ma1 , ma2 )
         ;
         iContainer.update( name , bb );
      }      
      return bb;
   };
   
};

