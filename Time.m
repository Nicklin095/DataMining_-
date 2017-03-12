function [result,dataStatus] = Time(rawData,changeIndex,programIndex)
% DMG01_Function = inputData    
[M N] = size(rawData);
[m n] = size(changeIndex);
    count = 1;
for k = 1:m
    indexCount = 1;
    testCount = 1;
    if indexCount == 1
        for j = count:m
            for i = programIndex{changeIndex{j,1},1}:-1:1
                if strcmp(rawData(i,7),'START') == 1
                   dataStatus{count,2} = i;        
                   if ~isempty(dataStatus{count,2})
                      break;
                   end
                end
                if ~isempty(dataStatus{count,2})
                   break;
                end
            end
            if ~isempty(dataStatus{count,2})
               break;
            end
        end      
    end
        count = count + 1;
        indexCount = indexCount + 1;
        
    if indexCount == 2 
        dataStatus{1,1} = programIndex{1,1};
        [r c] = size(dataStatus);
        for jj = count-1:m
            for ii =  programIndex{changeIndex{jj,1}+1,1}:M
                if strcmp(rawData{ii+1,7},'START') == 1
                   testCount = testCount + 1;
                   dataStatus{count,1} = ii;
                   if ~isempty(dataStatus{count,1})
                       break;
                   end   
                end
                if testCount > 1
                    if ~isempty(dataStatus{count,1})
                       break;
                    end
                end
            end
                if testCount > 1
                    if ~isempty(dataStatus{count,1})
                       break;
                    end
                end
        end
        
        if k == m
           [c r] = size(dataStatus);
           for i = programIndex{size(programIndex,1)}:-1:1
               if strcmp(rawData{i,7},'START') == 1
                  dataStatus{count,2} = i;
                   if ~isempty(dataStatus{count,2})
                      break;
                   end
                end
                if ~isempty(dataStatus{count,2})
                   break;
                end
            end
            if ~isempty(dataStatus{count,2})
               break;
            end
        end
    end
end

    for i = 1:c
        kk = dataStatus{i,1};
        result{i,r} =  rawData{kk,2};
        if i ~= c
            kk = dataStatus{i,r};
            result{i,1} =  rawData{kk,2};
        else
            kk = dataStatus{i,r};
            result{i,1} =  rawData{kk-1,2};
        end
    end
    
end
