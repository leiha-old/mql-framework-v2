//+------------------------------------------------------------------+
//|                                                     Currency.mqh |
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

class SerieMtf 
   : public Serie
{

Serie * serieSrc;

public
   :
   
   SerieMtf
      ( Serie * serie )
      : serieSrc ( serie )
   {
      
   };
   
   int getLimit
      ( int & prevCalculated , int & ratesTotal )
   {
      return prevCalculated > ratesTotal || prevCalculated <= 0
         ? ratesTotal
         : ratesTotal - prevCalculated
         ;
   }
   
   /** 
    */
   virtual void
      onCalculate 
         ( 
            int    & prevCalculated , 
            int    & ratesTotal , 
            double & time[]        
         ) 
      {
         int limit = getLimit( prevCalculated , ratesTotal );
         
         int _bars = _bars >= 1 
            ? Bars( _Symbol , iTimeframe )
            : return ( 0 )
            ;      
      
         datetime TimeBegining [];
         if(CopyTime( _Symbol , iTimeframe , _bars - 1 , 1 , TimeBegining ) != 1 )
         {
            return(0);
         }
      
         int calc = calc >= 0
            ? BarsCalculated( calc_handle )
            : return ( 0 )
            ;
      
         if( CopyBuffer( calc_handle, 0, 0, _bars, origin ) != _bars )
         {
            return(0);
         }
      
      int limits = MathMin( limit, calc );
      if(limits == 0 ) {
         limits = PeriodSeconds( iTimeframe ) / PeriodSeconds( _Period );
      }
      
      for(int i = limits ; i >= 0 ; i-- )
      {
         serie.items[ i ] = EMPTY_VALUE;
         if( time[ i ] >= TimeBegining[ 0 ] )
         {
            int y = iBarShift( NULL, iTimeframe , time[ i ] );
            if( y >= 0 ) {
                items[ i ] = tfBuffer[ y ];
            }
         }
      }
   };
   
};