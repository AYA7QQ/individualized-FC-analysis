%% Lesion region was manually segmented based T1ImgCoreg----coregT1Lesi

%% Normalized Leison Region by Legions_Mask_Normalization.m----wCoregT1Lesi
clc;
clear;
path_source='E:\cerebellar_MDTB';

list=textread('E:\cerebellar_MDTB\listApha.txt','%s');

for s=1:length(list)
    a=strcat(path_source,filesep,'coregT1Lesi',filesep,list{s},'_LR.nii');

    b=strcat(path_source,filesep,'T1ImgNewSegment',filesep,list{s},filesep,'y_coSYT0928.nii');
    
    matlabbatch{1}.spm.spatial.normalise.write.subj.def = {b};
%%
matlabbatch{1}.spm.spatial.normalise.write.subj.resample = {a};
%%
matlabbatch{1}.spm.spatial.normalise.write.woptions.bb = [-90 -126 -72
                                                          90 90 108];
matlabbatch{1}.spm.spatial.normalise.write.woptions.vox = [3 3 3];
matlabbatch{1}.spm.spatial.normalise.write.woptions.interp = 4;
matlabbatch{1}.spm.spatial.normalise.write.woptions.prefix = 'wNew';
    spm_jobman('run',matlabbatch)       
end


%% somooth Normalized leison region
clc;
clear;
path_source='E:\cerebellar_MDTB';

list=textread('E:\cerebellar_MDTB\listApha.txt','%s');

for s=1:length(list);
    a=strcat(path_source,filesep,'wCoregT1Lesio',filesep,'wNew',list{s},'_LR.nii');  
    matlabbatch{1}.spm.spatial.smooth.data = {a};
    matlabbatch{1}.spm.spatial.smooth.fwhm = [4 4 4];
    matlabbatch{1}.spm.spatial.smooth.dtype = 0;
    matlabbatch{1}.spm.spatial.smooth.im = 0;
    matlabbatch{1}.spm.spatial.smooth.prefix = 's4';
    spm_jobman('run',matlabbatch)      
end

%%% 