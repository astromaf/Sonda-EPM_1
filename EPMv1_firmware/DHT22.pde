void dht22(){
  
 hum = dht.readHumidity();
 delay(200);
 tempH = dht.readTemperature();
 
 if (tempH==0 && hum==0) {
   //errores++;
   hum=hum2;
   tempH=tempH2; 
 }
 else{
   hum2=hum;
   tempH2=tempH; 
 }

 
}
