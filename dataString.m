function [ newString ] = dataString( input )

dataRoute = which(input);
[M,N] = size(dataRoute);
check = 1;
count = 1;
newString = [];
    for i = N:-1:1
        if dataRoute(1,i) ~= '/'
            
           newString =[newString dataRoute(1,i)];
           count = count + 1;
        else
            check = check + 1;
            break;
        end
        if check ~= 1
           break;
        end
    end
    newString = fliplr(newString);
end  
        

    