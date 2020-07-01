% This script uses MarsBar for Statistical Parametric Mapping (SPM12; Wellcome Trust Centre for Neuroimaging). 
% Please install MarsBar and SPM12 first

addpath(genpath(SPM12)) % modify the path according to your own use

marsbar('on')

% select a list of ROI peaks
space_dir=''; % modify accordingly
peaklist=[-7 -43 33; -16 48 44; -31 -55 54; 31 -55 54; -44 36 20; 44 36 20; -38 26 -10; 38 26 -10; -21 -25 -14; 24 -19 -21; -50 18 7; -38 10 -28];%left PCC, mPFC, left IPS, right IPS, left DLPFC, right DLPFC, left insula, right insula, left HIP, right HIP, left IFGO, left temporal pole
% build and save object
varargout = {[]};
number=[1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 11; 12]
name=['L_PCC';'mPFC';'L_IPS';'R_IPS';'L_DLPFC';'R_DLPFC';'L_INS';'R_INS';'L_HIP';'R_HIP';'L_IFGO';'L_Tpole'];
r=4;
descrip='sphere_4mm';
% Label, description
for i=1:size(peaklist,1)
  o = maroi_sphere(struct('centre',peaklist(i,:),'radius',r));
  d=strcat(num2str(number(i)),'_',descrip,'_',num2str(peaklist(i,1)),'_',num2str(peaklist(i,2)),'_',num2str(peaklist(i,3)));
  o = label(o,d);
  roi_fname = maroi('filename', label(o));
    try
      varargout = {saveroi(o, roi_fname)};
    catch
      warning([lasterr ' Error saving ROI to file ' roi_fname])
    end
      
    sp = mars_space(space_dir);
    roinii_fname = [label(o), '.nii'];
    save_as_image(o, roinii_fname, sp);
end

%disp('Roi mat file saved to current directory');
