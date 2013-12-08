void temp36(){
 //getting the voltage reading from the temperature sensor
 int reading = analogRead(TemPIN);  
 // converting that reading to voltage
 float voltage = reading * 5.0;
 voltage /= 1024.0; 
 temp= (voltage - 0.5) * 100 ;  //converting from 10 mv per degree wit 500 mV offset
                                //to degrees ((volatge - 500mV) times 100)
 
}
