/* Morse Code */
// Examples
// SOS               ...___...
// Morse Code        __ ___ ._. ... .  _._. ___ _.. .
// Understood        ..._.
char morse_code[] = "...___...";  // The morse code the LED will blink for

// constants won't change. Used here to 
// set pin numbers:
const int ledPin =  13;                  // the number of the LED pin
const int short_interval = 250;         // interval at which to blink (milliseconds)
const int long_interval = 700;          // interval at which to blink (milliseconds)
const int space_interval = 1000;        // interval at which to blink (milliseconds)
const int phrase_end_interval = 5000;   // interval at which to blink (milliseconds)

// Variables that will change:
int ledState = LOW;             // ledState used to set the LED
int letterSpot = 0;             // Current letter you are testing in the morse code

void setup() {
  // set the digital pin as output:
  pinMode(ledPin, OUTPUT);    
}

void loop()
{
  if(morse_code[letterSpot] == '.') { 

    // if the LED is off turn it on:
    if (ledState == LOW)
      ledState = HIGH;
      
    digitalWrite(ledPin, ledState);
    
    delay(short_interval);
  }
  else if (morse_code[letterSpot] == '_') {

    // if the LED is off turn it on:
    if (ledState == LOW)
      ledState = HIGH;

    digitalWrite(ledPin, ledState);
    
    delay(long_interval);
  }
  else {
    //Space in the morse code
    letterSpot++;
    delay(space_interval);
  }
  
  if (ledState == HIGH) {
    // if the LED is on turn it off:
    ledState = LOW;
    digitalWrite(ledPin, ledState);
  }
  
  if (letterSpot < sizeof(morse_code) - 1) {
    // Move to the next letter in the morse code, unless you are at the end
    letterSpot++;
  }
  else {
    // Long pause at the end of the phrase before it starts over again
    letterSpot = 0;
    delay(phrase_end_interval);
  }
  
  // Small pause
  delay(short_interval);
  
}
