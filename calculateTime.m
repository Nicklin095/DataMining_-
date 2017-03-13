function [ansTime,ansallTime] = calculateTime(runTime,programChangeindex,rawData,allStart_end_time)
% [result,dataStatus] = calculateTime(Start_end_time,programChangeindex,DMG01_program);
[r c] = size(runTime);
[R C] = size(allStart_end_time);
[m n] = size(programChangeindex);
count = 1;
   for i = 1:2:R
        for k = 1:C
            sTime{1,k} = str2num(allStart_end_time{i,k}{1,1});
            eTime{1,k} = str2num(allStart_end_time{i+1,k}{1,1});
        end
        
        for j = c:-1:7
            %second
            if eTime{1,j} >= sTime{1,j} & j==c
               ansallTime{count,1} =  eTime{1,j} - sTime{1,j};
            elseif eTime{1,j} <= sTime{1,j} & j==c
               tmp = 60 +  eTime{1,j};
               eTime{1,j-1} = eTime{1,j-1} - 1;
               ansallTime{count,1} =  tmp - sTime{1,j};
            end
            %minute
            if eTime{1,j} >= sTime{1,j} & j==c-1
               ansallTime{count,1} = ansallTime{count,1} + (eTime{1,j} - sTime{1,j})*60;
            elseif eTime{1,j} <= sTime{1,j} & j==c-1
               tmp = 60 +  eTime{1,j};
               eTime{1,j-1} = eTime{1,j-1} - 1;
               ansallTime{count,1} = ansallTime{count,1} + tmp - sTime{1,j}*60;
            end
            %hour
            if eTime{1,j} >= sTime{1,j} & j==c-2
               ansallTime{count,1} = ansallTime{count,1} + (eTime{1,j} - sTime{1,j})*3600;
            elseif eTime{1,j} <= sTime{1,j} & j==c-2
               tmp = 3600 +  eTime{1,j};
               eTime{1,j-1} = eTime{1,j-1} - 1;
               ansallTime{count,1} = ansallTime{count,1} + tmp - sTime{1,j}*3600;
            end
        end
        if ansallTime{count,1} < 0
           ansallTime{count,1} = abs(ansallTime{count,1});
        end
        count = count + 1;
        
   end
    clear sTime eTime tmp
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
               tmp = 60 +  eTime{1,j};
               eTime{1,j-1} = eTime{1,j-1} - 1;
               ansTime{count,1} =  tmp - sTime{1,j};
            end
            %minute
            if eTime{1,j} >= sTime{1,j} & j==c-1
               ansTime{count,1} = ansTime{count,1} + (eTime{1,j} - sTime{1,j})*60;
            elseif eTime{1,j} <= sTime{1,j} & j==c-1
               tmp = 60 +  eTime{1,j};
               eTime{1,j-1} = eTime{1,j-1} - 1;
               ansTime{count,1} = ansTime{count,1} + (tmp - sTime{1,j})*60;
            end
            %hour
            if eTime{1,j} >= sTime{1,j} & j==c-2
               ansTime{count,1} = ansTime{count,1} + (eTime{1,j} - sTime{1,j})*3600;
            elseif eTime{1,j} <= sTime{1,j} & j==c-2
               tmp = 3600 +  eTime{1,j};
               eTime{1,j-1} = eTime{1,j-1} - 1;
               ansTime{count,1} = ansTime{count,1} + (tmp - sTime{1,j})*3600;
            end
        end
        count = count + 1;

    end
    for i = 1:m
        programName = rawData{programChangeindex{i,1},1};
        ansTime{i,2} = programName;
        if i == m
            programName = rawData{programChangeindex{i,1}+1,1};
            ansTime{i+1,2} = programName;
        end
    end
end