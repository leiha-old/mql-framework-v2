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

#include "../Array/Array.mqh"
#include "./Signal.mqh"

// -----
/**
 * CLASS : ExpertWhenClause
 * --------------------
 */
 template <
   typename TSignal ,
   typename TObjectParent       
>
class ExpertWhenClause
   : public Object < ExpertWhenClause , NullI , TObjectParent >
{

bool      _state ;
TSignal * _signal;

public 
   :
   ExpertWhenClause < TSignal , TObjectParent > * signal 
      ( bool state , TSignal * signal )
   {
      _state  = state ;
      _signal = signal;
      return pointer( );
   };
};

// -----
/**
 * CLASS : ExpertWhenClauseOr
 * --------------------
 */
template <
   typename TSignal ,
   typename TObjectParent       
>
class ExpertWhenClauseOr
   : public ExpertWhenClause < TSignal , TObjectParent >
{
public 
   :
   
};

// -----
/**
 * CLASS : ExpertWhenClauseAnd
 * --------------------
 */
template <
   typename TSignal ,
   typename TObjectParent       
>
class ExpertWhenClauseAnd
   : public ExpertWhenClause < TSignal , TObjectParent >
{
public 
   :
};



// -----
/**
 * CLASS : ExpertWhenTemplate
 * --------------------
 */
template <
   typename TObject       ,
   typename TWhenClause   ,
   typename TPosition     ,   
   typename TObjectParent       
>
class ExpertWhenTemplate
   : public Object < TObject , NullI , TObjectParent >
{

protected
   :

Array < TWhenClause  * > _signals;

public 
   :       
   ExpertWhenTemplate ( )
      : Object ( )        
   {
      
   };
   
   // -
   
   TObject * 
      or   ( bool state , Signal * signal ) 
   {
      _signals.update( 
         ( new TWhenClause ( ) )
            .signal( state , signal )
            .parent( pointer( ) )
            
      );
      return pointer( );
   };
   
   TObject *
      and  ( bool state , Signal * signal ) 
   {
      _signals.update( 
         ( new TWhenClause ( ) )
            .signal( state , signal ) 
            .parent( pointer( ) )
      );
      return pointer( );
   };
   
   
   
   
   
   
  
protected
   :
   
};