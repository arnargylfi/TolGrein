function [barplotdata] = compare_in_bar_plot_extra(vector1,vector2)
% Combines 2 vectors, into 1 dataset for a barplot
%   if the have different length, the resulting array will have zeros in
%   the values that are outside the lenght
L1 = length(vector1);
L2 = length(vector2);

if L2 > L1
    L = L2;
else
    L = L1;
end %if

barplotdata = zeros(L, 2);
for line = 1:L
    for column = 1:2
        % Put vector 1 value in column 1 and vector 2 value in column 2
        if column/2 == 0.5
            % Vector 1
            if line <= L1
                barplotdata(line, column) = vector1(line);
            end % if
        else 
            % Vector 2
            if line <= L2
                barplotdata(line, column) = vector2(line);
            end % if
        end % if
    end % Column for loop
end % Line for loop

end