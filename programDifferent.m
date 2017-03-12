function [index ] = programDifferent( data )
    [M,N] = size(data);
    count = 1;

        for j=1:1:M
            if j == M
                if  data{j} - 1 ~= data{j-1}
                    index{count,1} = j;
                    
                end
            else
                if  data{j} + 1 ~= data{j+1}
                    index{count,1} = j;
                    count = count + 1;
                end
            end         
        end
end
% function [index ] = programDifferent( data )
%     [M,N] = size(data);
%     count = 1;
%     check = 1;
%         for j=1:1:M
%                 if j == M
%                     if  data{j} - 1 ~= data{j-1}
%                         index{count,1} = j;
%                         checkcell{j,1} = '1';
%                     end
%                 else
%                      if  data{j} + 1 ~= data{j+1}
%                          index{count,1} = j;
%                          count = count + 1;
%                          checkcell{j,1} = '1';
%                      else
%                          checkcell{j,1} = '0';
%                      end
%                 end
%         end
%         for i=1:size(checkcell,1)
%             tmp=checkcell{i,1};
%             if strcmp(tmp,'1') == 1
%                check = check + 1;
%             end
%         end
%         if check == 1
%            index{1,1} = 1;
%            index{2,1} = M;
%         end
% end