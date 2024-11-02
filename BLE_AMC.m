function BLE_AMC
    % Adaptive Modulation and Coding for BLE
    modulation_schemes = {'GFSK', 'BPSK', 'QPSK'};
    distances = [5, 50, 100]; % Example distances
    data_rate = [1e6, 2e6, 3e6]; % Data rates for BLE
    energy_per_bit = [0.001, 0.002, 0.003]; % Energy per bit for BLE modulations

    total_energy = zeros(1, length(distances));

    for i = 1:length(distances)
        if distances(i) < 20
            modulation = modulation_schemes{1}; % GFSK for short distances
            energy = energy_per_bit(1);
        elseif distances(i) < 70
            modulation = modulation_schemes{2}; % BPSK for medium distances
            energy = energy_per_bit(2);
        else
            modulation = modulation_schemes{3}; % QPSK for longer distances
            energy = energy_per_bit(3);
        end
        
        total_energy(i) = energy * data_rate(i); % Energy consumption calculation
    end
    
    disp(['BLE AMC Total Energy Consumption: ', num2str(total_energy)]);
    
    % Plot
    figure;
    bar(distances, total_energy);
    xlabel('Distance (m)');
    ylabel('Total Energy Consumption (mJ)');
    title('BLE AMC Energy Consumption');
end
