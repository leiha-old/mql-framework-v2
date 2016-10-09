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

#include "../../Indicator/Indicator.mqh"

// ---

class BullsVsBears
   : public Indicator
{
public
   :   
   int static LINE_UP;
   int static LINE_DOWN;
   int static LINE_RANGE;
   int static LINE_AVERAGE;
   int static LINE_BULLS;
   int static LINE_BEARS; 
   
   BullsVsBears
      (  )
      : Indicator (  )
   {
      
   };
   
   virtual BullsVsBears * 
      signal
         ( int ma1 = 34 , int ma2 = 55 )
   {
      return NULL;
   };
};
int BullsVsBears::LINE_UP      = 1;
int BullsVsBears::LINE_DOWN    = 2;
int BullsVsBears::LINE_RANGE   = 3;
int BullsVsBears::LINE_AVERAGE = 4;
int BullsVsBears::LINE_BULLS   = 5;
int BullsVsBears::LINE_BEARS   = 6;

// ---

class BullsVsBearsSerie
   : public Serie
{

Serie * serieBulls;
Serie * serieBears;

public 
   :
   
   BullsVsBearsSerie
      ( Serie * bulls , Serie * bears )
      : Serie ( ) , serieBulls ( bulls ) , serieBears ( bears  )
   {
      
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      for( int i = ( toCopy == 1 ? 1 : toCopy - 1 ) , t = 0 ; i > t ; i-- ) 
      {
         items[ i ] = ( serieBulls.items[ i ] + serieBears.items[ i ] ) / 2 ;
      }
   };
};

// ---

template < typename T >
class BullsVsBearsSignal
   : public BullsVsBears
{

protected
   :
   
   Serie * trendUP;
   Serie * trendDOWN;
   Serie * bullsVsBears;
   T       iContainer;
   
public
   :
   
   /**
    */
   BullsVsBearsSignal 
      ( T container , BullsVsBears * indicator , int ma1 = 34 , int ma2 = 55 )
         : iContainer( container )
   {
      update( LINE_UP    , trendUP   = new Serie( ) );
      update( LINE_DOWN  , trendDOWN = new Serie( ) );
      bullsVsBears = indicator
         .average( ma1 )
         .average( ma2 )
         .get( LINE_MAIN )         
      ;
   };
   
   /**
    *
    */
   virtual void
      onCalculate( int start , int toCopy ) 
   {
      for( int i = toCopy - 2, t = 0 ; i > t ; i-- ) 
      {
         if ( bullsVsBears.items[ i ] < bullsVsBears.items[ i + 1 ] ) 
         {
            trendDOWN.items[ i ] = bullsVsBears.items[ i ];
         } 
         else {
            trendUP.items[ i ] = bullsVsBears.items[ i ];
         }         
      }
   };   
}; 

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
   BullsVsBears * 
      signal
         ( int ma1 = 34 , int ma2 = 55 )
   {
      string name       = StringFormat( "BULLSVSBEARS_SIGNAL.%i", iPeriod );
      BullsVsBears * bb = iContainer.get( name );
      if ( bb == NULL ) {
         bb = new BullsVsBearsSignal < TimeIndicators * > ( iContainer , GetPointer( this ) , ma1 , ma2 );
         iContainer.update( name , bb );
      }      
      return bb;
   };
   
};

