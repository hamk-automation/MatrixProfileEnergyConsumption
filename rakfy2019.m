load('olk01041819.mat')
data_spring = hourly01041819(hourly01041819(:, 7) == 1, :);
data_summer = hourly01041819(hourly01041819(:, 7) == 2, :);
data_autumn = hourly01041819(hourly01041819(:, 7) == 3, :);
data_winter = hourly01041819(hourly01041819(:, 7) == 4, :);

winter_trunc = df_truncating(data_winter); %% this is to align the data frame to start on a Monday at 00:00
winter_trunc = winter_trunc(1:168*floor(size(winter_trunc,1)/168),:); %% this is to ensure a round number of weeks for ease of calculation

pump_winter = winter_trunc(:,21); %% heat pump compressor consumption, refer to the data table for the column index of interested data

% matrix profile 
[snippet fraction idx] = snippetfinder(winter_trunc(:,21), 2, 24*7, 40);
pump_winter_mp = fraction(1:24*7);
pump_winter_avg = mean(reshape(pump_winter, 168, []),2);
timeline = 0:1:167;

figure
plot(timeline, pump_winter_mp,'r-') 
hold on
plot(timeline, pump_winter_avg, 'b--');


mse_mp = immse(pump_winter, repmat(pump_winter_mp, [12 1]));
mse_avg = immse(pump_winter, repmat(pump_winter_avg, [12 1]));
figure
n = floor(size(winter_trunc,1)/168);
for i = 1:floor(size(winter_trunc,1)/168)/2
    subplot(n/4,2,i);
    plot(timeline, pump_winter((i-1)*168+1:i*168), ':', 'LineWidth', 1.5);
    hold on
    plot(timeline, pump_winter_mp,'r-', 'LineWidth', 1) 
    hold on
    plot(timeline, pump_winter_avg, 'k--', 'LineWidth', 1);
    ylim([0 13]);xlim([1 168]);
    xticks([0:24:167 167]);
    title(['Week' ' ' num2str(i)]);
end
hold on
legend('Measured data', 'Average profile', 'Snippets');
figure
for i = floor(size(winter_trunc,1)/168)/2+1:floor(size(winter_trunc,1)/168)
    subplot(n/4,2,i-n/2);
    plot(timeline, pump_winter((i-1)*168+1:i*168),':', 'LineWidth', 1.5);
    hold on
    plot(timeline, pump_winter_mp,'r-', 'LineWidth', 1) 
    hold on
    plot(timeline, pump_winter_avg, 'k--', 'LineWidth', 1);
    ylim([0 13]);xlim([1 168]);
    xticks([0:24:167 167]);
    title(['Week' ' ' num2str(i)]);
end

hold on
legend('Measured data', 'Average profile', 'Snippets');