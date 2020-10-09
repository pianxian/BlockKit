//
//  UIImage+block.h
//  分类测试
//
//  Created by 胡伟伟 on 2020/10/9.
//

#import <UIKit/UIKit.h>
#import <Accelerate/Accelerate.h>
typedef NS_ENUM(NSUInteger, gradientDirection) {
    
    gradientDirectionTopToBottom = 0,//从上到下
    
    gradientDirectionLeftToRight = 1,//从左到右
    
    gradientDirectionUpleftToLowright = 2,//左上到右下
    
    gradientDirectionUprightToLowleft = 3,//右上到左下
};

NS_ASSUME_NONNULL_BEGIN
// 加载最原始的图片，没有渲染
typedef UIImage *_Nullable(^wh_originalImage)(void);
//拉伸图片
typedef UIImage *_Nullable(^wh_stretchableImage)(void);
//置灰图片
typedef UIImage *_Nullable(^wh_lightImage)(void);
//反转图片
typedef UIImage *_Nullable(^wh_mirrorImage)(void);
//高斯模糊图片
typedef UIImage *_Nullable(^wh_blurImage)(CGFloat blur);
//拉伸部分区域图片
typedef UIImage *_Nullable(^wh_edageInsetsImage)(UIEdgeInsets edageInsets);


@interface UIImage (block)
//纯色图片
+ (UIImage *)wh_imageWithColor:(UIColor *)color size:(CGSize)size;
// 加载最原始的图片，没有渲染
@property (nonatomic,copy) wh_originalImage originalImageBlock;

//拉伸图片
@property (nonatomic,copy) wh_stretchableImage stretchableImageBlock;

//置灰图片
@property (nonatomic,copy) wh_lightImage lightImageBlock;

//反转图片
@property (nonatomic,copy) wh_mirrorImage mirrorImageBlock;

//高斯模糊图片
@property (nonatomic,copy) wh_blurImage blurImageBlock;

//拉伸部分区域图片
@property (nonatomic,copy) wh_edageInsetsImage edageInsetsImageBlock;
//生成一张渐变色图片
+ (UIImage *)gradientColorImageFromColors:(NSArray<UIColor *>*)colors direction:(gradientDirection)direction imageSize:(CGSize)imageSize;
@end

NS_ASSUME_NONNULL_END
