%% EEE3032 - Computer Vision and Pattern Recognition (ee3.cvpr)
%%
%% cvpr_visualsearch.m
%% Skeleton code provided as part of the coursework assessment
%%
%% This code will load in all descriptors pre-computed (by the
%% function cvpr_computedescriptors) from the images in the MSRCv2 dataset.
%%
%% It will pick a descriptor at random and compare all other descriptors to
%% it - by calling cvpr_compare.  In doing so it will rank the images by
%% similarity to the randomly picked descriptor.  Note that initially the
%% function cvpr_compare returns a random number - you need to code it
%% so that it returns the Euclidean distance or some other distance metric
%% between the two descriptors it is passed.
%%
%% (c) John Collomosse 2010  (J.Collomosse@surrey.ac.uk)
%% Centre for Vision Speech and Signal Processing (CVSSP)
%% University of Surrey, United Kingdom

close all;
clear all;

%% Edit the following line to the folder you unzipped the MSRCv2 dataset to
DATASET_FOLDER = 'C:/Users/Darren Smith/Desktop/SurreyUniversityProjects/1stSemster/ComputerVisionPatternRecognition/MatLabSessions/ComputerVisionProjectImprovement/ComputerVisionCoursework_6553517/cwork_DS_basecode_2018/MSRC_ObjCategImageDatabase_v2';

%% Folder that holds the results...
DESCRIPTOR_FOLDER = 'C:/Users/Darren Smith/Desktop/SurreyUniversityProjects/1stSemster/ComputerVisionPatternRecognition/MatLabSessions/ComputerVisionProjectImprovement/ComputerVisionCoursework_6553517/cwork_DS_basecode_2018/descriptors';
%% and within that folder, another folder to hold the descriptors
%% we are interested in working with
%DESCRIPTOR_SUBFOLDER='globalRGBhisto';
DESCRIPTOR_SUBFOLDER='EOH';

%% 1) Load all the descriptors into "ALLFEAT"
%% each row of ALLFEAT is a descriptor (is an image)

ALLFEAT=[]; %array of images
Classes=[]; %Class array
ALLFILES=cell(1,0);
ctr=1;
allfiles=dir (fullfile([DATASET_FOLDER,'/Images/*.bmp']));
for filenum=1:length(allfiles)
    fname=allfiles(filenum).name; %File names
    Split_f = split(fname, "_"); %Spilit the file names in order to get the components. Eg "1_25_s.bmp" ,split function ("1_25_s.bmp", "_") 
    class = str2num(Split_f{1}); %Returns the numbers in this case the first number in the cell and its converted to int
   
    Classes=[Classes ; class]; % arranging each class number in an array for each iteration
    imgfname_full=([DATASET_FOLDER,'/Images/',fname]);
    img=double(imread(imgfname_full))./255;
    thesefeat=[];
    featfile=[DESCRIPTOR_FOLDER,'/',DESCRIPTOR_SUBFOLDER,'/',fname(1:end-4),'.mat'];%replace .bmp with .mat
    load(featfile,'F');
    ALLFILES{ctr}=imgfname_full;
    ALLFEAT=[ALLFEAT ; F];
    ctr=ctr+1;
end

%% 2) Pick an image at random to be the query
NIMG=size(ALLFEAT,1);           % number of images in collection
queryimg=floor(rand()*NIMG);    % index of a random image
% queryimg = 17;                  %index an image

%% 3) Compute the distance of image to the query
dst=[];
for i=1:NIMG
    candidate=ALLFEAT(i,:);
    query=ALLFEAT(queryimg,:);
    e = Eigen_PCA(ALLFEAT);
    
    %mdist = Eigen_Mahalanobis(query,e);
    
    thedst=cvpr_compare(query,candidate);
    dst=[dst ; [thedst i]];
end
dst=sortrows(dst,1);  % sort the results

%% 4) Visualise the results
%% These may be a little hard to see using imgshow
%% If you have access, try using imshow(outdisplay) or imagesc(outdisplay)

SHOW=10; % Show top 15 results
dst=dst(1:SHOW,:);
outdisplay=[];
for i=1:size(dst,1)
   img=imread(ALLFILES{dst(i,2)});
   img=img(1:1:end,1:1:end,:); % make image a quarter size
   img=img(1:81,:,:); % crop image to uniform size vertically (some MSVC images are different heights)
   outdisplay=[outdisplay img];
end
imshow(outdisplay);
axis off;
PrCurveTest;
axis on;