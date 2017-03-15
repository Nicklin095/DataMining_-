clear all
load('Type_List.mat')
endName = '.mat';
count = 1;
label = { '��','���O','NC�{��',	'�}�l���','�}�l�ɶ�','�������','�����ɶ�','�[�u�u��(s)','�Ȱ��ɶ�(s)','�[�ʲv(%)'}; 
for i = 1:size(Type_List,1)
    firstName = Type_List(i,3);
    programName = [firstName{1,1} endName];
    if ~isempty(which(programName))
        load(programName);
        for k = 1:size(ansTime,1)
            for j = 1:size(Type_List,2)
                newList{count,j} =  Type_List{i,j};  
            end
            for m = 1:size(ansTime,2)
                if m==1 | m==3
                   newList{count,size(Type_List,2)+m} =  ansTime{k,m}{1,1};
                else
                   newList{count,size(Type_List,2)+m} =  ansTime{k,m};
                end  
            end
            count = count + 1;
        end
    end
end

workingList = [label;newList];
save('workingList','workingList');
delete ���x��ڥ[�u��ƪ�.xlsx
status = xlswrite('���x��ڥ[�u��ƪ�.xlsx',workingList,'working list')
