% This script uses the computational anatomy toolbox (CAT12) for Statistical Parametric Mapping (SPM12; Wellcome Trust Centre for Neuroimaging). 
% Please install Cat12 and SPM12 first

addpath(genpath(SPM12)) % modify the path according to your own use

matlabbatch{1}.spm.spatial.smooth.data = {
                                          % put all mwp1rtp2.nii and mwp1rtp3.nii images here
                                          };
%%
matlabbatch{1}.spm.spatial.smooth.fwhm = [8 8 8];
matlabbatch{1}.spm.spatial.smooth.dtype = 0;
matlabbatch{1}.spm.spatial.smooth.im = 0;
matlabbatch{1}.spm.spatial.smooth.prefix = 's';
