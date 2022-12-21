//BasicMidi_object.pde (Week 8)

import themidibus.*;

class Audio {
  Midi[] mymidi;
  MidiBus myBus; // The MidiBus

  Audio() {
    myBus = new MidiBus(this, 0, 3); // Create a new MidiBus using the device index to select the Midi input and output devices
    mymidi = new Midi[3];
    for (int i = 0; i < 3; i++) {
      mymidi[i] = new Midi(i);
    }
  }

  void drawAudio() {
    for (int i = 0; i < 3; i++) {
      mymidi[i].play();
    }
  }

  class Midi {
    int midichannel;
    Midi(int mc) {
      midichannel = mc;
    }

    void play() {
      int channel = midichannel;
      int pitch = int(random(127));
      int velocity = 127;
      myBus.sendNoteOn(channel, pitch, velocity); // Send a Midi noteOn
      myBus.sendNoteOff(channel, pitch, velocity); // Send a Midi nodeOff
    }
  }
}
