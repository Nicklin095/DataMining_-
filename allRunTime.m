function [ result ] = allRunTime( data,allDataIndexChange )

[m n] = size(data);
count = 1;
if isempty(allDataIndexChange)
   result{1,1} = data{1,2};
   result{1,2} = data{m-1,2};
else
    [r c] = size(allDataIndexChange);
    if r == 1
        result{1,1} = data{allDataIndexChange{1,1}-1,2};
        result{1,2} = data{1,2};
        result{2,1} = data{m-1,2};
        result{2,2} = data{allDataIndexChange{1,1},2};
    else
        for i = 1:size(allDataIndexChange,1)+1
            if i == r+1
                result{count,1} = data{m-1,2};
                result{count,2} = data{allDataIndexChange{r,1},2};
            else
                 if i == 1
                    result{count,1} = data{allDataIndexChange{i,1}-1,2};
                    result{count,2} = data{2,2};
                    count = count + 1;
                else
                    result{count,1} = data{allDataIndexChange{i,1}-1,2};
                    result{count,2} = data{allDataIndexChange{i-1,1},2};
                    count = count + 1;
                end
            end
        end
    end
end
end