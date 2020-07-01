% This script uses the computational anatomy toolbox (CAT12) for Statistical Parametric Mapping (SPM12; Wellcome Trust Centre for Neuroimaging). 
% Please install Cat12 and SPM12 first

addpath(genpath(SPM12)) % modify the path according to your own use

matlabbatch{1}.spm.util.defs.comp{1}.def = {'/DARTE/y_Template_6_2mni.nii'}; % modify accordingly
matlabbatch{1}.spm.util.defs.out{1}.push.fnames = {
                                                   '/DARTEL/Template_0.nii'
                                                   '/DARTEL/Template_1.nii'
                                                   '/DARTEL/Template_2.nii'
                                                   '/DARTEL/Template_3.nii'
                                                   '/DARTEL/Template_4.nii'
                                                   '/DARTEL/Template_5.nii'
                                                   '/DARTEL/Template_6.nii'
                                                   }; % modify accordingly
matlabbatch{1}.spm.util.defs.out{1}.push.weight = {''};
matlabbatch{1}.spm.util.defs.out{1}.push.savedir.saveusr = {'/DARTEL'}; % modify accordingly
matlabbatch{1}.spm.util.defs.out{1}.push.fov.file = {'/DARTEL/Template_6.nii'}; % modify accordingly
matlabbatch{1}.spm.util.defs.out{1}.push.preserve = 0;
matlabbatch{1}.spm.util.defs.out{1}.push.fwhm = [0 0 0];
matlabbatch{1}.spm.util.defs.out{1}.push.prefix = '';
