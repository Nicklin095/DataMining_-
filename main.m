    clear all
    global beginName endName oldTable realFirstData
    firstDate = 1;
    monthDate = 28;
    beginName = 'DMG01_A_201702';
    endName = '.mat';
    [ date ] = checkData(monthDate,beginName,endName);   
    oldTable = [];
    realFirstData = 0;
for runNum = firstDate:monthDate
    runNum
    
    if date{runNum,2} == 0
        realFirstData = realFirstData + 1;
        dataName = [beginName num2str(runNum) endName];
        [ result ] = dataString( dataName );
        load(result);
        %---------------------all time------------------------------
        [allDataIndex] = Function_Preprocess( data ); %all data index log
        [ allDataIndexChange ] = allDataDifferent( allDataIndex ); %all data index log change
        [ allRunTimeResult ] = allRunTime( data,allDataIndexChange );  %all data beging-time and end-time
        [ allStart_end_time ] = timeSeparate(allRunTimeResult); %separate beging-time and end-time
        %-----------------------------------------------------------
        
        %-------------------------real run time----------------------
        [program,programIndex] = funciton_Preprocess(data); %run time data index log
        [ programChangeindex ] = programDifferent( programIndex );  %run time data index log change
        [begin_end_time,programData] = Time(data,programChangeindex,programIndex); %run time data beging-time and end-time        
        [ Start_end_time ] = timeSeparate(begin_end_time); %separate run time data's beging-time and end-time   
        %-----------------------------------------------------------
        [runTimeRecord,ansallTime] = calculateTime(Start_end_time,programChangeindex,program,allStart_end_time);%calculate beging-time and end-time 
        [newTable,cIndex] = separateRunTime(runTimeRecord);% separate run time into data name and data chnage index
        
        %------------------------------------------------------
        % use newTable and runTimeRecord to calculate runTimeRecord
        % sum runTimeRecord = run time
        % ansallTime is the total time
        % pause time = ansallTime - run time
        % 
        % calculate Availability = run time/(pause time + run time)
        %------------------------------------------------------
        [r c] = size(begin_end_time);
        cIndex{size(cIndex,1)+1,1} = r+1;
        if realFirstData ~= 1
            load('oldTable.mat');
            [R C] = size(oldTable);
        else
            [R C] = size(newTable);
        end
        oldTable = [oldTable;newTable];
        count = 1;        
        for i = 1:size(newTable,1)
            runTime=zeros(1,1);
            pauseTime=zeros(1,1);
            for j = cIndex{i,1}:cIndex{i+1,1}-1 
                if strcmp(newTable{i,1},runTimeRecord{j,2}) == 1
                   name = newTable{i,1}; 
                   fileNmae = [name endName];
                   value = runTimeRecord{j,1};
                   if ~isempty(which(fileNmae))
                      if j == cIndex{i,1}
                        load(fileNmae);
                        [m n] = size(ansTime); 
                      end                  
                      runTime = runTime + value;
                      if ansallTime{i,1} > runTime
                         pauseTime = ansallTime{i,1} - runTime;
                      else
                         pauseTime = ansallTime{i,1};
                      end
                      
                      if j == cIndex{i+1,1}-1
                          if strcmp(oldTable{R,1},allDataIndex{end,1}) == 1 & programIndex{end,1} == size(data,1)
                             ansTime{end,3} = allStart_end_time{i+1+(i-1),1};
                             ansTime{end,4} = [allStart_end_time{i+1+(i-1),7}{1,1} ':' allStart_end_time{i+1+(i-1),8}{1,1} ':' allStart_end_time{i+1+(i-1),9}{1,1}];
                             ansTime{end,5} = ansTime{end,5} + runTime;
                             ansTime{end,6} = ansTime{end,6} + pauseTime;
                             Availability = (ansTime{end,5}/(ansTime{end,5}+ansTime{end,6}))*100;
                             ansTime{end,7} = Availability;
                          else
                              Availability = (runTime/(runTime+pauseTime))*100;
                              ansTime{m+1,1} = allStart_end_time{i+(i-1),1}; ansTime{m+1,2} = [allStart_end_time{i+(i-1),7}{1,1} ':' allStart_end_time{i+(i-1),8}{1,1} ':' allStart_end_time{i+(i-1),9}{1,1}];
                              ansTime{m+1,3} = allStart_end_time{i+1+(i-1),1}; ansTime{m+1,4} = [allStart_end_time{i+1+(i-1),7}{1,1} ':' allStart_end_time{i+1+(i-1),8}{1,1} ':' allStart_end_time{i+1+(i-1),9}{1,1}];
                              ansTime{m+1,5} = runTime;
                              ansTime{m+1,6} = pauseTime;
                              ansTime{m+1,7} = Availability;
                          end
                      end
                   else
                      runTime = runTime + value;
                      if ansallTime{i,1} > runTime
                         pauseTime = ansallTime{i,1} - runTime;
                      else
                         pauseTime = ansallTime{i,1};
                      end
                      if j == cIndex{i+1,1}-1
                          Availability = (runTime/(runTime+pauseTime))*100;
                          ansTime{1,1} = allStart_end_time{i+(i-1),1}; ansTime{1,2} = [allStart_end_time{i+(i-1),7}{1,1} ':' allStart_end_time{i+(i-1),8}{1,1} ':' allStart_end_time{i+(i-1),9}{1,1}];
                          ansTime{1,3} = allStart_end_time{i+1+(i-1),1}; ansTime{1,4} = [allStart_end_time{i+1+(i-1),7}{1,1} ':' allStart_end_time{i+1+(i-1),8}{1,1} ':' allStart_end_time{i+1+(i-1),9}{1,1}];
                          ansTime{1,5} = runTime;
                          ansTime{1,6} = pauseTime;
                          ansTime{1,7} = Availability;
                      end
                   end     
                end
            end
               save('oldTable','oldTable');
               save(name,'ansTime');
               count = count + 1;
        end

    end
    clearvars -except beginName endName runNum date monthDate realFirstData oldTable
end