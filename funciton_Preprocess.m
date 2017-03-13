function [ strTmp,functionIndex ] = funciton_Preprocess( input )

[M,N] = size(input);
k = 3;
tmp = 'AIDC';
newString = cell(1,1);
count = 1;
test = 1;
    for i = 1:M
%         i
        newString = input{i,k};
        if  isempty(findstr(newString(1,:),tmp)) & strcmp(input{i,6},'Manual') == 0
            functionIndex{count,1} = i;
            functionData=newString(1,:);
            notStrIndex = [];
            for j = 1:length(newString(1,:))
                if functionData(j)=='_'
                    notStrIndex = [notStrIndex;j]; 
                end
            end
             strTmp{count,1} = newString(1:notStrIndex(1)-1);
             count = count + 1;
        end         
    end
    
end  
        

    