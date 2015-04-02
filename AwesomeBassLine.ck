//30_days_of_code
//Awesome Bass Line
//Chuck 

Scale sc; TimeGrid tg;

StifKarp inst => dac; //plucked string

tg.set( 1::minute/140/2, 8, 8 ); //140::bpm, 8 beats, 8 measures

[0, 3, 4, 1, 5, 4, 3, 3] @=> int bass[]; //pick the notes on the bass

tg.sync(); //sync() so all shreds will start on the nearest beat:

while( true ) { //infinite loop
  tg.guess() => int i; //global beat indicator
  tg.m(i) => int m; //measure indicator

  sc.scale( bass[m], sc.maj ) => int note; //select the bassnote
  std.mtof( 3*12 + 7 + note ) => inst.freq; //7 semitones from C is G

  inst.noteOn( 0.7 ); //play a note

  tg.beat => now; //advance by one beat
}