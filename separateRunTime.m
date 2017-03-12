function [newTable,cIndex]=separateRunTime(runTime)
count = 1;
[r c] = size(runTime);
    for i = 1:r
        programName{1,1} = runTime{i,c};
        if i == 1
            newTable{1,1} = programName{1,1};
        else
            if strcmp(runTime{i-1,c},programName{1,1}) == 0
               newTable{count+1,1} = programName{1,1};
               count = count + 1;
            end
        end
    end
    count = 1;
    cIndex = cell(size(newTable,1),1);
    for i = 1:size(newTable,1)
        for j = 1:r
            if strcmp(newTable{i,1},runTime{j,2}) == 1
                cIndex{count,1} = j;
                count = count + 1;
            end
            if ~isempty(cIndex{i,1})
                break;
            end
        end
    end
end