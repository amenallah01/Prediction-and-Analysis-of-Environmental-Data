fe = 40000; 

x = num2str(input('Please enter a telephone number : '));
disp(['Number length : ', num2str(length(x))]);

% Verification of an 8-digit number.
while length(x) ~= 8
    x = num2str(input('Please enter a valid phone number : '));
end

signal = zeros(1, length(x) * fe);  % Make sure the signal length is sufficient

% Signal generation for each digit
for s = 1:length(x)
    [ff, f] = Codage(x(s));
    signal((s-1)*fe + 1:s*fe) = cos(2 * pi * ff / fe * (1:fe)) + cos(2 * pi * f / fe * (1:fe));
end

disp('Signal generated :');
disp(signal);

% Signal generation for each digit
sound(signal, fe);

function [ff, f] = Codage(x)
    ff = 0;
    f = 0;

    A = [1209, 1336, 1477, 1633];
    B = [697, 770, 852, 941];
    AA = ['1', '2', '3', 'A'];
    BB = ['4', '5', '6', 'B'];
    CC = ['7', '8', '9', 'C'];
    DD = ['*', '0', '#', 'D'];

    if ismember(x, AA)
        l = find(AA == x);
        ff = A(l);
        f = B(1);
        disp(['Touch : ', AA(l)]);
    elseif ismember(x, BB)
        l = find(BB == x);
        ff = A(l);
        f = B(2);
        disp(['Touch : ', BB(l)]);
    elseif ismember(x, CC)
        l = find(CC == x);
        ff = A(l);
        f = B(3);
        disp(['Touch : ', CC(l)]);
    elseif ismember(x, DD)
        l = find(DD == x);
        ff = A(l);
        f = B(4);
        disp(['Touch : ', DD(l)]);
    end
end
