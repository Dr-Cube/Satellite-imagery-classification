clc;
close all;
clear;

%% 加载codebook
load codebook.mat;
testim = imread('testing1_8bit.png');
testim = im2double(testim); %若修改rgb范围，这里也要改
sizeC = size(C)%若修改rgb范围，则要改C
sizeim = size(testim)
% figure, imshow(testim);

%% 尝试使用矩阵方式进行循环

% % 创建与聚类中心有相同rgb值且与测试图像相同大小的图像
% for i = 1:sizeC(1)
%     eval(['center' num2str(i) '= zeros(size(testim));']);
%     for j = 1:3
%         %若修改rgb范围，则要改C
%         eval(['center' num2str(i) '(:,:,' num2str(j) ...
%             ') = C(' num2str(i) ',' num2str(j) ');']);
%     end
% end

% center1 = imresize(center1, 0.1);
% imshow(center1);

%% 图像对比
tic
center = zeros(sizeim);%保存最大rgb值
rgbdist = zeros(sizeim(1),sizeim(2),sizeC(1)); %保存rgb距离

% 计算每个像素的rgb距离
for j = 1:sizeim(1)
    for k = 1:sizeim(2)
        for i = 1:sizeC(1)
            %若修改rgb范围，则要改C
            rgbdist(j,k,i) = (testim(j,k,1)-C(i,1))^2 + ...
                (testim(j,k,2)-C(i,2))^2 + (testim(j,k,3)-C(i,3))^2;
        end
    end
    
end

% 最小值和最小值的位置
[valmin posmin] = min(rgbdist,[],3);
csvwrite('csv_testing1', posmin);% 输出csv结果
C = [0 0 1; 1 0 0; 1 1 1; 0 1 0; 0.8 0.8 0.1; 0 0 0];

% 为每个像素赋值
for i = 1:sizeim(1)
    for j = 1:sizeim(2)
        centnum = posmin(i,j); %codebook中聚类中心的行号
        cbrgb = C(centnum,:);
        for k = 1:sizeim(3)
            testim(i,j,k) = cbrgb(k);
            
        end
        
    end
end

toc

figure, imshow(testim);


