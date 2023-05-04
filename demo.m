% load the data
data = csvread("notes/notes.csv");

% tnote dnote anote inote
tnote = data(:, 1);
dnote = data(:, 3);
inote = data(:, 2);
[nnotes, ~] = size(tnote);
tnote = tnote*0.4;
dnote = dnote/2;
anote = ones(nnotes, 1);

% run the simulation
sample_rate = 44000;
sound = piano(65.40639, tnote', dnote', anote', inote', sample_rate);

% normalize and save the output
save sound.mat sound
sound = sound / max(abs(sound));
save normalized_sound.mat sound
audiowrite("sound.wav", sound, sample_rate);
