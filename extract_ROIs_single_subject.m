
function extract_ROIs_single_subject(path,subject)

% INPUT
% path should be the path where the data is located
% subject is the name of the subject that gets processed 

% "OUTPUT"
% normalized and smoothed functional images (on disc)
% (as well as other files in between such as a normalized anatomical
% imgage)

% SEGMENT_STRUCTURAL_IMAGE
% unsegmented image is in for example:sub-032303_ses-01_acq-mp2rage_brain.nii

anatname=[subject '_ses-01_acq-mp2rage_brain.nii' ]
pathanat=[path '/' subject '/anat' ]

% opletten in deze file dat de deformation fields correct zijn


if isfile([pathanat '/' anatname ])
    disp('func_file found')
else
    gunzip([pathanat '/' anatname '.gz'])   
end


segment_structural(pathanat,anatname)

% this gives the following output that we will use further:
% c1sub-032303_ses-01_acq-mp2rage_brain.nii the grey matter file
% deformation field (that will be used in the normalization of the strutural and functional file
% y_sub-032303_ses-01_acq-mp2rage_brain.nii

deformationfieldname=['y_' anatname]
greymattername=['c1' anatname]


% NORMALIZE_STRUCTURAL

norm_struct_function(pathanat,deformationfieldname,greymattername)

% creates a file such as:
%wc1sub-032308_ses-01_acq-mp2rage_brain.nii (normalized structural image)

% NORMALIZE_FUNCTIONAL
% test if unzipped file exists
% test if file exists:sub-032308_ses-01_task-rest_acq-AP_run-01_native.nii

func_name=[subject '_ses-01_task-rest_acq-AP_run-01_native.nii' ];
func_namegz=[func_name '.gz'];
path_func=[path '/' subject '/func' ]

if isfile([path_func '/' func_name ])
    disp('func_file found')
else
    gunzip([path_func '/' func_namegz])   
end
    
norm_func_function(pathanat,path_func,deformationfieldname,func_name);

normalized_func_name=['w' func_name];

% SMOOTH

smooth_function_Hannes(path_func,normalized_func_name);
%smoothed_normalized_func_name=['sw' func_name];


% define and estimate SPM
% first we make a folder for the SPM

%path_confound=[path '/' subject '/SPM']

%if ~exist(path_confound, 'dir')
       %mkdir(path_confound)
%end

%confound_name=[func_name(1:end-10)   'confounds.txt']   % the name of the confound regressors
%TR=2.3
%create_est_SPM_func(path_func,path_confound,smoothed_normalized_func_name,confound_name, pathanat, greymattername, TR)

% extract time-series

%extract_time_series(path_confound)

end





