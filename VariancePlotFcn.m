% CustomPlotFcn.m
function [state, options, optchanged] = VariancePlotFcn(options, state, flag)
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
        var_score = var(state.Score);
        
        % Dodanie danych do wykresu
        plot(state.Generation, var_score, 'mo');
        
        % Aktualizacja legendy
        legend('Wariancja', 'Location', 'best');
    end
end
