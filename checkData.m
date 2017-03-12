function [date] = checkData(num,beginName,endName )
count = 1;
    for i = 1:num
        checkDataName = [beginName num2str(i) endName];
        date{count,1} = i;
        if isempty(which(checkDataName))
           date{count,2} = 1;
        else
           date{count,2} = 0;
        end
        count = count + 1;
    end
%     for i= 1:num
%         if date{i,2} == 1;
%            if i ~= num
%                if date{i+1,2} == 1;
%                   date{i,3} = date{i,2} + date{i+1,2};
%                   date{i+1,2} = 0;
%                else
%                   date{i,3} = 1;
%                   
%                end
%            else
%                date{i,3} = 1;
%            end
%         else
%             date{i,3} = 1;
%         end
%     end
end