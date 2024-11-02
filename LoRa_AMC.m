function LoRa_AMC
    modulation_schemes = {'BPSK', 'QPSK', '16QAM'};
    data_rate = [1e6, 2e6, 4e6]; % Data rates for different modulations
    distances = [100, 500, 1000]; % Example distances
    energy_per_bit = [0.001, 0.002, 0.004]; % Energy per bit for LoRa modulations (adjusted)

    total_energy = zeros(1, length(distances));

    for i = 1:length(distances)
        if distances(i) < 300
            modulation = modulation_schemes{3}; % 16QAM
            energy = energy_per_bit(3);
        elseif distances(i) < 700
            modulation = modulation_schemes{2}; % QPSK
            energy = energy_per_bit(2);
        else
            modulation = modulation_schemes{1}; % BPSK
            energy = energy_per_bit(1);
        end
        
        total_energy(i) = energy * data_rate(i) * 1; % Simplified calculation
    end
    
    disp(['LoRa AMC Total Energy Consumption: ', num2str(total_energy)]);
    % Plot
    figure;
    bar(distances, total_energy);
    xlabel('Distance (m)');
    ylabel('Total Energy Consumption (mJ)');
    title('LoRa AMC Energy Consumption');
end
