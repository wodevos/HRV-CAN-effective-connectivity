function extract_ROIs_from_hard_disk(tarname)

folder='/media/wjadvos/DatasetsDrive1/LEMON_dataset/fmri'
subjectname=tarname(1:end-4);
 % relative to '/media/wjadvos/DatasetsDrive1/LEMON_dataset'
% copy tar file to another folder, perform everything there, and then write
% back to external disk

local_folder='/home/wjadvos/Documents/ResearchStudies/HRVLEIBZIG/ROIs_pipeline';
%disk_folder='/media/wjadvos/DatasetsDrive1/LEMON_dataset/fmripreproc';


copyfile([folder '/' tarname],local_folder)

untar([local_folder '/' tarname],local_folder)



extract_ROIs_single_subject(local_folder,subjectname)


remove_double_files(local_folder,subjectname)


end



















