function sound = piano(lowfreq, tnote, dnote, anote, inote, sample_rate)
	% function piano:
	% simulate a piano with nstrings strings to play nnotes notes
	% the notes are described in the tnote, dnote, anote and inote arrays
	% each array has one entry per note, each entry describes:
	% 	tnote - onset time
	%	dnote - duration
	% 	anote - relative amplitude
	%	inote - index of the string
	sound = [];
	[~, nnotes] = size(tnote);
	nstrings = max(inote);

	% initialize string parameters:
	% 	string_length - length of the strings
	% 	mass_per_length - mass per length for each string 
	% 	nspace_steps - number of points per string
	% 	space_step - the space step
	% 	lowfreq - frequency of the string with the lowest pitch
	%
	% 	decay_time - array of decay times
	% 	tension - tension of each string
	% 	damping_constant - damping constant for each string
	%	dtmax - largest stable timestep for each string
	string_length = 1; 
	mass_per_length = 1;
	nspace_steps = 81;
	space_step = string_length / (nspace_steps - 1);
	for i = 1:nstrings
		frequency = lowfreq * 2^((i - 1) / 12);
		tension(i) = mass_per_length * ...
			(2 * string_length * frequency)^2;
		decay_time(i) = 40 * (lowfreq / frequency);
		damping_constant(i) = ...
			(2 * mass_per_length * string_length^2) / ...
			(decay_time(i) * pi^2);

		% Find the largest stable timestep for string i:
		a = damping_constant(i) / tension(i);
		b = space_step^2 / (tension(i) / mass_per_length);
		dtmax(i) = -a + sqrt(a^2 + b);
	end

	% setting up the timestep and duration of the simulation:
	% The timestep of the computation has to be stable for all strings
	% so the timestep has to be smaller than the smallest dtmax.
	sample_step = 1/sample_rate;
	nskip = ceil(sample_step * (1 / min(dtmax)));
	time_step = sample_step * (1 / nskip);
	duration = tnote(end) + dnote(end);
	ntime_steps = ceil(duration / time_step);

	% relevant indices
	% 	jstrike - indeces of the pointes hit by the hammer
	%	jint - indeces of  all interior points
	xh1 = 0.25 * string_length;
	xh2 = 0.35 * string_length;
	jstrike = ceil(1 + xh1 / space_step):floor(1 + xh2 / space_step);
	jint = 2:(nspace_steps - 1);

	% initialize remaining data structures needed for the simulation
	%	n - note counter
	%	tstop - dynamically records for each string when to stop
	%	H, V - arrays to store the state of the strings
	n = 1;
	tstop = zeros(nstrings, 1);
	H = zeros(nstrings, nspace_steps);
	V = zeros(nstrings, nspace_steps);

	for step = 1:ntime_steps
		time = step * time_step;

		% strike string
		while ((n <= nnotes) && (tnote(n) <= time))
			V(inote(n), jstrike) = anote(n);
			tstop(inote(n)) = time + dnote(n);
			n = n+1;
		end
		
		% simulate the strings
		for i = 1:nstrings
			if(time > tstop(i))
				H(i,:)=zeros(1, nspace_steps);
				V(i,:)=zeros(1, nspace_steps);
				continue;
			end

			a = time_step / space_step^2;
			b = (tension(i) / mass_per_length) * ...
				(H(i, jint+1) - 2*H(i, jint) + H(i, jint-1));
			c = (damping_constant(i) / mass_per_length) * ...
				(V(i, jint+1) - 2*V(i, jint) + V(i, jint-1));

			V(i, jint) = V(i, jint) + a*b + a*c;
			H(i, jint) = H(i, jint) + time_step*V(i, jint);
		end

		% sample the sound
		if (mod(step, nskip) == 0)
			sound(end+1) = sum(H(:, 2));
		end
	end
end
