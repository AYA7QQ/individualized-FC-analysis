
clc;
clear;
path_source='E:\cerebellar_MDTB';

list=textread('E:\cerebellar_MDTB\listApha.txt','%s');

a = strcat(path_source,filesep,'LN.nii');
for s=1:length(list)
    
    b=strcat(path_source,filesep,'wCoregT1Lesio',filesep,'s4wNew',list{s},'_LR.nii');
    c=strcat(path_source,filesep,'wCoregT1Lesio',filesep,'LNPerserved_',list{s},'_LR.nii');
    
     matlabbatch{1}.spm.util.imcalc.input = {
                                        a
                                        b
                                        };
matlabbatch{1}.spm.util.imcalc.output = c;
matlabbatch{1}.spm.util.imcalc.outdir = {''};
matlabbatch{1}.spm.util.imcalc.expression = 'i1-(i1.*i2)';
matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
matlabbatch{1}.spm.util.imcalc.options.mask = 0;
matlabbatch{1}.spm.util.imcalc.options.interp = 1;
matlabbatch{1}.spm.util.imcalc.options.dtype = 4;
    spm_jobman('run',matlabbatch) 
end
