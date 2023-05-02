function [inoteChord, dnoteChord, tnoteChord, anoteChord] = getChords
inoteChord = [13, 20, 20, 8, 17, 17, 8, 15, 15, 3, 24, 24 ...
    13, 20, 20, 8, 17, 17, 8, 15, 15, 8, 9, 10 ...
    10, 17, 17, 5, 17, 17, 15, 22, 22, 10, 22, 22 ...
    15, 22, 22, 10, 22, 22, 8, 23, 23, 15, 23, 23 ...
    13, 20, 20, 8, 17, 17, 8, 15, 15, 3, 15, 15 ...
    13, 20, 20, 13, 23, 23, 18, 25, 25, 13, 25, 25 ...
    18, 25, 25, 19, 25, 25, 20, 25, 25, 17, 25, 25 ...
    15, 22, 22, 8, 18, 18, 13, 20, 20, 1];

dnoteChord = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,  ...
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, ...
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ...
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ...
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ...
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2];

tnoteChord = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, ...
    13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, ...
    25,26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, ...
    37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, ...
    49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, ...
    61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, ...
    73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, ...
    85, 86, 87, 88, 89, 90, 91, 92, 93, 94];

anoteChord = ones(1, 94);