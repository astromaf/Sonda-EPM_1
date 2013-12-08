#include "DHT.h"
#include <Wire.h>
#include <EEPROM.h>
#include <NewSoftSerial.h>
#include <Adafruit_GPS.h>

#define DHTPIN 5     // what pin we're connected to
#define TemPIN A1     // what pin we're connected to
#define mpxPIN A3     // what pin we're connected to
#define p1 4     // what pin we're connected to
#define p2 6     // what pin we're connected to
#define led 13     // what pin we're connected to
#define led2 12     // what pin we're connected to
#define DHTTYPE DHT22   // DHT 22  (AM2302)

DHT dht(DHTPIN, DHTTYPE);
NewSoftSerial mySerial(3, 2);
Adafruit_GPS GPS(&mySerial);

#define GPSECHO  false
boolean usingInterrupt = false;
void useInterrupt(boolean); // Func prototype keeps Arduino 0023 happy

long tope=64000;///////********/////////*******////////

int theMemoryAddress = 0;
const int theDeviceAddress = 80;

//long muestras=0;
//long errores=0;

 byte  hum=0;
 byte tempH=0;
 byte  hum2=0;
 byte tempH2=0;
 byte temp=0;
 int presion=0;
 int espera=16; //14


void setup() {
  
  pinMode(p1, INPUT);     
  pinMode(p2, INPUT);
  pinMode(led, OUTPUT); //Azul  
  pinMode(led2, OUTPUT); //Rojo   
  Serial.begin(9600);  
  dht.begin();
  Wire.begin();
  GPS.begin(9600); // 9600 NMEA is the default baud rate for MTK
  
  theMemoryAddress=word(EEPROM.read(70),EEPROM.read(69));
  delay(5000);
  Serial.print("Memory Aderess: "); 
  Serial.println(theMemoryAddress); 
  
 //limpio_eeprom();
 
  //Remove before flight
  while(digitalRead(p2)==HIGH){
    Serial.print("STOP!"); 
    digitalWrite(led, HIGH);  
     delay(1000); 
  }
  Serial.println(); 
   //Cuenta atras
  for(int i=0;i<espera;i++){
    digitalWrite(led, HIGH); 
    delay(500);  
    digitalWrite(led, LOW); 
    delay(500);  
  }
  useInterrupt(true);
  delay(500);
 
   gpslogger();
}

void loop() {
 
 if (digitalRead(p1)==LOW) {
    dht22();
    temp36();
    mpx();    
    //echo();
    guardo_datos();
   // muestras++;  
    //Serial.print("Muestras:");
    //Serial.print(muestras); 
   // Serial.print("  Errores:");
    //Serial.println(errores); 
    digitalWrite(led, HIGH); 
    delay(1000);
    digitalWrite(led, LOW); 
    delay(espera*1000);   //segundos enetre muestras  
  } 
  else {
    digitalWrite(led, HIGH); 
   theMemoryAddress=word(EEPROM.read(20),EEPROM.read(19)); 
   descargo_datos();
   //Serial.print("Descargo!"); 
     
  }
 
 
}






