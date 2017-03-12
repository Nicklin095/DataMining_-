    clear all
    global beginName endName
    monthDate = 30;
    beginName = 'DMG01_A_201612';
    endName = '.mat';
    [ date ] = checkData(monthDate,beginName,endName);   
    
for runNum = 1:monthDate
    runNum
    clearvars -except beginName endName runNum date monthDate newTable
    if date{runNum,2} == 0
        dataName = [beginName num2str(runNum) endName];
        [ result ] = dataString( dataName );
        load(result);
        [program,programIndex] = funcitonPreprocess(data);
        [ programChangeindex ] = programDifferent( programIndex );
        [begin_end_time,programData] = Time(data,programChangeindex,programIndex);
        [r c] = size(begin_end_time);
        count2 = 0;
        for i = 1:r
            for j = 1:c
                count = 1;
                [ result ] = String_Segmentation( begin_end_time{i,j} );
                if j == c
                    for k = 1:size(result,2)
                            Start_end_time{i*j,k} = result(1,count:k);
                            count = count + 1;
                    end
                else
                    for k = 1:size(result,2)
                        Start_end_time{i*j+count2,k} = result(1,count:k);         
                        count = count + 1;
                    end
                end  
            end
            count2 = count2 + 1;
        end

        [runTime] = calculateTime(Start_end_time,programChangeindex,program);
        [newTable,cIndex]=separateRunTime(runTime);
        
        count = 1;
        for i = 1:size(newTable,1)
            count2 = 1;
            for j = 1:r       
                if strcmp(newTable{i,1},runTime{j,2}) == 1
                   name = newTable{i,1}; 
                   fileNmae = [name endName];
                   value = runTime{j,1};
                   if ~isempty(which(fileNmae))
                      if j == cIndex{i,1}
                        load(fileNmae);
                        [m n] = size(ansTime);        
                      end
                      ansTime{m+count2,1} = value;
                   else
                      ansTime{count2,1} = value;
                   end
                   count2 = count2 + 1;
                end

            end
            sortAnsTime = sort([ansTime{:,1}],'descend');
            ansTime=num2cell(sortAnsTime');
            if count == i
               save(name,'ansTime');
               count = count + 1;
            end
            
        end
    end
end