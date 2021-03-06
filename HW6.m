%HW6
%GB comments
1a 95 no axis labels
1b 95 no axis labels
1c 95 no axis labels
1d 65 no axis labels. No commentary on the results
1e 95 no axis labels.
2a 95 no axis labels.
2b 95 no axis labels.
2c 95 no axis labels.
Overall: 91

clear all
% Problem 1. Curve fitting. 
% Part 1. Take 10 x values on the interval 0 < x <= 10 and then create y
% values from the x values by plugging the x values into a third order
% polynomial of your choice. Add random noise to the data by choosing a random number
% in the interval [-D, D]. Start with D = 1. Plot your data in the x-y plane.

% polynomial of order 3
X = sort(10*rand(1,10));
y = X.^3.*2+X+3;

% add noise to y
noise = 2*rand(1,10)-1;
Y_1 = noise + y;
% plot the points with noise
figure(1)
scatter(X,Y_1)
title('data points with D=1 ')
% Part 2. Fit your data with polynomials from order 1 to 9. Plot the fitted
% polynomials together with the data. 

% recreate figure 1
figure(2)
scatter(X,Y_1)
title('data points with D=1 and fitted regression line')
% generate R squared and adjusted R squared
R_sq = [];
R_adsq = [];
% fit the data in polynomial from order 1 to 9, and calculate R squared
for i = 1:9
    [coeff, s] = polyfit(X,Y_1,i);
    yfit = polyval(coeff,X);
    yresid = Y_1-yfit;
    SSR = sum(yresid.^2);
    SST = (length(Y_1)-1) * var(Y_1);
    R_sq(i) = 1-SSR/SST;
    R_adsq(i) = 1 - SSR/SST * (length(Y_1)-1)/(length(Y_1)-length(coeff));
    hold on
    plot(X,polyval(coeff,X),'k-','LineWidth',2);
end
% Part 3. On a separate plot, plot the R^2 and adjusted R^2 as a function
% of the order of the polynomial. 
figure(3)
title('R squared, adjusted R squared vs. order of polynomial for D=1')
plot(1:9,R_sq,1:9,R_adsq)

% Part 4. Repeat parts 1 - 3 for D = 10 and D = 1000. Comment on the
% results. 

% for D = 10:
% add noise to y, plot points
noise = 20*rand(1,10)-10;
Y_10 = noise + y;
figure(4)
scatter(X,Y_10)
title('data point with D = 10 and fitted regression line')
% fit the data in polynomial from order 1 to 9, and calculate R squared
R_sq10 = [];
R_adsq10 = [];
for i = 1:9
    [coeff, s] = polyfit(X,Y_10,i);
    yfit = polyval(coeff,X);
    yresid = Y_10-yfit;
    SSR = sum(yresid.^2);
    SST = (length(Y_10)-1) * var(Y_10);
    R_sq10(i) = 1-SSR/SST;
    R_adsq10(i) = 1 - SSR/SST * (length(Y_10)-1)/(length(Y_10)-length(coeff));
    hold on
    plot(X,polyval(coeff,X),'k-','LineWidth',2);
end
figure(5)
title('R squared, adjusted R squared vs. order of polynomial for D=10')
plot(1:9, R_sq10, 1:9, R_adsq10)

% for D = 1000:
% add noise to y, plot points
noise = 2000*rand(1,10)-1000;
Y_1000 = noise + y;
figure(6)
scatter(X,Y_1000)
title('data point with D = 1000 and fitted regression line')
% fit the data in polynomial from order 1 to 9, and calculate R squared
R_sq1000 = [];
R_adsq1000 = [];
for i = 1:9
    [coeff, s] = polyfit(X,Y_1000,i);
    yfit = polyval(coeff,X);
    yresid = Y_1000-yfit;
    SSR = sum(yresid.^2);
    SST = (length(Y_1000)-1) * var(Y_1000);
    R_sq1000(i) = 1-SSR/SST;
    R_adsq1000(i) = 1 - SSR/SST * (length(Y_1000)-1)/(length(Y_1000)-length(coeff));
    hold on
    plot(X,polyval(coeff,X),'k-','LineWidth',2);
end
figure(7)
title('R squared, adjusted R squared vs. order of polynomial for D=1000')
plot(1:9, R_sq1000, 1:9, R_adsq1000)
% Part 5. Now repeat parts 1-3 but take 100 x values on the interval 0 < x <=
% 10. Comment on the results. 

