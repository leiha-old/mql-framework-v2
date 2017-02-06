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

// -----
/**
 * FACADE : ExpertPositionWhenFacade
 * --------------------
 */
interface ExpertPositionOpenWhenFacade
   : public ObjectFacade
{

};

// -----
/**
 * CLASS  : ExpertPositionWhen
 * --------------------
 */
template < 
   typename TPositionParent,
   typename TObjectParent
>
class ExpertPositionOpenWhen
   : public ExpertWhenTemplate < 
                                  ExpertPositionOpenWhen < TPositionParent , TObjectParent >   ,
      ExpertWhenClause < Signal , ExpertPositionOpenWhen < TPositionParent , TObjectParent > > ,
      TPositionParent , 
      TObjectParent 
   >
{

public 
   :       
   ExpertPositionOpenWhen ( )
      : ExpertWhenTemplate ( )        
   {
      
   };
   
   TObjectParent *
      close ( ) 
   {
      return end( );
   };
   
   // -    
     
};