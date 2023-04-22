nstrings = 7;
nnotes = 4;
tnote = [0, 1, 2, 3];
dnote = [1, 1, 1, 1];
anote = [1, 1, 1, 1];
inote = [1, 3, 5, 6];

sound = piano(nstrings, nnotes, tnote, dnote, anote, inote);

soundsc(sound);
