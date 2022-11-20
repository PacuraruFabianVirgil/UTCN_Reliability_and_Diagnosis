% Statistical reliability indicators
% Solutions (without plots) for Worksheet RD-1, problem 1 (data grouping)
% Reliability and Diagnosis
% Busoniu, Miclea, Enyedi, 2005

% Tested on Matlab 5.2

% IN:
% data - raw data vector
% OUT: [lo hi xc sad caf srf crf]
% LO -  lower limits of the intervals
% HI -  upper limits of the intervals
% XC -  center values of the intervals
% SAF -  simple absolute frequencies
% CAF -  cumulated absolute frequencies
% SRF -  simple relative frequencies
% CRF -  cumulated relative frequencies
function [lo,hi,xc,saf,caf,srf,crf] = groupdata(data)

sd = sort(data);
n = length(data);

w = sd(n) - sd(1);
m = round(sqrt(n));
iw = w / (m - 1);

l = sd(1) - iw / 2;
h = l + iw;

for i = 1 : m,
   lo(i) = l; hi(i) = h;
   interval = find(sd >= l & sd < h);
   xc(i) = l + iw / 2;
   saf(i) = length(interval);
   caf(i) = sum(saf(1 : i));
   srf(i) = saf(i) / n;
   crf(i) = sum(srf(1 : i));
   l = l + iw; h = h + iw;			% shift interval
end;