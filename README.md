# Satellite-imagery-classification
Satellite-imagery classification using k-means


这是本人在中科大代培时所上的课程“机器学习与知识发现”的大作业。

数据集为2015年某地区的高分辨率遥感影像，包括基于该遥感影像目视解译出来的地表覆盖样本数据（图片）。

利用无监督的k-means算法对训练集进行聚类，将聚类结果保存到codebook中。然后对训练集基于codebook对每个像素计算其到聚类中心的欧式距离，取最小距离进行赋值。

训练代码为training.m，测试代码为testing.m。

具体内容见report_ml.pdf。


[【Keras】基于SegNet和U-Net的遥感图像语义分割](https://www.cnblogs.com/skyfsm/p/8330882.html)

[基于U-Net的高分辨率遥感图像语义分割方法](http://cea.ceaj.org/CN/abstract/abstract37642.shtml)
