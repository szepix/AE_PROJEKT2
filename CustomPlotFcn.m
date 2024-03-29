% CustomPlotFcn.m
function [state, options, optchanged] = CustomPlotFcn(options, state, flag)
    optchanged = false;
    if strcmp(flag, 'init')
        % Inicjalizacja wykresu
        hold on;
        xlabel('Numer pokolenia');
        ylabel('Wartosc funkcji celu');
        title('Wartosci funkcji celu w zaleznosci od pokolenia');
        set(gca, 'YScale', 'linear');
        set(gcf,'Position',[100 100 800 800])
        grid on;
    elseif strcmp(flag, 'iter')
        % Aktualizacja danych wykresu
        max_score = min(state.Score);
        mean_score = mean(state.Score);
        min_score = max(state.Score);
        % Dodanie danych do wykresu
        plot(state.Generation, -min_score, 'ro');
        plot(state.Generation, -mean_score, 'go');
        plot(state.Generation, -max_score, 'bo');
        
        % Aktualizacja legendy
        legend('Minimum', 'Srednia', 'Maksimum', 'Location', 'best');
    end
end
