load('olk01041819.mat')
data_spring = hourly01041819(hourly01041819(:, 7) == 1, :);
data_summer = hourly01041819(hourly01041819(:, 7) == 2, :);
data_autumn = hourly01041819(hourly01041819(:, 7) == 3, :);
data_winter = hourly01041819(hourly01041819(:, 7) == 4, :);

winter_trunc = df_truncating(data_winter); %% this is to align the data frame to start on a Monday at 00:00
winter_trunc = winter_trunc(1:168*floor(size(winter_trunc,1)/168),:); %% this is to ensure a round number of weeks for ease of calculation

pump_winter = winter_trunc(:,21); %% heat pump compressor consumption, refer to the data table for the column index of interested data

% matrix profile 
[snippet fraction idx] = snippetfinder(winter_trunc(:,21), 3, 24*7, 20);
pump_winter_mp = fraction(1:24*7);
pump_winter_avg = mean(reshape(pump_winter, 168, []),2);
timeline = 0:1:167;

figure
plot(timeline, pump_winter_mp, timeline, pump_winter_avg);

mse_mp = immse(pump_winter, repmat(pump_winter_mp, [12 1]))
mse_avg = immse(pump_winter, repmat(pump_winter_avg, [12 1]))