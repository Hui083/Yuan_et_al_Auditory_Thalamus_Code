% This code is compatible with GNU Octave.
clear all
close all


load('lfp_example.mat'); 

time_axis = fig_data.time_axis;
channels_to_plot = fig_data.channels;
thalamus_channel = fig_data.thalamus;
Channel_Spacing = 3.2;  
y_limits = [-20, 120];   

%% Figure 1: 
figure(1)
set(gcf, 'Position', [100, 100, 1400, 900])
set(gcf, 'Name', '刺激类型1-3（-0.5s to 1s）')

for stim_type = 1:3
    subplot(1, 3, stim_type);
    
    for idx = 1:length(channels_to_plot)
        channel_num = channels_to_plot(idx);
        
        signal_data_cut = fig_data.stim(stim_type).q_stim_cut(:, channel_num);
        y_offset = (idx-1) * Channel_Spacing;
        
        if ismember(channel_num, thalamus_channel)
            plot(time_axis, signal_data_cut + y_offset, 'r');
        else
            plot(time_axis, signal_data_cut + y_offset, 'k');
        end
        hold on
    end
    
    xlim([-0.1, 0.6])
    ylim(y_limits) 
    
    yticks([]); 
    
    % === 添加刺激开始 (0s) 和 0.5s 的红色虚线 ===
    line([0 0], y_limits, 'Color', 'red', 'LineStyle', '--', 'LineWidth', 1.5);
    line([0.5 0.5], y_limits, 'Color', 'red', 'LineStyle', '--', 'LineWidth', 1.5);
    
    text(0.02, y_limits(2)*0.95, '0s', 'Color', 'red', 'FontSize', 9, 'FontWeight', 'bold');
    text(0.52, y_limits(2)*0.95, '0.5s', 'Color', 'red', 'FontSize', 9, 'FontWeight', 'bold');
    
    title(sprintf('%s (%d trials)\n红色：丘脑通道', fig_data.stim(stim_type).label, fig_data.stim(stim_type).trials))
    xlabel('时间 (s)', 'FontSize', 10, 'FontWeight', 'bold')
    ylabel('LFP channels (30)', 'FontSize', 11, 'FontWeight', 'bold')
end

%% Figure 2: 
figure(2)
set(gcf, 'Position', [100, 100, 1400, 900])
set(gcf, 'Name', '刺激类型4-6（-0.5s to 1s）')

for stim_type = 4:6
    subplot(1, 3, stim_type-3);
    
    for idx = 1:length(channels_to_plot)
        channel_num = channels_to_plot(idx);
        
        signal_data_cut = fig_data.stim(stim_type).q_stim_cut(:, channel_num);
        y_offset = (idx-1) * Channel_Spacing;
        
        if ismember(channel_num, thalamus_channel)
            plot(time_axis, signal_data_cut + y_offset, 'r');
        else
            plot(time_axis, signal_data_cut + y_offset, 'k');
        end
        hold on
    end
    
    xlim([-0.1, 0.6])
    ylim(y_limits) 
    yticks([]); 
    
    % === 添加刺激开始 (0s) 和 0.5s 的红色虚线 ===
    line([0 0], y_limits, 'Color', 'red', 'LineStyle', '--', 'LineWidth', 1.5);
    line([0.5 0.5], y_limits, 'Color', 'red', 'LineStyle', '--', 'LineWidth', 1.5);
    
    text(0.02, y_limits(2)*0.95, '0s', 'Color', 'red', 'FontSize', 9, 'FontWeight', 'bold');
    text(0.52, y_limits(2)*0.95, '0.5s', 'Color', 'red', 'FontSize', 9, 'FontWeight', 'bold');
    
    title(sprintf('%s (%d trials)\n红色：丘脑通道', fig_data.stim(stim_type).label, fig_data.stim(stim_type).trials))
    xlabel('时间 (s)', 'FontSize', 10, 'FontWeight', 'bold')
    ylabel('LFP channels', 'FontSize', 11, 'FontWeight', 'bold')
end
