void echo(){
 // check if returns are valid, if they are NaN (not a number) then something went wrong!
  
    Serial.print("Humidity: "); 
    Serial.print(hum,DEC);
    Serial.print(" %\t");
    Serial.print("Temperature: "); 
    Serial.print(tempH,DEC);
    Serial.println(" *C");
    Serial.print(temp, DEC); Serial.println("*C");
    Serial.println(presion);

  
   
 
 //Serial.print('   ');
 //Serial.print(q);
// Serial.print('   ');
 //Serial.println(presion);

}
