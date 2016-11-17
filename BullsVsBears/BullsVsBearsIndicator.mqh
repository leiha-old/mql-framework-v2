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
#include "./BullsVsBearsSignal.mqh"

// ---

template < typename T >
class BullsVsBearsIndicator
   : public BullsVsBears
{

protected
   :
   
   int iPeriod;
   T  iContainer;
   BullsVsBearsSerieTrend * trend;
   
public
   :
   
   /**
    */
   BullsVsBearsIndicator 
      ( T container , int period = 13 , int ma1 = 34 , int ma2 = 55 )
         : iContainer( container ) , iPeriod( period )
   {
      Serie   * be    = iContainer.bears( iPeriod ).get( 0 );
      Serie   * bu    = iContainer.bulls( iPeriod ).get( 0 );
      Serie   * bebu  = new BullsVsBearsSerie( bu , be );
      SerieMA * ma    = new SerieMA( bebu );
      Serie   * td    = new Serie( );
      Serie   * tu    = new BullsVsBearsSerieTrend( ma , td );
            
      update( be.slot( )   , be );
      update( bu.slot( )   , bu );
      update( bebu.slot( )    , bebu );
      update( ma.slot( ) , ma.addPeriod( ma1 ).addPeriod( ma2 ) );
      update( td.slot( )    , td );
      update( tu.slot( )      , tu );
      
      
      
   };
};