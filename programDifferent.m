function [index ] = programDifferent( data )
    [M,N] = size(data);
    count = 1;

        for j=1:1:M
            if j == M
                if  data{j} - 1 ~= data{j-1}
                    index{count,1} = j;
                    
                end
            else
                if  data{j} + 1 ~= data{j+1}
                    index{count,1} = j;
                    count = count + 1;
                end
            end         
        end
end