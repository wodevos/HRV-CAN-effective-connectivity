


function smooth_function_Hannes(folder,filename)
clear matlabbatch

[nifti_images,~]=spm_select('ExtFPList',folder, filename,inf);

%matlabbatch{1}.spm.spatial.smooth.data(1) = cellstr(nifti_images);
matlabbatch{1}.spm.spatial.smooth.data = cellstr(nifti_images);

matlabbatch{1}.spm.spatial.smooth.fwhm = [6 6 6]; %5 of 6
matlabbatch{1}.spm.spatial.smooth.dtype = 0;
matlabbatch{1}.spm.spatial.smooth.im = 1; %could change to 1 if want to ignore 0's and NaN's
matlabbatch{1}.spm.spatial.smooth.prefix = 's';

spm_jobman('run',matlabbatch)

end