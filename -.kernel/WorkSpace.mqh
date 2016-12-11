//+------------------------------------------------------------------+
//|                                                    WorkSpace.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
// ---

#include "./WorkSpace/Currencies.mqh"
#include "./WorkSpace/TimeFrames.mqh"
#include "./WorkSpace/Indicators.mqh"
#include "./WorkSpace/Template.mqh"

template < typename TIndicator , typename TIndicators , typename TConfigurator , typename TSerie , typename TSerieConfigurator >
class WorkSpace
   : public WorkSpaceTemplate < 
      WorkSpaceCurrency   < WorkSpaceTimeFrame  < WorkSpaceIndicators < TIndicator > > > ,
      WorkSpaceTimeFrame  < WorkSpaceIndicators < TIndicator > > , 
      TIndicators ,
      TIndicator ,
      TConfigurator ,
      TSerie ,
      TSerieConfigurator   
   >
{

public
   :
   
   WorkSpace
      ( )
      : WorkSpaceTemplate ( )
   {
      
   };
};