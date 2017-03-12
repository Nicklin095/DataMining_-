function [ansTime] = calculateTime(runTime,programChangeindex,rawData)
% [result,dataStatus] = calculateTime(Start_end_time,programChangeindex,DMG01_program);
[r c] = size(runTime);
[m n] = size(programChangeindex);
count = 1;
    for i = 1:2:r
        for k = 1:c
            sTime{1,k} = str2num(runTime{i,k}{1,1});
            eTime{1,k} = str2num(runTime{i+1,k}{1,1});
        end
        
        for j = c:-1:7
            %second
            if eTime{1,j} >= sTime{1,j} & j==c
               ansTime{count,1} =  eTime{1,j} - sTime{1,j};
            elseif eTime{1,j} <= sTime{1,j} & j==c
               tmp = eTime{1,j-1}*60 +  eTime{1,j};
               eTime{1,j-1} = eTime{1,j-1} - 1;
               ansTime{count,1} =  tmp - sTime{1,j};
            end
            %minute
            if eTime{1,j} >= sTime{1,j} & j==c-1
               ansTime{count,1} = ansTime{count,1} + (eTime{1,j} - sTime{1,j})*60;
            elseif eTime{1,j} <= sTime{1,j} & j==c-1
               tmp = eTime{1,j-1}*60 +  eTime{1,j};
               eTime{1,j-1} = eTime{1,j-1} - 1;
               ansTime{count,1} = ansTime{count,1} + (tmp - sTime{1,j})*60;
            end
            %hour
            if eTime{1,j} >= sTime{1,j} & j==c-2
               ansTime{count,1} = ansTime{count,1} + (eTime{1,j} - sTime{1,j})*360;
            elseif eTime{1,j} <= sTime{1,j} & j==c-2
               tmp = eTime{1,j-1}*360 +  eTime{1,j};
               eTime{1,j-1} = eTime{1,j-1} - 1;
               ansTime{count,1} = ansTime{count,1} + (tmp - sTime{1,j})*360;
            end
        end
        count = count + 1;

    end
    for i = 1:m
        programName = rawData{programChangeindex{i,1},1};
        ansTime{i,2} = programName;
        if i == m
            programName = rawData{programChangeindex{i,1},1};
            ansTime{i+1,2} = programName;
        end
    end
end