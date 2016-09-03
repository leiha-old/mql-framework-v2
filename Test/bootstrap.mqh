#property copyright "Copyright 2015, Leiha Sellier"
#property link      "https://github.com/leiha"
#property version   "1.00"
#property strict

void OnInit() 
{
   test.onInit();
};

int OnCalculate (
    const int         rates_total,      // valeur des s�ries temporelles d'entr�e
    const int         prev_calculated,  // les barres trait�es dans appel pr�c�dent 
    const datetime  & time[],           // Time
    const double    & open[],           // Open
    const double    & high[],           // High
    const double    & low[],            // Low
    const double    & close[],          // Close
    const long      & tick_volume[],    // Tick Volume
    const long      & volume[],         // Real Volume
    const int       & spread[]          // Spread
) {
   test.onCalculate( rates_total , prev_calculated );
   return rates_total ;
};