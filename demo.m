data = csvread("notes.csv");
tnote = data(:, 1);
dnote = data(:, 3);
inote = data(:, 2);
[nnotes, ~] = size(tnote);
tnote = tnote/2;
dnote = dnote/2;
anote = ones(nnotes, 1);
sample_rate = 44000;
sound = piano(65.40639, tnote', dnote', anote', inote', sample_rate);
%sound = piano(329.6276, tnote', dnote', anote', inote');
%soundsc(sound);
%sound = sound / prctile(abs(sound), 99.9);
save sound.mat sound
sound = sound / max(abs(sound));
save normalized_sound.mat sound
audiowrite("sound.wav", sound, sample_rate);
