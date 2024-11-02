function ZigBee_SF_Adjustment
    % Adjusted for ZigBee modulation and energy consumption
    mod_schemes = {'BPSK', 'QPSK'};
    data_rate = 250e3; % Fixed data rate for ZigBee (250 kbps)
    distances = [10, 100, 200]; % Example distances
    energy_consumption = zeros(1, length(distances));

    % Energy consumption based on modulation and data rates
    energy_per_bit = [0.002, 0.004]; % Energy per bit for ZigBee modulations

    for i = 1:length(distances)
        if distances(i) < 50
            mod = mod_schemes{2}; % QPSK
            energy = energy_per_bit(2);
        else
            mod = mod_schemes{1}; % BPSK
            energy = energy_per_bit(1);
        end

        % Use fixed data_rate for all distances since ZigBee typically uses 250 kbps
        total_energy = energy * data_rate; 
        energy_consumption(i) = total_energy;
    end
    
    disp(['ZigBee SF Adjustment Energy Consumption: ', num2str(energy_consumption), ' mJ']);
    
    % Plot
    figure;
    bar(distances, energy_consumption);
    xlabel('Distance (m)');
    ylabel('Total Energy Consumption (mJ)');
    title('ZigBee SF Adjustment Energy Consumption');
end
