% Statistical reliability indicators
% Solutions (without plots) for Worksheet RD-1, problem 2 (statistical indicators)
% Reliability and Diagnosis
% Enyedi, Miclea, Busoniu, 2007

% direct method

% direct localization indicators
xs=sort(data);
arithmetic_mean=mean(xs) % xs is sorted data
prod=1;for i=1:length(xs),prod=prod*xs(i),end;geometric_mean=prod^(1/length(xs))
% another version of the geometric mean: (prod(xs))^(1/length(xs))
% yet another geometric mean: geomean(xs)
square_mean=norm(xs)/sqrt(length(xs))
harmonic_mean=harmmean(xs)
median_xs=median(xs)
xcenter=(xs(1)+xs(length(xs)))/2 % center value

% direct variation indicators
sum=0;
for i=1:length(xs)
    sum=sum+(x(i)-arithmetic_mean)^2
end;
estimated_dispersion=sum/length(xs)
sum=0;
for i=1:length(xs)
    sum=sum+(x(i)-arithmetic_mean)^2
end;
sampled_dispersion=sum/(length(xs)-1)
estimated_standard_deviation=sqrt(estimated_dispersion)
sampled_standard_deviation=std(xs)
quartile_one=prctile(xs,25) % or quartile_one=(xs(length(xs)/4)+xs(length(xs)/4+1))/2 % make sure n is even, not odd
quartile_two=prctile(xs,50)
quartile_three=prctile(xs,75)
interquartile_range=quartile_three-quartile_one
interquartile_variation_coefficient=interquartile_range/quartile_two
variation_coefficient=sampled_standard_deviation/arithmetic_mean

% direct asymmetry indicators
absolute_asymmetry=abs(arithmetic_mean-square_mean)
relative_asymmetry=absolute_asymmetry/sampled_standard_deviation
interquartile_asymmetry_coefficient=1-2*(quartile_two-quartile_one)/(quartile_three-quartile_one)

% indirect method

% indirect localization indicators
arithmetic_mean_indirect=0;for i=1:round(sqrt(length(xs))),arithmetic_mean_indirect=arithmetic_mean_indirect+srf(i)*xc(i),end; % xc center values, srf simple absolute frequencies

% computing mode zero below
delta_one=0;
for i=2:round(sqrt(length(xs)))
 if saf(i)-saf(i-1)>delta_one
  delta_one=saf(i)-saf(i-1)
 end
end
delta_two=0;
for i=1:round(sqrt(length(xs)))-1
 if saf(i)-saf(i+1)>delta_two
  delta_two=saf(i)-saf(i+1)
 end
end
mode_zero=max(saf)+delta_one/(delta_one+delta_two)*omega

% indirect variation indicators

% computing the indirect estimated dispersion below
sum=0
for i=1:round(sqrt(length(xs)))
 sum=sum+saf(i)*(xc(i)-arithmetic_mean_indirect)^2
end
estimated_dispersion_indirect=sum/length(xs)

% computing the indirect sampled dispersion below
sum=0
for i=1:round(sqrt(length(xs)))
 sum=sum+saf(i)*(xc(i)-arithmetic_mean_indirect)^2
end
sampled_dispersion_indirect=sum/(length(xs)-1)

sampled_standard_deviation_indirect=sqrt(estimated_dispersion_indirect)
corrected_standard_deviation_indirect=sqrt(sampled_dispersion_indirect)
variation_coefficient_indirect=corrected_standard_deviation_indirect/arithmetic_mean_indirect

% the Yule ratio

yule_ratio=abs(arithmetic_mean_indirect-mode_zero)/abs(arithmetic_mean-median_xs)