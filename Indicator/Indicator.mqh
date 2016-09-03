//+------------------------------------------------------------------+
//|                                                        Array.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "../Serie/Series.mqh"
#include "../Array/ArrayMap.mqh"
#include  "./IndicatorFacade.mqh"

// ---
class Indicator 
   : public IndicatorFacade
{

protected
   :

public
   :
   
   Indicator
      ( TimeFacade * timeFacade )
      : IndicatorFacade ( timeFacade )
   {
      
   };
   
   Plot * plot( int serieName = MAIN_LINE ) 
   {
      Serie * s = series.get( serieName );
      if( s != NULL ) {
        return s.plot( );
      }
      return NULL;      
   }
   
   /** 
    */
   virtual void
      onCalculate 
         ( int start , int toCopy ) 
   {
      for 
         ( int i = 0 , end = series.total() ; i < end ; i++ )
      {
         series.getByPrimaryIndex( i ).onCalculate( start , toCopy );
      }
   };

};