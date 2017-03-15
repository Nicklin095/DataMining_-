function [ strTmp ] = Function_Preprocess( input )

[M,N] = size(input);
k = 3;
tmp = 'AIDC';
newString = cell(1,1);

    for i = 2:M
%         i
        newString = input{i,k};
        if  ~isempty(findstr(newString(1,:),tmp))
            strLength=length(newString(1,:));
            functionData=newString(1,:);
            End = length(functionData);
            functionIndex = [];
            functionIndexEnd = [];
            for j = strLength:-1:1
                if functionData(j)=='\'
                    functionIndex =  [functionIndex;j];
                end               
            end
            for q = functionIndex(1)+1:End
                if functionData(q)=='_' | functionData(q)=='&'
                    functionIndexEnd = [functionIndexEnd;q]; 
                end
            end
            strTmp{i-1,1} = functionData(functionIndex(1)+1:functionIndexEnd(1)-1);
        else
           newStringLength = length(newString);
           newStringEnd = [];
            for z = 1:newStringLength
                if newString(z)=='_'
                    newStringEnd = [newStringEnd;z]; 
                end
            end
            strTmp{i-1,1} = newString(1,1:newStringEnd(1)-1);
        end
          
    end
end  
        

    