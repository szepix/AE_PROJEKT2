% ObjectiveFunction.m
function value = ObjectiveFunction(population, items, max_weight)
    n = size(population, 1);
    value = zeros(n, 1);
    
    for i = 1:n
        x = population(i, :);
        total_weight = sum(x .* items(:, 1)');
        total_value = sum(x .* items(:, 2)');
        
        if total_weight <= max_weight
            value(i) = -total_value;
        else
            value(i) = 0;
        end
    end
end
