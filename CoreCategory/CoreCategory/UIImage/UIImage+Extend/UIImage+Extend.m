//
//  UIImage+Extend.m
//  CDHN
//
//  Created by muxi on 14-10-14.
//  Copyright (c) 2014年 muxi. All rights reserved.
//

#import "UIImage+Extend.h"
#import "CoreConst.h"

@implementation UIImage (Extend)


/**
 *  根据不同的iphone屏幕大小自动加载对应的图片名
 *  加载规则：
 *  iPhone4:             默认图片名，无后缀
 *  iPhone5系列:          _ip5
 *  iPhone6:             _ip6
 *  iPhone6 Plus:     _ip6p,注意屏幕旋转显示不同的图片不是这个方法能决定的，需要使用UIImage的sizeClass特性决定
 */
+(UIImage *)deviceImageNamed:(NSString *)name{

    NSString *imageName=[name copy];

    //iphone5
    if(iphone5x_4_0) imageName=[NSString stringWithFormat:@"%@%@",imageName,@"_ip5"];
    
    //iphone6
    if(iphone6_4_7) imageName=[NSString stringWithFormat:@"%@%@",imageName,@"_ip6"];
    
    //iphone6 Plus
    if(iphone6Plus_5_5) imageName=[NSString stringWithFormat:@"%@%@",imageName,@"_ip6p"];

    UIImage *originalImage=[UIImage imageNamed:name];
    
    UIImage *deviceImage=[UIImage imageNamed:imageName];
    
    if(deviceImage==nil) deviceImage=originalImage;

    return deviceImage;
}



/**
 *  不同的系统自动加载对应的图片名
 *  iOS7及以上:        默认图片名，无后缀
 *  ios6:             _os6
 */
+(UIImage *)systemImageNamed:(NSString *)name{
    
    NSString *imageName=[name copy];
    
    if(ios6x) imageName=[NSString stringWithFormat:@"%@%@",imageName,@"_os6"];
    
    UIImage *originalImage=[UIImage imageNamed:name];
    
    UIImage *systemImage=[UIImage imageNamed:imageName];
    
    if(systemImage==nil) systemImage=originalImage;
    
    return systemImage;
}



/**
 *  拉伸图片
 */
#pragma mark  拉伸图片:自定义比例
+(UIImage *)resizeWithImageName:(NSString *)name leftCap:(CGFloat)leftCap topCap:(CGFloat)topCap{
    UIImage *image = [self imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * leftCap topCapHeight:image.size.height * topCap];
}




#pragma mark  拉伸图片
+(UIImage *)resizeWithImageName:(NSString *)name{
    
    return [self resizeWithImageName:name leftCap:.5f topCap:.5f];

}
















@end
