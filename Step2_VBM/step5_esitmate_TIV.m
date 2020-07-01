% This script uses the computational anatomy toolbox (CAT12) for Statistical Parametric Mapping (SPM12; Wellcome Trust Centre for Neuroimaging). 
% Please install Cat12 and SPM12 first

addpath(genpath(SPM12)) % modify the path according to your own use

matlabbatch{1}.spm.tools.cat.tools.calcvol.data_xml = {
                                                        % put all cat_avg_tp2.xml here
                                                       };
%%
matlabbatch{1}.spm.tools.cat.tools.calcvol.calcvol_TIV = 1;
matlabbatch{1}.spm.tools.cat.tools.calcvol.calcvol_name = 'TIVonly_avg.txt'; % modify file name accordingly
