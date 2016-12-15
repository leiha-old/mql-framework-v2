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

#include "./Serie.mqh"
#include "./Serie/Injector/Low.mqh"
#include "./Serie/Injector/High.mqh"
#include "./Serie/Injector/Close.mqh"
#include "./Serie/Injector/Open.mqh"
#include "./WorkSpace.mqh"
#include "./Indicator/Configurator.mqh"

// ---
class Candle
   : public WorkSpace < 
                                Candle   ,
      WorkSpaceIndicators     < Candle > , 
      IndicatorConfigurator   < Candle > ,
      Serie                   < Candle > ,          
      SerieConfigurator       < Candle , Serie < Candle > > ,
      SerieInjector           < Candle , Serie < Candle > >         
   >
{

public 
   :
   
   static int SERIE_LOW;
   static int SERIE_HIGH;
   static int SERIE_CLOSE;
   static int SERIE_OPEN;   
   
   Candle
      (  )
         : WorkSpace ( )
   {
      serie( SERIE_LOW   , new SerieInjectorLow   < Candle , Serie < Candle > > ( pointer ( ) ) );
      serie( SERIE_HIGH  , new SerieInjectorHigh  < Candle , Serie < Candle > > ( pointer ( ) ) );
      serie( SERIE_CLOSE , new SerieInjectorClose < Candle , Serie < Candle > > ( pointer ( ) ) );
      serie( SERIE_OPEN  , new SerieInjectorOpen  < Candle , Serie < Candle > > ( pointer ( ) ) );
   };
   
   // ---
   
   virtual void
      populate( int start , int toCopy ) 
   {
      
   };
};
int Candle::SERIE_LOW   = 0;
int Candle::SERIE_HIGH  = 1;
int Candle::SERIE_CLOSE = 2;
int Candle::SERIE_OPEN  = 3;