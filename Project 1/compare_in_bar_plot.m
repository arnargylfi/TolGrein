function [barplotdata] = compare_in_bar_plot(vector1,vector2)
% Combines 2 vectors, if the have the same length, into 1 dataset for a
% barplot
%   
if not(length(vector1) == length(vector2))
    fprint("Input vectors do not match, returning NaN");
    barplotdata = NaN;
    return;
end % if

L = length(vector1);
barplotdata = zeros(L, 2);
for line = 1:L
    for column = 1:2
        % Put vector 1 value in column 1 and vector 2 value in column 2
        if column/2 == 0.5
            % Vector 1
            barplotdata(line, column) = vector1(line);
        else 
            % Vector 2
            barplotdata(line, column) = vector2(line);
        end % if
    end % Column for loop
end % Line for loop

end