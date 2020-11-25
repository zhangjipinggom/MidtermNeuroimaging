%% configuration 
file_path =  '.\Dat\';  
img_path_list = dir(strcat(file_path,'*.tif'));
img_num = length(img_path_list);
kernel_size = 3;
par = 1/(kernel_size^2); % parameter
img0 = imread(strcat(file_path,img_path_list(1).name));
size_img = size(img0);

%% calcute the contrast for each frame and sum them in matrix sLASCA
sLASCA = zeros(size_img(1)-2, size_img(2)-2);
for i_img = 1: img_num
    img0 = imread(strcat(file_path,img_path_list(i_img).name));
    img0 = double(img0); % attention here
    
    Pa = zeros(size_img(1)-2, size_img(2)-2);
    Pb = zeros(size_img(1)-2, size_img(2)-2); 
    for i_y_shift = 1: kernel_size
        for i_x_shift = 1: kernel_size
            img_roi = img0(i_y_shift:size_img(1)+i_y_shift-3, i_x_shift: size_img(2)+i_x_shift-3);
            Pa = Pa + img_roi.*img_roi; % matrix manipulation
            Pb = Pb + img_roi;
        end
    end
    sLASCA0 = sqrt(par*Pa - par^2*(Pb.*Pb))./(par*Pb);
    sLASCA = sLASCA + sLASCA0;
end

 %% sLASCA and  eLASCA
sLASCA = sLASCA / img_num;
esLASCA = eLASCA(sLASCA);
subplot(121),colormap(gray(256));imagesc(sLASCA);title('sLASCA');
subplot(122),colormap(gray(256));imagesc(esLASCA);title('eLASCA of sLASCA');