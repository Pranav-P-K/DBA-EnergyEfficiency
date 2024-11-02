function ZigBee_AMC
    % Modulation schemes for ZigBee
    modulation_schemes = {'OQPSK', 'BPSK', 'QPSK'};
    distances = [10, 100, 200]; % Example distances
    data_rate = [250e3, 500e3, 1e6]; % Data rates corresponding to the modulation
    energy_per_bit = [0.003, 0.005, 0.01]; % Energy per bit for each modulation (in mJ)

    total_energy = zeros(1, length(distances));

    for i = 1:length(distances)
        if distances(i) < 50
            modulation = modulation_schemes{3}; % QPSK for shorter distance
            energy = energy_per_bit(3);
        elseif distances(i) < 150
            modulation = modulation_schemes{2}; % BPSK for medium distance
            energy = energy_per_bit(2);
        else
            modulation = modulation_schemes{1}; % OQPSK for longer distances
            energy = energy_per_bit(1);
        end

        total_energy(i) = energy * data_rate(i); % Energy consumption
    end
    
    disp(['ZigBee AMC Total Energy Consumption: ', num2str(total_energy)]);
    
    % Plot
    figure;
    bar(distances, total_energy);
    xlabel('Distance (m)');
    ylabel('Total Energy Consumption (mJ)');
    title('ZigBee AMC Energy Consumption');
end
