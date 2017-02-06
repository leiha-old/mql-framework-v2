//+------------------------------------------------------------------+
//|                                                        Serie.mqh |
//|                                          leiha.sellier@gmail.com |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "leiha.sellier@gmail.com"
#property link      "https://www.mql5.com"
#property version   "1.00"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

#include "./PositionWhen.mqh"
#include "./PositionOpen.mqh"

// -----
/**
 * CLASS  : ExpertPosition
 * --------------------
 */
template < 
   typename TPosition,
   typename TPositionWhen,
   typename TPositionOpen,
   typename TObjectParent
>
class ExpertPositionTemplate
   : public Object < TPosition , NullI , TObjectParent >
{

Array < TPositionWhen * > _whens;
Array < TPositionOpen * > _positions;

public 
   :       
   ExpertPositionTemplate ( )
      : Object ( )        
   {
      
   };
   
   // -
   
   TPosition * 
      limit  ( int takePofit , int stopLoss ) 
   {
      return pointer( );
   };
   
   /*
   ExpertPositionWhen < TPosition > *
      when ( bool state , Signal * signal ) 
   {
      ExpertPositionWhen < TPosition > * when = new ExpertPositionWhen < TPosition > ( );
      _whens.update( when );
      return when;
   }*/
   
   ExpertPositionOpen < TPosition > *
      open ( double volume ) 
   {
      ExpertPositionOpen < TPosition > * position = new ExpertPositionOpen < TPosition > ( );
      _positions.update( position );
      return position;
   };
   
   
  TPosition *
      iterate ()
   {
      /*
      for( int i = 0 , t = _whens.total( ) ; i < t ; i++ )
      {
         _whens.items[ i ].iterate( );
      };
      
      for( int i = 0 , t = _positions.total( ) ; i < t ; i++ )
      {
         _positions.items[ i ].iterate( );
      };
      */
      
      return pointer( );
   };
   
};

// -----
/**
 * CLASS  : ExpertPosition
 * --------------------
 */
template < 
   typename TObjectParent
>
class ExpertPosition
   : public ExpertPositionTemplate < 
                           ExpertPosition < TObjectParent > , 
      ExpertPositionWhen < ExpertPosition < TObjectParent > > ,
      ExpertPositionOpen < ExpertPosition < TObjectParent > > ,   
      TObjectParent  
      
   >
{

public 
   :       
   ExpertPosition ( )
      : ExpertPositionTemplate ( )        
   {
      
   };
};