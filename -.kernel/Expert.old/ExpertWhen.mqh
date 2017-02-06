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

#include "../Object/Object.mqh"
#include "./Position.mqh"
#include "./ExpertWhenTemplate.mqh"


// -----
/**
 * CLASS : ExpertWhen
 * --------------------
 */
template < 
   typename TObjectParent     
>
class ExpertWhen
   : public ExpertWhenTemplate < 
                                  ExpertWhen < TObjectParent >   ,
      ExpertWhenClause < Signal , ExpertWhen < TObjectParent > > ,
      ExpertPosition   <          ExpertWhen < TObjectParent > > , 
      TObjectParent 
   >
{

Array < ExpertPosition   <          ExpertWhen < TObjectParent > >    * > _positions;

public 
   :       
   ExpertWhen ( )
      : ExpertWhenTemplate ( )        
   {
      
   };
   
   ExpertPosition   <          ExpertWhen < TObjectParent > > * 
      Short ( ) 
   {
      ExpertPosition   <          ExpertWhen < TObjectParent > > * position = new ExpertPosition   <          ExpertWhen < TObjectParent > > ( );
      _positions.update( position.parent( pointer( ) ) );
      return position;
   };
   
   
   ExpertWhen < TObjectParent > * 
      iterate ()
   {
      for( int i = 0 , t = _positions.total( ) ; i < t ; i++ )
      {
         _positions.items[ i ].iterate( );
      };
      return pointer( );
   };
   
   /*
   
   TPosition * 
      Long ( ) 
   {
      TPosition * position = ( new TPosition ( ) );
      _positions.update( position );
      return position;
   };*/
   
   
   
   // -
   
};

class Test{};


void ff (){
   new ExpertWhen < Test > ( );
};