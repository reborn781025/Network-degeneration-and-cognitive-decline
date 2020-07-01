% This script uses the Lesion Segmentation Tool (LST) (Schmidt et al., Neuroimage, 2012) for Statistical Parametric Mapping (SPM12; Wellcome Trust Centre for
Neuroimaging). Please have LST and SPM12 install first

addpath(genpath(SPM12)) % modify the path according to your own use

clear all; close all; clc

list_file = 'list.txt'; % put your subject list here
list = importdata(list_file);

for i = 1:length(list)
  matlabbatch{1}.spm.tools.LST.lga.data_T1 = {['list{i} '/oT1.nii,1']}; % indicate where all T1 images are
	matlabbatch{1}.spm.tools.LST.lga.data_F2 = {['list{i} '/oFlair.nii,1']}; % indicate where all FLAIR images are
	matlabbatch{1}.spm.tools.LST.lga.opts_lga.initial = 0.3;
	matlabbatch{1}.spm.tools.LST.lga.opts_lga.mrf = 1;
	matlabbatch{1}.spm.tools.LST.lga.opts_lga.maxiter = 50;
	matlabbatch{1}.spm.tools.LST.lga.html_report = 1;
	spm_jobman('run',matlabbatch);
end
