
void WireEepromRead(int theDeviceAddress, unsigned int theMemoryAddress, int theByteCount, byte* theByteArray) {
  for (int theByteIndex = 0; theByteIndex < theByteCount; theByteIndex++) {
    Wire.beginTransmission(theDeviceAddress);
    Wire.send((byte)((theMemoryAddress + theByteIndex) >> 8));
    Wire.send((byte)((theMemoryAddress + theByteIndex) >> 0));
    Wire.endTransmission();
    delay(5);
    Wire.requestFrom(theDeviceAddress, sizeof(byte));
    theByteArray[theByteIndex] = Wire.receive();
  }
}
//*********************************************************************************************

byte WireEepromReadByte(int theDeviceAddress, unsigned int theMemoryAddress) {
  byte theByteArray[sizeof(byte)];
  WireEepromRead(theDeviceAddress, theMemoryAddress, sizeof(byte), theByteArray);
  return (byte)(((theByteArray[0] << 0)));
}

//*********************************************************************************************

int WireEepromReadInt(int theDeviceAddress, unsigned int theMemoryAddress) {
  byte theByteArray[sizeof(int)];
  WireEepromRead(theDeviceAddress, theMemoryAddress, sizeof(int), theByteArray);
  return (int)(((theByteArray[0] << 8)) | (int)((theByteArray[1] << 0)));
}

//*********************************************************************************************

void WireEepromWrite(int theDeviceAddress, unsigned int theMemoryAddress, int theByteCount, byte* theByteArray) {
  for (int theByteIndex = 0; theByteIndex < theByteCount; theByteIndex++) {
    Wire.beginTransmission(theDeviceAddress);
    Wire.send((byte)((theMemoryAddress + theByteIndex) >> 8));
    Wire.send((byte)((theMemoryAddress + theByteIndex) >> 0));
    Wire.send(theByteArray[theByteIndex]);
    Wire.endTransmission();
    delay(5);
  }
}
//*********************************************************************************************

void WireEepromWriteByte(int theDeviceAddress, unsigned int theMemoryAddress, byte theByte) {
  byte theByteArray[sizeof(byte)] = {(byte)(theByte >> 0)};
  WireEepromWrite(theDeviceAddress, theMemoryAddress, sizeof(byte), theByteArray);
}

//*********************************************************************************************

void WireEepromWriteInt(int theDeviceAddress, unsigned int theMemoryAddress, int theInt) {
  byte theByteArray[sizeof(int)] = {(byte)(theInt >> 8), (byte)(theInt >> 0)};
  WireEepromWrite(theDeviceAddress, theMemoryAddress, sizeof(int), theByteArray);
}
