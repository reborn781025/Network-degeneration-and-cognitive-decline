% This script uses the computational anatomy toolbox (CAT12) for Statistical Parametric Mapping (SPM12; Wellcome Trust Centre for Neuroimaging). 
% Please install Cat12 and SPM12 first

addpath(genpath(SPM12)) % modify the path according to your own use

matlabbatch{1}.spm.tools.cat.tools.check_cov.data_vol = {
                                                         {
                                                         % put all mwp1rtp2.nii images here
                                                         }
                                                         }';
%%
%%
matlabbatch{1}.spm.tools.cat.tools.check_cov.data_xml = {
                                                         % put all cat_rtp2.xml files here
                                                         };
%%
matlabbatch{1}.spm.tools.cat.tools.check_cov.gap = 3;
%%
matlabbatch{1}.spm.tools.cat.tools.check_cov.c = {
                                                  % put all TIV here
                                                  }';
%%
