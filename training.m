clc;
close all;
clear;

%% kmeans 聚类训练
tic
train = imread('train1_8bit.png');
train = im2double(train);
train = imresize(train, 0.3);
[m,n,k] = size(train);
red = train(:,:,1);
green = train(:,:,2);
blue = train(:,:,3);
red = red(:);
green = green(:);
blue = blue(:);
im = [red(:) green(:) blue(:)];
[IDX, C] = kmeans(im, 6);  %图类1分6个中心较好
C255 = C * 255; %聚类中心 保存codebook
save('codebook', 'C');


im = double(im);
%依次对同一类别的像元将其亮度值修改为该类亮度的平均值
for i = 1:5
    pp = find(IDX==i);
    avg = mean(im(pp,:));
    for j = 1:length(pp)
        im(pp(j),:) = avg;
    end
end
%输出分类结果图
red = im(:,1);
green = im(:,2);
blue = im(:,3);
red = reshape(red,m,n);
green = reshape(green,m,n);
blue = reshape(blue,m,n);
train(:,:,1) = red;
train(:,:,2) = green;
train(:,:,3) = blue;
% img=uint8(img);
figure,
imshow(train);


toc
%% 模糊C均值（fuzzy C means，FCM）算法实现

% tic
% train=imread('train1_8bit.png');
% train=im2double(train);
% train=imresize(train, 0.3);
% [m,n,k]=size(train);
% red=train(:,:,1);green=train(:,:,2);blue=train(:,:,3);
% red=red(:);green=green(:);blue=blue(:);
% im=[red(:) green(:) blue(:)];
% [C, U, obj_fcn] =fcm(im,6);
% save('codebook', 'C');
% maxU = max(U);
% index1 = find(U(1,:) == maxU);
% index2 = find(U(2,:) == maxU);
% index3 = find(U(3,:) == maxU);
% index4 = find(U(4,:) == maxU);
% index5 = find(U(5,:) == maxU);
% %依次对同一类别的像元将其亮度值修改为该类亮度的平均值
% red(index1)=mean(red(index1));green(index1)=mean(green(index1));blue(index1)=mean(blue(index1));
% red(index2)=mean(red(index2));green(index2)=mean(green(index2));blue(index2)=mean(blue(index2));
% red(index3)=mean(red(index3));green(index3)=mean(green(index3));blue(index3)=mean(blue(index3));
% red(index4)=mean(red(index4));green(index4)=mean(green(index4));blue(index4)=mean(blue(index4));
% red(index5)=mean(red(index5));green(index5)=mean(green(index5));blue(index5)=mean(blue(index5));
% %输出分类结果图
% red=reshape(red,m,n);green=reshape(green,m,n);blue=reshape(blue,m,n);
% train(:,:,1)=red;train(:,:,2)=green;train(:,:,3)=blue;
% % img=uint8(img);
% figure,
% imshow(train);
% 
% toc
% imwrite(train,'');


















