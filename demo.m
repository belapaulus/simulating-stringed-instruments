%{
nstrings = 7;
nnotes = 4;
tnote = [0, 1, 2, 3];
dnote = [1, 1, 1, 1];
anote = [1, 1, 1, 1];
inote = [1, 3, 5, 6];

sound = piano(nstrings, nnotes, tnote, dnote, anote, inote);
%}

load "take-me-out-to-the-ball-game.mat"
soundsc(sound(1:2:end));
