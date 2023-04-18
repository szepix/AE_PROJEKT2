% MainScript.m
run('skrypt1.m');
max_weight = 0.3 * sum(items(:, 1));

nvars = N;
lb = zeros(1, nvars);
ub = ones(1, nvars);

% Dodaj linijkę definiującą ograniczenia typu "intcon"
intcon = 1:N;

options = optimoptions('ga', ...
    'PopulationSize', 1000, ...
    'MaxGenerations', 1000, ...,
    'MaxStallGenerations',100,...,
    'CrossoverFcn', @crossoverscattered, ...
    'MutationFcn', {@mutationgaussian, 0.4}, ...
    'EliteCount', 28, ...,
    'SelectionFcn', {@selectiontournament}, ...,
    'FunctionTolerance', 1e-1000, ...
    'ConstraintTolerance',1e-1000 ,...
    'PlotFcn', {@gaplotbestf, @CustomPlotFcn});

% Zaktualizuj wywołanie funkcji ga() poprzez dodanie argumentu "intcon"
[x_opt, fval_opt] = ga(@(x) ObjectiveFunction(x, items, max_weight), nvars, [], [], [], [], lb, ub, [], intcon, options);

x_opt = logical(round(x_opt));
optimal_items = items(x_opt, :);
optimal_weight = sum(optimal_items(:, 1));
optimal_value = -fval_opt;

fprintf('Optymalna waga: %.2f\n', optimal_weight);
fprintf('Optymalna wartość: %.2f\n', optimal_value);
disp('Optymalne przedmioty:');
disp(optimal_items);