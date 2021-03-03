    % get all files and folders in the folder where the data is located
    % ran from '/media/wjadvos/DatasetsDrive1/LEMON_dataset
    files = dir('/media/wjadvos/DatasetsDrive1/LEMON_dataset/fmri/sub*');
    datapath='/media/wjadvos/DatasetsDrive1/LEMON_dataset/fmri/'  % path where the data is located
    betweenpath='home/wjadvos/Documents/ResearchStudies/HRVLEIBZIG/ROIs_pipeline'
    endpath='/media/wjadvos/DatasetsDrive1/LEMON_dataset/fmripreproc/'
   
    % take out only the unzipped folders (they have a length of 10
    % characters 
    
    %for i=1:size(files,1)
    for i=1:4
    
    
        
        if(size(files(i).name,2)==14)
            
            copyfile([path files(i).name],betweenpath)
            
            disp('yes')
            disp(files(i).name);
            %subject=files(i).name(1:10);
            %mkdir(newpath_rel)
            %untar(['fmri/' files(i).name],'fmripreproc')
            %extract_ROIs_single_subject(betweenpath,subject)
            
            
        end
    end
    
    % now we have all the subjects, now we loop over the subject
    
    %for i=2:10
        
    %    extract_ROIs_single_subject(path,subjects(1,:))
    %end
        
        
    
    
    
    