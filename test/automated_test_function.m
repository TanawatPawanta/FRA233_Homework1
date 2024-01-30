function [score, ID,Version] = automated_test_function(testFunction)
main_dir = pwd;
hw_zip = dir(fullfile(main_dir,'*.zip'));
file_name_zip = {hw_zip.name};
try
    for i = 1:numel(file_name_zip)
        ID = "";
        error = 0;
        name = file_name_zip{i};
        buffer = split(name, ".");
        file_name = buffer{1};
        split_text = split(file_name,"_");
        Version1 = split_text{length(split_text)};
        Version = split(Version1,"v");
        Version = Version{2};
        for j = 3 : length(split_text)-1
            if j == 3
                ID = ID + split_text{j};
            else
                ID = ID + "_" + split_text{j};
            end
          
        end

        split_ID = split(ID,"_");
        for k = 1:length(split_ID)
            if length(split_ID{k}) ~= 4
                error = 1;
            end
        end
        if ID ~= "" && error ~=1
            unzip(name,ID)
            test_folder = pwd + "/" + ID  ;
            score = 0;
     
            cd(test_folder)
            
            current_path = pwd;
            addpath(current_path + "/class");
            addpath(current_path + "/fcn");
            addpath(current_path + "/model");
            addpath(current_path + "/other");
            addpath(current_path + "/script");
            
            [isCorrect] = testFunction();
            score = score + isCorrect;
            cd ..;
            
            fprintf("ID : " + ID + " , Version : " + Version +"  , your score is %d/%d\n\n=============================================================================\n\n",score, 5);
        else
            fprintf("can not unzip file\n\n\n");
        end
    
    end
catch 
    fprintf("somewhere error\n\n\n")
end
fprintf('\n')