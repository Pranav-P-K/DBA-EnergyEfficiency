function BLE_SF_Adjustment
    % BLE doesn't use SF directly but uses modulation for energy adjustments
    mod_schemes = {'GFSK'};
    data_rate = [1e6]; % 1 Mbps data rate for BLE
    distances = [5, 50, 100]; % Example distances

    energy_per_bit = [0.001]; % Energy per bit for BLE's GFSK modulation

    energy_consumption = zeros(1, length(distances));

    for i = 1:length(distances)
        total_energy = energy_per_bit(1) * data_rate(1); % Energy per bit times data rate
        energy_consumption(i) = total_energy;
    end
    
    disp(['BLE SF Adjustment Energy Consumption: ', num2str(energy_consumption), ' mJ']);
    
    % Plot
    figure;
    bar(distances, energy_consumption);
    xlabel('Distance (m)');
    ylabel('Total Energy Consumption (mJ)');
    title('BLE SF Adjustment Energy Consumption');
end
