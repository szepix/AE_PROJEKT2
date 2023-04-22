% SaveGenerationForTargetScore.m
function [state, options, optchanged] = SaveBestGeneration(options, state, flag, filename)
    persistent saved; % Dodajemy zmienną persistent, która przechowuje informację, czy już zapisaliśmy numer generacji
    optchanged = false;
    target_score = -962;
    
    if isempty(saved)
        saved = false;
    end
    
    if strcmp(flag, 'iter')
        % Sprawdź, czy najlepszy osobnik osiągnął wynik -962 i czy jeszcze nie zapisaliśmy numeru generacji
        if state.Best(end) <= target_score && ~saved
            % Zapisz numer generacji, w której najlepszy osobnik osiągnął wynik -962
            generation_number = state.Generation;
            save(filename, 'generation_number');
            
            % Ustaw zmienną saved na true, aby wiedzieć, że już zapisaliśmy numer generacji
            saved = true;
        end
    end
end