% polynomial of order 3 for 100 X
X_100 = sort(10*rand(1,100));
y_100 = X_100.^3.*2+X_100+3;

% add noise to y
noise = 1*rand(1,100);
Y_100 = noise + y_100;

% plot the points with noise
figure(8)
scatter(X_100,Y_100)
title('100 data points with D=1 and fitted regression line')

% generate R squared and adjusted R squared
R_sq100 = [];
R_adsq100 = [];
% fit the data in polynomial from order 1 to 9, and calculate R squared
for i = 1:9
    [coeff, s] = polyfit(X_100,Y_100,i);
    yfit = polyval(coeff,X_100);
    yresid = Y_100-yfit;
    SSR = sum(yresid.^2);
    SST = (length(Y_100)-1) * var(Y_100);
    R_sq100(i) = 1-SSR/SST;
    R_adsq100(i) = 1 - SSR/SST * (length(Y_100)-1)/(length(Y_100)-length(coeff));
    hold on
    plot(X_100,polyval(coeff,X_100),'k-','LineWidth',2);
end

figure(9)
plot(1:9,R_sq100,1:9,R_adsq100)
title('R squared, adjusted R squared vs. order of polynomial for D=1, 100 Xvals')

% adjusted R squared and R squared becomes more overlapped as compared to
% when we have 10 X values. This happens because the additional factor for
% adjusted R squared (length(Y_100)-1)/(length(Y_100)-length(coeff))
% approaches to 1 as the number of data points increases. 

% Problem 2. Basic statistics. 
% Part 1. Consider two different distributions - Gaussian numbers with a mean of
% 0 and variance 1 and Gaussian numbers with a mean of 1 and variance 1.
% (1) Make a plot of the average p-value for the t-test comparing N random
% numbers chosen from each of these two distributions as a function of N.

N = 100;
p_val = [];
for ii = 1:N
    A = normrnd(0,1,[1,N]);
    B = normrnd(1,1,[1,N]);
    [~,p_val(ii)] = ttest2(A,B);
end

figure(10)
title('p-values vs. N');
plot(1:N,p_val)

% Part 2. Now keep the first distribution the same, but vary the mean of
% the second distribution between 0 and 10 with the same variance and
% repeat part one. Make a plot of all of these different curves on the same
% set of axes. What is special about the case where the mean of the second
% distribution is 0? 

p_val_m = [];
for mean = 0:10
    for ii = 1:N
        A = normrnd(0,1,[1,N]);
        B = normrnd(mean,1,[1,N]);
        [~,p_val_m(mean+1,ii)] = ttest2(A,B);
    end
end
figure(11)
title('p-values vs. N');

for mean = 0:10
    plot(1:N,p_val_m(mean+1,:))
    hold on
end

% only the curve with second distribution mean = 0 can be seen here given
% how the axis are set. In that case, because the two samples come from the
% same distributions, the p-value is significantly larger than the rest of
% the average p-values, which means when mean = 0 for both distributions,
% we do not reject the null, meaning two distributions are the same. When
% the second mean is different from the first, we get much smaller average
% p-values that cannot show on the same scale of the p-value of mean = 0.

% Part 3. Now keep the means of the two distributions at 0 and 1 as in part
% 1, but vary the variance of both distributions simultaneiously between 0.1 and 10 and plot the 
% p-values vs the number of numbers drawn as before. Comment on your results.  
N = 100;
p_val_m2 = [];
for var = 0.1:2:10.1
    for ii = 1:N
        A = normrnd(0,var,[1,N]);
        B = normrnd(1,var,[1,N]);
        [~,p_val_m2((var-0.1)/2+1,ii)] = ttest2(A,B);
    end
end
figure(13)
title('p-values vs. N');

for i = 1:6
    plot(1:N,p_val_m2(i,:))
    hold on
end
legend('var = 0.1','var = 2.1','var = 4.1','var = 6.1','var = 8.1','var = 10.1')
% when variance = 0.1, p-value is the smallest. Because all samples chosen
% are very close to their distribution mean, the two samples are very
% different from each other and thus have a very high chance of rejecting
% the null hypothesis (i.e. small p-value). As variance grows larger,
% p-value becomes larger since the two samples are starting to overlap as
% they deviate from their distribution means more. Thus it's harder to
% reject the null that the two samples come from distributions with the
% same mean. In other words the p-value gets higher. 
