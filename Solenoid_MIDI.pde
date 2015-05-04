// Jan 2012 
//
// DARGS SOLENOID MIDI
//
// http://timothytwillman.com/itp_blog/zf
// using what i've renamed 'midi2' library
// compiled in Arduino 0019 (not 21 or 22 - reports '' ?)

#include "Midi.h"

int solenoids[13]={0,0,0,0,0,0,0,0,0,0,0,0,0}; // 13, to avoid using the first value, 0 
int pointer;

class MyMidi : public Midi {  // Need this to compile; it just hands things off to the Midi class.
  public:
  MyMidi(HardwareSerial &s) : Midi(s) {} 


void handleNoteOn(unsigned int channel, unsigned int note, unsigned int velocity)
  {

    digitalWrite(14, HIGH); // Analog Pin 0 Debug 


if (note > 8 && note < 21) // Octave = 0, subtract 8 to get 1-12 value
    {
      pointer = (note - 8);
    }

if (note > 20 && note < 33) // Octave = 1, subtract 20 to get 1-12 value
    {
      pointer = (note - 20);
    }
    
if (note > 32 && note < 45) // Octave = 2, subtract 32 to get 1-12 value
    {
      pointer = (note - 32);
    }

if (note > 44 && note < 57) // Octave = 3, subtract 44 to get 1-12 value
    {
      pointer = (note - 44);
    }

if (note > 56 && note < 69) // Octave = 4, subtract 56 to get 1-12 value
    {
      pointer = (note - 56);
    }

if (note > 68 && note < 81) // Octave = 5, subtract 68 to get 1-12 value
    {
      pointer = (note - 68);
    }

if (note > 80 && note < 93) // Octave = 6, subtract 80 to get 1-12 value
    {
      pointer = (note - 80);
    }

if (note > 92 && note < 105) // Octave = 7, subtract 92 to get 1-12 value
    {
      pointer = (note - 92);
    }
    
if (note > 104 && note < 117) // Octave = 8, subtract 104 to get 1-12 value
    {
      pointer = (note - 104);
    }

if (note > 116 && note < 129) // Octave = 9, subtract 116 to get 1-12 value
    {
      pointer = (note - 116);
    }
   
if (velocity == 0) solenoids[pointer] = 0;
if (velocity >= 0) solenoids[pointer] = 1;


digitalWrite((pointer+1), solenoids[pointer]); // pointer will be 1-12, we want 2-13

/*  DEBUG 
  Serial.print("NOTE ON: ");
  Serial.print("  channel: ");
  Serial.print(channel);
  Serial.print(" note: ");
  Serial.print(note);
  Serial.print(" velocity: ");
  Serial.print(velocity);
  Serial.print(" pointer: ");
  Serial.print(pointer);
  Serial.print(" array_value: ");
  Serial.println(solenoids[pointer]);
*/

}

void handleNoteOff(unsigned int channel, unsigned int note, unsigned int velocity)
{
    digitalWrite(14, LOW); // analog pin 0 = debug pin

  
  if (note > 8 && note < 21) // Octave = 0, subtract 8 to get 1-12 value
    {
      pointer = (note - 8);
    }

if (note > 20 && note < 33) // Octave = 1, subtract 20 to get 1-12 value
    {
      pointer = (note - 20);
    }
    
if (note > 32 && note < 45) // Octave = 2, subtract 32 to get 1-12 value
    {
      pointer = (note - 32);
    }

if (note > 44 && note < 57) // Octave = 3, subtract 44 to get 1-12 value
    {
      pointer = (note - 44);
    }

if (note > 56 && note < 69) // Octave = 4, subtract 56 to get 1-12 value
    {
      pointer = (note - 56);
    }

if (note > 68 && note < 81) // Octave = 5, subtract 68 to get 1-12 value
    {
      pointer = (note - 68);
    }

if (note > 80 && note < 93) // Octave = 6, subtract 80 to get 1-12 value
    {
      pointer = (note - 80);
    }

if (note > 92 && note < 105) // Octave = 7, subtract 92 to get 1-12 value
    {
      pointer = (note - 92);
    }
    
if (note > 104 && note < 117) // Octave = 8, subtract 104 to get 1-12 value
    {
      pointer = (note - 104);
    }

if (note > 116 && note < 129) // Octave = 9, subtract 116 to get 1-12 value
    {
      pointer = (note - 116);
    }
  
solenoids[pointer] = 0; // because we're in MIDI OFF - the there's no velocity to consider.

digitalWrite((pointer+1), LOW); 


/*  DEBUG 
  Serial.print("NOTE OFF: ");
  Serial.print(" channel: ");
  Serial.print(channel);
  Serial.print(" note: ");
  Serial.print(note);
  Serial.print(" velocity: ");
  Serial.print(velocity);
  Serial.print(" pointer: ");
  Serial.print(pointer);
  Serial.print(" array_value: ");
  Serial.println(solenoids[pointer]);
*/

}
  
  /* You can define any of these functions and they will be called when the
     matching message type is received.  Otherwise those types of Midi messages
     are just ignored.

    For C++ folks: these are all declared virtual in the base class

  void handleNoteOn(unsigned int channel, unsigned int note, unsigned int velocity)
  {
    digitalWrite(13, HIGH);
  }

  void handleNoteOff(unsigned int channel, unsigned int note, unsigned int velocity)
  {
    digitalWrite(13, LOW);
  }
  
    void handleNoteOff(unsigned int channel, unsigned int note, unsigned int velocity);
    void handleNoteOn(unsigned int channel, unsigned int note, unsigned int velocity);
    void handleVelocityChange(unsigned int channel, unsigned int note, unsigned int velocity);
    
    void handleControlChange(unsigned int channel, unsigned int controller, unsigned int value);
    
    void handleProgramChange(unsigned int channel, unsigned int program);
    void handleAfterTouch(unsigned int channel, unsigned int velocity);
    void handlePitchChange(unsigned int pitch);
    void handleSongPosition(unsigned int position);
    void handleSongSelect(unsigned int song);
    void handleRuneRequest(void);
    void handleSync(void);
    void handleStart(void);
    void handleContinue(void);
    void handleStop(void);
    void handleActiveSense(void);
    void handleReset(void);
*/
};

MyMidi midi(Serial);



void setup() 
{
//    Serial.begin(31250);

for (int x = 2; x < 15; x++)
{
  pinMode(x, OUTPUT); // pin 14 = analog 0 = debug led
}

midi.begin(0);

// more debug

// onesecloop();

// onesecloop2();

}


void loop()
{
  // Must be called every time through loop() IF dealing with incoming MIDI --
  //  if you're just sending MIDI out, you don't need to use poll().
  //
  // Make sure other code doesn't take too long to process or serial data
  //  can get backed up (and you can end up with obnoxious latency that ears
  //  don't like).
  //
  // The poll function will cause the midi code to suck data from the serial 
  //  port and process it, and call any functions that are defined for handling
  //  midi messages.
  midi.poll();
}

void onesecloop()  
{
for (int x = 2; x < 14; x++)
{
  digitalWrite(x, HIGH);   // set the Solenoid
  delay(1000);              // wait for a second
  digitalWrite(x, LOW);    // set the LED Solenoid
}
}

void onesecloop2()  
{
for (int x = 2; x < 14; x++)
{
  digitalWrite(x, 1);   // set the Solenoid
  delay(1000);              // wait for a second
  digitalWrite(x, 0);    // set the LED Solenoid
}
}
