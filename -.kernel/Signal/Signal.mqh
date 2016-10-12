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

#include "../Time/Indicators.mqh"
// ---
class Signal 
   : public Indicator
{

protected
   :
   
   TimeIndicators * indicators;
   
public
   :
   
   static int LONG_OPEN  ;
   static int LONG_CLOSE ;
   static int SHORT_OPEN ;
   static int SHORT_CLOSE;
   
   Signal
      ( TimeIndicators * timeIndicators )
      : Indicator( ) , indicators ( timeIndicators )
   {
      update( LONG_OPEN   , new Serie( ) );
      update( LONG_CLOSE  , new Serie( ) );
            
      update( SHORT_OPEN  , new Serie( ) );
      update( SHORT_CLOSE , new Serie( ) );
   };  

};

int Signal::LONG_OPEN   = 0;
int Signal::LONG_CLOSE  = 1;
int Signal::SHORT_OPEN  = 2;
int Signal::SHORT_CLOSE = 3;

// ---
class SignalTrend
   : public Signal
{

protected
   :
   
   Serie * serie1;
   
   bool                    trend;

public
   :
   
   SignalTrend
      ( TimeIndicators * timeIndicators , Serie * serieSrc1 )
      : serie1( serieSrc1 ) , trend ( false ) , Signal( timeIndicators )
   {
      
   };
   
   /**
    *
   
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      for( int i = ( toCopy > 1000 ? toCopy - 2 : toCopy ) , t = start ; i > t ; i-- ) 
      {
         if
            ( trend == false && serie1.trend( ).up( i ) )
         {
            trend = true;
            get( LONG_OPEN ).items[ i ] = serie1.items[ i ];       
         } 
         else if
            ( trend == true && serie1.trend( ).down( i ) ) 
         {
            trend = false;
            get( SHORT_OPEN ).items[ i ] = serie1.items[ i ];    
         }                
      }
   };*/

};

// ---
class SignalCrossing
   : public Signal
{

protected
   :
   
   Serie * serie1;
   Serie * serie2; 
   
public
   :
   
   SignalCrossing
      ( TimeIndicators * timeIndicators , Serie * serieSrc1 , Serie * serieSrc2 )
      : serie1( serieSrc1 ) , serie2( serieSrc2 ) , Signal( timeIndicators )
   {
      
   };
   
   /**
    *
    
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      int period = 1;
      SeriePlugin * crossPlugin = serie1.cross( serie2 );
      for( int i = start , t = toCopy - 2 ; i < t ; i++ ) 
      {
         if
            ( crossPlugin.up( period , i ) ) 
         {
            
         } 
         else if
            ( crossPlugin.down( period , i ) ) 
         {
            
         }   
      }
   };*/

};