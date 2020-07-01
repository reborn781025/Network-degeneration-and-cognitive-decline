% This script uses ta computational anatomy toolbox (CAT12) for Statistical Parametric Mapping (SPM12; Wellcome Trust Centre for Neuroimaging). 
% Please install Cat12 and SPM12 first

addpath(genpath(SPM12)) % modify the path according to your own use

list_file = 'list.txt'; % put your subject list here
list = importdata(list_file);

for i=1:length(list)
    matlabbatch{1}.spm.tools.cat.tools.long.subj.mov = {
                                                        [list{i} '/tp2.nii,1']
                                                        [list{i} '/tp3.nii,1']
                                                        }; % put all lesion-filled images per subject here
    matlabbatch{1}.spm.tools.cat.tools.long.opts.tpm = {'spm12/tpm/TPM.nii'}; % modify accordingly
    matlabbatch{1}.spm.tools.cat.tools.long.opts.affreg = 'mni';
    matlabbatch{1}.spm.tools.cat.tools.long.opts.biasstr = 0.5;
    matlabbatch{1}.spm.tools.cat.tools.long.opts.samp = 3;
    matlabbatch{1}.spm.tools.cat.tools.long.opts.redspmres = 0;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.segmentation.APP = 1070;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.segmentation.NCstr = -Inf;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.segmentation.LASstr = 0.5;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.segmentation.gcutstr = 0;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.segmentation.cleanupstr = 0.5;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.segmentation.WMHC = 1;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.segmentation.SLC = 0;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.segmentation.restypes.fixed = [1 0.1];
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.registration.darteltpm = {'/spm12/toolbox/cat12/templates_1.50mm/Template_1_IXI555_MNI152.nii'}; % modify accordingly
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.registration.shootingtpm = {'/spm12/toolbox/cat12/templates_1.50mm/Template_0_IXI555_MNI152_GS.nii'}; % modify accordingly
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.registration.regstr = 0;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.vox = 1.5;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.surface.pbtres = 0.5;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.surface.scale_cortex = 0.7;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.surface.add_parahipp = 0.1;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.surface.close_parahipp = 0;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.admin.ignoreErrors = 0;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.admin.verb = 2;
    matlabbatch{1}.spm.tools.cat.tools.long.extopts.admin.print = 2;
    matlabbatch{1}.spm.tools.cat.tools.long.output.surface = 0;
    matlabbatch{1}.spm.tools.cat.tools.long.modulate = 0;
    matlabbatch{1}.spm.tools.cat.tools.long.warps = 0;
    matlabbatch{1}.spm.tools.cat.tools.long.dartel = 2;
    matlabbatch{1}.spm.tools.cat.tools.long.delete_temp = 0;
    spm_jobman('run',matlabbatch);
end
