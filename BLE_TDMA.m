function BLE_TDMA_Dynamic
    % Parameters for BLE in TDMA scheme
    num_slots = 10;
    slot_duration = 1e-3; % 1ms per slot
    traffic_load = [0.3, 0.5, 0.9]; % Traffic load for different distances

    energy_idle = 0.7; % Idle energy per slot in mJ (adjusted for BLE)
    energy_tx = 15; % Transmission energy in mJ (BLE typical values)

    slot_allocation = [];

    for i = 1:length(traffic_load)
        allocated_slots = floor(num_slots * traffic_load(i));
        slot_allocation(i) = allocated_slots;
    end

    total_energy = sum(slot_allocation) * energy_tx + (num_slots - sum(slot_allocation)) * energy_idle;
    
    disp(['BLE TDMA Total Energy Consumption: ', num2str(total_energy), ' mJ']);
    
    % Plot
    figure;
    bar(traffic_load, total_energy);
    xlabel('Traffic Load');
    ylabel('Total Energy Consumption (mJ)');
    title('BLE TDMA Energy Consumption');
end
