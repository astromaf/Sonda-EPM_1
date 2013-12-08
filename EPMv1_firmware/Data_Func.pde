
void guardo_datos(){
  
if( theMemoryAddress < tope){
  //Serial.println(theMemoryAddress);
  WireEepromWriteByte(theDeviceAddress, theMemoryAddress,hum);
  theMemoryAddress++;
  WireEepromWriteByte(theDeviceAddress, theMemoryAddress,tempH);
  theMemoryAddress++;
  WireEepromWriteByte(theDeviceAddress, theMemoryAddress,temp);
  theMemoryAddress++;
  WireEepromWriteByte(theDeviceAddress, theMemoryAddress,presion);
  theMemoryAddress++;
  EEPROM.write(69, lowByte(theMemoryAddress));
  EEPROM.write(70, highByte(theMemoryAddress));
  
}
else{
    Serial.println("=====FILL====");
  }
}
  
  
 void descargo_datos(){
   if( theMemoryAddress <tope+10){
   for (int i=0;i<4;i++){
    Serial.print("$Datos,");
    Serial.print(theMemoryAddress/4);
    Serial.print(", ");
    Serial.print((int)WireEepromReadByte(theDeviceAddress, theMemoryAddress));
    Serial.print(",");
    theMemoryAddress++;
    Serial.print((int)WireEepromReadByte(theDeviceAddress, theMemoryAddress));
    Serial.print(",");
    theMemoryAddress++;
    Serial.print((int)WireEepromReadByte(theDeviceAddress, theMemoryAddress));
    Serial.print(",");
    theMemoryAddress++;
    Serial.print((int)WireEepromReadByte(theDeviceAddress, theMemoryAddress));
    Serial.print(",");
    Serial.println("Z");
    theMemoryAddress++;
    EEPROM.write(19, lowByte(theMemoryAddress));
    EEPROM.write(20, highByte(theMemoryAddress));
  }
   }
   } 
 
 
void limpio_eeprom(){
  GPS.sendCommand(PMTK_LOCUS_ERASE_FLASH);
  Serial.println("GPS Erased");
  theMemoryAddress = 0;
  Serial.println("Limpiando EEPROM #1");
  for (int i = 0; i < 512; i++){
    EEPROM.write(i, 0);}
  Serial.println("Limpiando EEPROM #2");  
 for (unsigned int theMemoryAddress = 0; theMemoryAddress <6000; theMemoryAddress++) {
   Serial.println(theMemoryAddress);
   WireEepromWriteInt(theDeviceAddress, theMemoryAddress, 0);
   }
  theMemoryAddress = 0;
 }
