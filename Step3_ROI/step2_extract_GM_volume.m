% This script uses MarsBar for Statistical Parametric Mapping (SPM12; Wellcome Trust Centre for Neuroimaging). 
% Please install MarsBar and SPM12 first
% Please prepare a sublist.xls before running this script

addpath(genpath(SPM12)) % modify the path according to your own use

clear all; close all; clc;
mainFolder=''; % where your smoothe files generated from Step2_VBM/step7_smooth.m are
grpDir='/Baseline/'; % modify for your own use
roiDir='/ROI/Seeds/'; % modify for your own use
matDir=[grpDir, 'all.mat'];
datafile=[grpDir, 'subjlist.xls']; % prepare a sublist.xls before running this script

excel=1; %excel=1 if intending to read demographic data from an excel file. Otherwise, excel=0 if intending to read from mat file.

roilist={'1_sphere_4mm_-7_-43_33_roi.mat' '2_sphere_4mm_-16_48_44_roi.mat' '3_sphere_4mm_-31_-55_54_roi.mat' '4_sphere_4mm_31_-55_54_roi.mat' '5_sphere_4mm_-44_36_20_roi.mat' '6_sphere_4mm_44_36_20_roi.mat' '7_sphere_4mm_-38_26_-10_roi.mat' '8_sphere_4mm_38_26_-10_roi.mat' '9_sphere_4mm_-21_-25_-14_roi.mat' '10_sphere_4mm_24_-19_-21_roi.mat' '11_sphere_4mm_-50_18_7_roi.mat' '12_sphere_4mm_-38_10_-28_roi.mat'};

switch excel 
    case 0
        %load(datafile,'alldata');
        %alldata=alldata(2:end,:);
        %subjs=alldata(:,1);
        diagnosis=diagnosis';
    case 1
        %% USE XLSREAD TO READ THE SUBJECT DATA - 2 COLUMNS - FIRST COLUMN IS DIAGNOSIS, SECOND COLUMN IS SUBJECT ID
        [num, subjlist, raw] = xlsread(datafile);
        subjs=subjlist(:,1);
        diagnosis=num(:,1);        
end

rois=[];       
roi_files=strvcat(roilist{:});
roi_files((roi_files(:,1)=='.'),:)=[];
roiname=repmat([roiDir], size(roi_files,1),1);
roi_files=[roiname,roi_files];

% read list of subjects that fall into one group
name1=repmat(mainFolder, length(subjs),1);
name2=repmat('.nii', length(subjs),1);
scan=[name1, cell2mat(subjs), name2];
scanall=cellstr(scan);
for i = 1:size(scanall,1)
    scanall{i}=ls(scanall{i});
end
scanall=strvcat(scanall{:});

rois = maroi('load_cell', roi_files);  % make maroi ROI objects
mY = get_marsy(rois{:}, scanall, 'mean');  % extract data into marsy data object
ROI = summary_data(mY); % get summary time course
xlswrite([grpDir,'summary_data_new.xls'], ROI);
subjects=subjs;
roilist=roilist';
save(matDir, 'ROI', 'subjects', 'diagnosis', 'roilist'); 
disp(['Extraction completed']);



%%% Note: There are some differences when running this script on vnc and in
%%% the local server. This is mainly due to voxpts.m script (ceil, floor, sum, sqrt functions) - mainly due to floating point issues)
%%% voxpts.m is called by realpts.m, which is in turned called by
%%% getdata.m, which is called by get_marsy.m
