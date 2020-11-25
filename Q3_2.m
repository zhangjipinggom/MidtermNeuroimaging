%% code for Question 3-2, get the tLASCA image
%% configuration and store all the frames in I1 and their square in I2
file_path =  '.\Dat\';  I = dir(fullfile(file_path,'*.tif'));
filename = fullfile(file_path,I(1).name); img0 = imread(filename);
size_img = size(img0); img_num = numel(I);

I1 = zeros(size_img(1), size_img(2), img_num); 
I2 = zeros(size_img(1), size_img(2), img_num);
for  k= 1:img_num
  filename = fullfile(file_path,I(k).name);img0 = double(imread(filename));
  I1(:, :, k) = img0;
  I2(:, :, k) = img0.*img0;
end
temp_length = 21; temp_range = (temp_length-1)/2; par=1/temp_length;

%% calcute the contrast for each frame and sum them in matrix sLASCA
tLASCA = zeros(size_img);
for i_frame = temp_range+1: img_num - temp_range
    Pa = sum(I2(:,:, i_frame-temp_range: i_frame+temp_range), 3);
    Pb = sum(I1(:,:, i_frame-temp_range: i_frame+temp_range), 3);
    tLASCA0 = sqrt(par*Pa - par^2*(Pb.*Pb))./(par*Pb);
    tLASCA = tLASCA + tLASCA0;
end
   
%% tLASCA and  eLASCA
tLASCA = tLASCA / (img_num-2*temp_range);
etLASCA = eLASCA(tLASCA);
subplot(121),colormap(gray(256));imagesc(tLASCA);title('tLASCA');
subplot(122),colormap(gray(256));imagesc(etLASCA);title('eLASCA of tLASCA');