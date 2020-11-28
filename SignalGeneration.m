
%% User Guide Manual
disp('Welcome to the World of Signal Generation');
disp('Please select the Signal that you want to generate :-');
disp('1. Square Wave.'); disp('2. Sawtooth.');
disp('3. Triangular Wave.'); disp('4. Full-wave Rectified.');
disp('5. Half-wave Rectified.'); disp('6. Rectangular Wave.');
disp('7. Impulse Train.');
ss = input('Enter the Signal number = ');
%%  Taking inputs from user for Signal Parameters
Amp = input('Enter the Amplitude of Signal = ');
T_0 = input('Enter the Time Period of Signal = ');
cc = input('Enter the Copies of Signal to plot = ');
kk = input('Enter the Number of harmonics for Fourier Series = ');
t= -cc*T_0:0.01:cc*T_0;

switch ss
%% Square Wave
    case 1
        yt = 0;   % Dc value in Fourier Series
        for k = -kk:kk
            if k == 0    % For DC Value
                yt = yt;
            elseif mod(k,2)~=0    % For Odd Harmonics
                yt = yt + (-1i*2*Amp)./(pi*k).*exp(k*1i*2*pi*t/T_0);
            else         % For Even Harmonics
                yt = yt + 0;    
            end
        end
        plot(t,yt);
        xlabel('Time (sec)');  ylabel('x(t)');
        title('Square Wave')

%% Sawtooth Signal
    case 2
        yt = Amp/2;  % Dc value in Fourier Series
        for k = -kk:kk
            if k == 0      % For DC Value
                yt = yt;
            else           % For Even and Odd Harmonics
                yt = yt + ((1i*Amp)/(2*pi*k)).*exp(k*1i*2*pi*t/T_0);
            end
        end
        plot(t,yt);
        xlabel('Time (sec)');  ylabel('x(t)');
        title('Sawtooth Signal')
        
%% Triangular Wave
    case 3
        yt = Amp/2;  % Dc value in Fourier Series
        for k = -kk:kk
            if k == 0    % For DC Value
                yt = yt;
            elseif mod(k,2)~=0   % For Odd Harmonics
                yt = yt + (-2*Amp)./(pi*pi*k*k).*exp(k*1i*2*pi*t/T_0);
            else      % For Even Harmonics
                yt = yt + 0;
            end
        end
        plot(t,yt);
        xlabel('Time (sec)');  ylabel('x(t)');
        title('Triangular Wave')

%% Full Rectified
    case 4
        yt = 2*Amp/pi;   % Dc value in Fourier Series
        for k = -kk:kk
            if k == 0    % For DC Value
                yt = yt;
            else       % For Even and Odd Harmonics
                yt = yt + (-2*Amp/(pi*((4*k^2)-1))).*exp(k*1i*2*pi*t/T_0);
            end
        end
        plot(t,yt);
        xlabel('Time (sec)');  ylabel('x(t)');
        title('Full-wave Rectified')

%% Half Rectified
    case 5
        yt = Amp/pi;   % Dc value in Fourier Series
        for k = -kk:kk
            if k == 0     % For DC Value
                yt = yt;
            elseif mod(k,2)~=0     
                if k==1 || k==-1      % For First Harmonic 
                    yt = yt +(-k*1i*Amp/4).*exp(k*1i*2*pi*t/T_0);
                else
                    yt = yt + 0;    % For Odd Harmonics
                end
            else            % For Even Harmonics
                yt = yt + (-Amp/(pi*((k^2)-1))).*exp(k*1i*2*pi*t/T_0);
            end
        end
        plot(t,yt);
        xlabel('Time (sec)');  ylabel('x(t)');
        title('Half-wave Rectified')

%% Rectangular Signal
    case 6
        yt = Amp/2;    % Dc value in Fourier Series
        for k = -kk:kk
            if k == 0         % For DC Value
                yt = yt;
            else       % For Even and Odd Harmonics
                yt = yt + (Amp/2).*(sin(pi*k/2)./(pi*k/2)).*exp(k*1i*2*pi*t/T_0);
            end
        end
        plot(t,yt);
        xlabel('Time (sec)');  ylabel('x(t)');
        title('Rectangular Signal')

%% Impulse Train
    case 7
        yt = 0;    % Dc value in Fourier Series
        for k = -kk:kk
            if k == 0        % For DC value
                yt = yt;
            else           % For Even and Odd Harmonics
                yt = yt + exp(k*1i*2*pi*t/T_0);
            end
        end
        yt = yt/(2*k)*Amp;
        plot(t,yt);
        xlabel('Time (sec)');  ylabel('x(t)');
        title('Impulse Train')
end
