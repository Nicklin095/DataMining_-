function [ Start_end_time ] = timeSeparate( begin_end_time )
[r c]=size(begin_end_time);
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
end