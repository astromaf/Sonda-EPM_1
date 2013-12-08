void mpx(){
 int reading = analogRead(mpxPIN);
 presion=(reading+40.96)/9.216;  // de 0 a 115Kpa


}
