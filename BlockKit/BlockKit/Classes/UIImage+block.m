//
//  UIImage+block.m
//
//  Created by 胡伟伟 on 2020/10/9.
//

#import "UIImage+block.h"
#import <objc/runtime.h>
#import <objc/runtime.h>
@implementation UIImage (block)
+ (UIImage *)wh_imageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


// 加载最原始的图片，没有渲染
-(void)setOriginalImageBlock:(wh_originalImage)originalImageBlock{
    objc_setAssociatedObject(self, @selector(originalImageBlock), originalImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_originalImage)originalImageBlock{
    wh_originalImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIImage * _Nullable(void) {
        return [weakSelf imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    };
}

//拉伸图片
-(void)setStretchableImageBlock:(wh_stretchableImage)stretchableImageBlock{
    objc_setAssociatedObject(self, @selector(stretchableImageBlock), stretchableImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_stretchableImage)stretchableImageBlock{
    wh_stretchableImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIImage * _Nullable(void) {
        return [weakSelf stretchableImageWithLeftCapWidth:weakSelf.size.width * 0.5 topCapHeight:weakSelf.size.height * 0.5];
    };
}


//置灰图片
-(void)setLightImageBlock:(wh_lightImage)lightImageBlock{
    objc_setAssociatedObject(self, @selector(lightImageBlock), lightImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_lightImage)lightImageBlock{
    wh_lightImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIImage * _Nullable(void) {
        int bitmapInfo = kCGImageAlphaNone;
        int width      = self.size.width;
        int height     = self.size.height;
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
        CGContextRef  context      = CGBitmapContextCreate(nil, width, height, 8, 0, colorSpace, bitmapInfo);
        CGColorSpaceRelease(colorSpace);
        CGContextDrawImage(context,CGRectMake(0,0,width,height), weakSelf.CGImage);
        CGImageRef soureceImage = CGBitmapContextCreateImage(context);
        UIImage * grayImage =[UIImage imageWithCGImage:soureceImage];
        CGContextRelease(context);
        CGImageRelease(soureceImage);
        return grayImage;
    };
}

//反转图片
-(void)setMirrorImageBlock:(wh_mirrorImage)mirrorImageBlock{
    objc_setAssociatedObject(self, @selector(mirrorImageBlock), mirrorImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_mirrorImage)mirrorImageBlock{
    wh_mirrorImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIImage * _Nullable(void) {
        CGRect rect =  CGRectMake(0, 0, weakSelf.size.width , weakSelf.size.height);
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 2);
        CGContextRef currentContext =  UIGraphicsGetCurrentContext();
        CGContextClipToRect(currentContext, rect);
        CGContextRotateCTM(currentContext, M_PI);
        CGContextTranslateCTM(currentContext, -rect.size.width, -rect.size.height);
        CGContextDrawImage(currentContext, rect, self.CGImage);
        UIImage* drawImage =  UIGraphicsGetImageFromCurrentImageContext();
        return [UIImage imageWithCGImage:drawImage.CGImage scale:weakSelf.scale orientation:weakSelf.imageOrientation];
    };
}

//高斯模糊图片
-(void)setBlurImageBlock:(wh_blurImage)blurImageBlock{
    objc_setAssociatedObject(self, @selector(blurImageBlock), blurImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_blurImage)blurImageBlock{
    wh_blurImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIImage * _Nullable(CGFloat blur) {
        uint32_t boxSize = (uint32_t)(100 * blur);
        boxSize = boxSize - (boxSize % 2) + 1;
        
        CGImageRef img = weakSelf.CGImage;
        
        vImage_Buffer inBuffer, outBuffer, rgbOutBuffer;
        vImage_Error error;
        
        void *pixelBuffer, *convertBuffer;
        
        CGDataProviderRef inProvider = CGImageGetDataProvider(img);
        CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
        
        convertBuffer = malloc( CGImageGetBytesPerRow(img) * CGImageGetHeight(img) );
        rgbOutBuffer.width = CGImageGetWidth(img);
        rgbOutBuffer.height = CGImageGetHeight(img);
        rgbOutBuffer.rowBytes = CGImageGetBytesPerRow(img);
        rgbOutBuffer.data = convertBuffer;
        
        inBuffer.width = CGImageGetWidth(img);
        inBuffer.height = CGImageGetHeight(img);
        inBuffer.rowBytes = CGImageGetBytesPerRow(img);
        inBuffer.data = (void *)CFDataGetBytePtr(inBitmapData);
        
        pixelBuffer = malloc( CGImageGetBytesPerRow(img) * CGImageGetHeight(img) );
        
        if (pixelBuffer == NULL) {
            NSLog(@"No pixelbuffer");
        }
        
        outBuffer.data = pixelBuffer;
        outBuffer.width = CGImageGetWidth(img);
        outBuffer.height = CGImageGetHeight(img);
        outBuffer.rowBytes = CGImageGetBytesPerRow(img);
        
        void *rgbConvertBuffer = malloc( CGImageGetBytesPerRow(img) * CGImageGetHeight(img) );
        vImage_Buffer outRGBBuffer;
        outRGBBuffer.width = CGImageGetWidth(img);
        outRGBBuffer.height = CGImageGetHeight(img);
        outRGBBuffer.rowBytes = 3;
        outRGBBuffer.data = rgbConvertBuffer;
        
        error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        
        if (error) {
            NSLog(@"error from convolution %ld", error);
        }
        const uint8_t mask[] = {2, 1, 0, 3};
        
        vImagePermuteChannels_ARGB8888(&outBuffer, &rgbOutBuffer, mask, kvImageNoFlags);
        
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef ctx = CGBitmapContextCreate(rgbOutBuffer.data,
                                                 rgbOutBuffer.width,
                                                 rgbOutBuffer.height,
                                                 8,
                                                 rgbOutBuffer.rowBytes,
                                                 colorSpace,
                                                 kCGImageAlphaNoneSkipLast);
        CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
        UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
        
        //clean up
        CGContextRelease(ctx);
        
        free(pixelBuffer);
        free(convertBuffer);
        free(rgbConvertBuffer);
        CFRelease(inBitmapData);
        
        CGColorSpaceRelease(colorSpace);
        CGImageRelease(imageRef);
        
        return returnImage;

    };
}

//拉伸部分区域图片
-(void)setEdageInsetsImageBlock:(wh_edageInsetsImage)edageInsetsImageBlock{
    objc_setAssociatedObject(self, @selector(edageInsetsImageBlock), edageInsetsImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_edageInsetsImage)edageInsetsImageBlock{
    wh_edageInsetsImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIImage * _Nullable(UIEdgeInsets edgeInsets) {
        
        return [weakSelf resizableImageWithCapInsets:UIEdgeInsetsMake(edgeInsets.top, edgeInsets.left, edgeInsets.bottom, edgeInsets.right) resizingMode:UIImageResizingModeStretch];
    };
}

+ (UIImage *)gradientColorImageFromColors:(NSArray<UIColor *>*)colors direction:(gradientDirection)direction imageSize:(CGSize)imageSize{
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(imageSize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    switch (direction) {
        case gradientDirectionTopToBottom:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, imageSize.height);
            break;
        case gradientDirectionLeftToRight:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imageSize.width, 0.0);
            break;
        case gradientDirectionUpleftToLowright:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(imageSize.width, imageSize.height);
            break;
        case gradientDirectionUprightToLowleft:
            start = CGPointMake(imageSize.width, 0.0);
            end = CGPointMake(0.0, imageSize.height);
            break;
        default:
            break;
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;

}

@end
