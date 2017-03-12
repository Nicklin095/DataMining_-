% 時間字串分割
function [ result ] = String_Segmentation( remainder )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    count = 1;
    while (any(remainder))
        [chopped, remainder] = strtok(remainder);
        result(1,count) = {chopped};
        count = count + 1;
    end
    
    remainder = result{1,1};
    while (any(remainder))
        [chopped, remainder] = strtok(remainder,'/');
        result(1,count) = {chopped};
        count = count + 1;
    end
    
    remainder = result{1,3};
    while (any(remainder))
        [chopped, remainder] = strtok(remainder,':');
        result(1,count) = {chopped};
        count = count + 1;
    end
    
    if strcmp(result{1,2}, '下午') == 1
        if str2num(result{1,7}) < 12
            ans = str2num(result{1,7}) + 12;
            result{1,7} = num2str(ans);
        end
    elseif strcmp(result{1,2}, '上午') == 1
        if str2num(result{1,7}) == 12
            result{1,7} = num2str(0);
        end
    end
end




