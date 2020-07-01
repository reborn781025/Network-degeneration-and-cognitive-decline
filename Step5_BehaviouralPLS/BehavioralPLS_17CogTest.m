clear all; close all; clc

MainFolder=''; % modify accordingly
BrainScoreFile=[MainFolder '/Residual_BrainScores.xlsx'];
CognitiveScoreFile=[MainFolder '/Residual_17CogTest.xlsx'];

%% input
BS_stroke=xlsread(BrainScoreFile,2,'A2:L74');
datamat_lst{1,1}=BS_stroke;
num_subj_lst=[size(BS_stroke,1)];
num_cond=1;
option.method=3;
option.num_perm=5000;
option.is_struct=1;
option.num_boot=1000;
option.clim=95;
option.stacked_behavdata=xlsread(CognitiveScoreFile,1,'A2:Q74');%All residual cognitive domains at baseline
% option.stacked_behavdata=xlsread(CognitiveScoreFile,2,'A2:Q74');%All residual cognitive domains (change)
option.meancentering_type=0;
option.cormode=0;
option.boot_type='strat';

%% Run behavioral PLS
result=pls_analysis(datamat_lst,num_subj_lst,num_cond,option);

%% Save the result
save('result_baseline_17CogTest','result');
% save('result_changes_17CogTest','result');
