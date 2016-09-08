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

#include "../Indicator/Indicator.mqh"

// ---
class Signal 
   : public Indicator
{

protected
   :
   
   
   
public
   :
   
   static int LONG_OPEN  ;
   static int LONG_CLOSE ;
   static int SHORT_OPEN ;
   static int SHORT_CLOSE;
   
   Signal
      (  )
      : Indicator( )
   {
      series.update( LONG_OPEN   , new Serie( ) );
      series.update( LONG_CLOSE  , new Serie( ) );
            
      series.update( SHORT_OPEN  , new Serie( ) );
      series.update( SHORT_CLOSE , new Serie( ) );
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
      ( Serie * serieSrc1 )
      : serie1( serieSrc1 ) , trend ( false ) , Signal(  )
   {
      
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      for( int i = ( toCopy > 1000 ? toCopy - 2 : toCopy ) , t = start ; i > t ; i-- ) 
      {
         if
            ( trend == false && serie1.isTrendUp( i ) ) 
         {
            trend = true;
            series.get( LONG_OPEN ).items[ i ] = serie1.items[ i ];       
         } 
         else if
            ( trend == true && serie1.isTrendDown( i ) ) 
         {
            trend = false;
            series.get( SHORT_OPEN ).items[ i ] = serie1.items[ i ];    
         }                
      }
   };

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
      ( Serie * serieSrc1 , Serie * serieSrc2 )
      : serie1( serieSrc1 ) , serie2( serieSrc2 ) , Signal(  )
   {
      
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      for( int i = start , t = toCopy - 2 ; i < t ; i++ ) 
      {
         if
            ( serie1.isCrossUp  ( serie2 , series.get( LONG_OPEN  ) , i ) ) 
         {
            
         } 
         else if
            ( serie1.isCrossDown( serie2 , series.get( SHORT_OPEN ) , i ) ) 
         {
            
         }   
      }
   };

};