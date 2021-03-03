%-----------------------------------------------------------------------
% Job saved on 06-Jan-2021 15:04:01 by cfg_util (rev $Rev: 7345 $)
% spm SPM - SPM12 (7771)
% cfg_basicio BasicIO - Unknown
%-----------------------------------------------------------------------
function norm_func_function(pathanat,pathfunc,deformation_fieldname,func_filename)



[nifti_images,~]=spm_select('ExtFPList',pathfunc,func_filename,inf);


matlabbatch{1}.spm.spatial.normalise.write.subj.def = {[pathanat '\' deformation_fieldname]};
matlabbatch{1}.spm.spatial.normalise.write.subj.resample = cellstr(nifti_images);
matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                          78 76 85];
matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [1 1 1];
matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'w';

spm_jobman('run', matlabbatch)




end
