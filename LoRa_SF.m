function LoRa_SF_Adjustment
    SF_values = 7:12; % Spreading Factors
    BW = 125e3; % Bandwidth in Hz
    distances = [100, 500, 1000]; % Example distances in meters
    energy_consumption = zeros(length(SF_values), length(distances));

    for d = distances
        for SF = SF_values
            symbol_duration = (2^SF) / BW;
            payload = 20; % Payload in bytes
            ToA = (8 + payload) * symbol_duration; % Time on Air
            
            % Transmission power for LoRa
            P_tx = 20; % in dBm (confirmed)
            energy = P_tx * ToA; % Calculate energy consumption based on SF
            
            energy_consumption(SF-6, find(distances == d)) = energy;
        end
    end

    disp('LoRa: Energy Consumption for Different Spreading Factors:');
    disp(energy_consumption(1));
    disp(energy_consumption(2));
    disp(energy_consumption(3));
    
    % Plot
    figure;
    plot(SF_values, energy_consumption);
    xlabel('Spreading Factor (SF)');
    ylabel('Energy Consumption (mJ)');
    title('LoRa: Energy Consumption for Different SFs');
end
