function [ Index_change,change ] = allDataDifferent( data )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    [M,N] = size(data);

        count = 1;
        count_index_change = 1;
        kind = 0;
        Index_n = zeros(1,1);
        Index_c = cell(1,1);
        change = zeros(1,1);
        for j=1:1:M
            
            if 	ischar(data{j,1}) == 0 %if data is character
                kind = 1;
                if count == 1
                    change(count,1) = 0;
                    Index_n = data{j,1};
                    count = count + 1;
                else
                    if Index_n == data{j,1}
                        change(count,1) = 0;
                    else
                        Index_n = data{j,1};
                        change(count,1) = 1;
                        if ~isempty(data{j,1})
                            Index_change{count_index_change,1} =  j
                        end
                        count_index_change = count_index_change +1;
                    end
                    count = count + 1;
                end
            else
                kind = 2;
                if count == 1
                    change(count,1) = 0;
                    Index_c{count,1} = data{j,1};
                    count = count + 1;
                else
                    if strcmp(Index_c,data{j,1}) == 1 %compare j and j-1 data in character
                        change(count,1) = 0;
                    else
                        Index_c = data{j,1};
                        change(count,1) = 1;
                        if ~isempty(data{j,1})
                            Index_change{count_index_change,1} =  j
                        end
                        count_index_change = count_index_change +1;
                    end
                    count = count + 1;
                end
            end
        end
        if max(change) == 0 
           Index_change =  {}; 
        end
end