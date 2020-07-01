% This script uses ta computational anatomy toolbox (CAT12) for Statistical Parametric Mapping (SPM12; Wellcome Trust Centre for Neuroimaging). 
% Please install Cat12 and SPM12 first

addpath(genpath(SPM12)) % modify the path according to your own use

matlabbatch{1}.spm.tools.dartel.popnorm.template = {'/DARTEL/Template_6.nii'}; % modify accordingly
