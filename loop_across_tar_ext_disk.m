files=dir('/media/wjadvos/DatasetsDrive1/LEMON_dataset/fmri')

for i=51:size(files)
    
    disp(files(i).name)
    disp(size(files(i).name))
    
    
    if(size(files(i).name,2)==14)
        extract_ROIs_from_hard_disk(files(i).name)

        
    end
        
    
end