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

#include "../-.kernel/Indicator/Indicator.mqh"

// ---
class ParabolicSAR
   : public Indicator
{
public
   :   
   int static LINE_PRICE;
   int static LINE_AVERAGE;
   int static LINE_PEAKUP;
   int static LINE_PEAKDOWN;
   int static LINE_TRENDUP;
   int static LINE_TRENDDOWN;
   
   ParabolicSAR
      (  )
      : Indicator (  )
   {
      
   };
   
};
int ParabolicSAR::LINE_PRICE     = 1;
int ParabolicSAR::LINE_AVERAGE   = 2;
int ParabolicSAR::LINE_PEAKUP    = 3;
int ParabolicSAR::LINE_PEAKDOWN  = 4;
int ParabolicSAR::LINE_TRENDUP   = 5;
int ParabolicSAR::LINE_TRENDDOWN = 6;

// ---

class ParabolicSARSerieTrend
   : public Serie
{

Serie * serieMa;
Serie * serieTrendDOWN;

public 
   :
   
   ParabolicSARSerieTrend
      (    Serie * ma 
         , Serie * trendDOWN         
         )
      :    Serie         ( ) 
         , serieMa       ( ma        )
         , serieTrendDOWN( trendDOWN )
   {};
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      int i = 0;
      int t = ( toCopy == 1 ? 1 : toCopy - 1 );
      for( ; i < t ; i++ ) 
      {
         if( serieMa.items[ i ] < serieMa.items[ i + 1 ] )
         {
                           items[ i ] = 0;
            serieTrendDOWN.items[ i ] = serieMa.items[ i ];
         }
         else
         {
                          items[ i ] = serieMa.items[ i ];
           serieTrendDOWN.items[ i ] = 0;
         }
      }
   };
};