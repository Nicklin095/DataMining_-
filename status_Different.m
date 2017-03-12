function [index ] = status_Different( data )
    [M,N] = size(data);
    count = 1;
        for j=1:1:M
            if  strcmp(data{j,7},'START') == 1 
                index{count,1} = j;
                count = count + 1;
            end
        end
end