//
//  UIView+block.m
//
//  Created by 胡伟伟 on 2020/10/9.
//

#import "UIView+block.h"
#import <objc/runtime.h>




@implementation UIView (block)

//---添加子控件---
-(void)setAddSubView:(wh_addSubView)addSubView{
    objc_setAssociatedObject(self, @selector(addSubView), addSubView, OBJC_ASSOCIATION_COPY);
}

-(wh_addSubView)addSubView{
    wh_addSubView bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIView * _Nullable(UIView * _Nonnull child) {
        [weakSelf addSubview:child];
        return weakSelf;
    };
}

-(void)setInsetSubViewBlowSubView:(wh_insetSubViewBlowSubView)insetSubViewBlowSubView{
    objc_setAssociatedObject(self, @selector(insetSubViewBlowSubView), insetSubViewBlowSubView, OBJC_ASSOCIATION_COPY);
}

-(wh_insetSubViewBlowSubView)insetSubViewBlowSubView{
    wh_insetSubViewBlowSubView bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIView * _Nullable(UIView * _Nonnull child,UIView *siblingSubview) {
        [weakSelf insertSubview:child belowSubview:siblingSubview];
        return weakSelf;
    };
}

-(void)setInsetSubViewAboveSubView:(wh_insetSubViewAboveSubView)insetSubViewAboveSubView{
    objc_setAssociatedObject(self, @selector(insetSubViewAboveSubView), insetSubViewAboveSubView, OBJC_ASSOCIATION_COPY);
}

-(wh_insetSubViewAboveSubView)insetSubViewAboveSubView{
    wh_insetSubViewAboveSubView bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIView * _Nullable(UIView * _Nonnull child,UIView *siblingSubview) {
        [weakSelf insertSubview:child aboveSubview:siblingSubview];
        return weakSelf;
    };
}

-(void)setInsetSubViewAtIndex:(wh_insetSubViewAtIndex)insetSubViewAtIndex{
    objc_setAssociatedObject(self, @selector(insetSubViewAtIndex), insetSubViewAtIndex, OBJC_ASSOCIATION_COPY);
}

-(wh_insetSubViewAtIndex)insetSubViewAtIndex{
    wh_insetSubViewAtIndex bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIView * _Nullable(UIView * _Nonnull child,NSInteger index) {
        [weakSelf insertSubview:child atIndex:index];
        return weakSelf;
    };
}

-(void)setBringSubViewToFront:(wh_bringSubViewToFront)bringSubViewToFront{
    objc_setAssociatedObject(self, @selector(bringSubViewToFront), bringSubViewToFront, OBJC_ASSOCIATION_COPY);
}

-(wh_bringSubViewToFront)bringSubViewToFront{
    wh_bringSubViewToFront bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIView * _Nullable(UIView * _Nonnull child) {
        [weakSelf bringSubviewToFront:child];
        return weakSelf;
    };
}

-(void)setSendSubViewToBack:(wh_sendSubViewToBack)sendSubViewToBack{
    objc_setAssociatedObject(self, @selector(sendSubViewToBack), sendSubViewToBack, OBJC_ASSOCIATION_COPY);
}

-(wh_sendSubViewToBack)sendSubViewToBack{
    wh_sendSubViewToBack bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIView * _Nullable(UIView * _Nonnull child) {
        [weakSelf sendSubviewToBack:child];
        return weakSelf;
    };
}



//---添加子控件---


////添加子控件Block
//@property (nonatomic,copy) wh_insetSubViewAtIndex insetSubViewAtIndex;
//@property (nonatomic,copy) wh_bringSubViewToFront bringSubViewToFront;
//@property (nonatomic,copy) wh_sendSubViewToBack sendSubViewToBack;



// ---tag---
-(void)setTagBlock:(wh_tagBlock)tagBlock{
    objc_setAssociatedObject(self, @selector(tagBlock), tagBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_tagBlock)tagBlock{
    wh_tagBlock tl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return tl ? tl: ^UIView * _Nullable(NSInteger tag) {
        weakSelf.tag = tag;
        return weakSelf;
    };
}
// ---tag---


// ---bacgGroundColor---
-(void)setBackgroundColorBlock:(wh_backgroundColorBlock)backgroundColorBlock{
    objc_setAssociatedObject(self, @selector(backgroundColorBlock), backgroundColorBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_backgroundColorBlock)backgroundColorBlock{
    wh_backgroundColorBlock cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView * _Nullable(UIColor *_Nonnull color) {
        [weakSelf setBackgroundColor:color];
        return weakSelf;
    };
}
// ---bacgGroundColor---

// ---ClipsToBound---
-(void)setClipBoundsBlock:(wh_clipBoundsBlock)clipBoundsBlock{
    objc_setAssociatedObject(self, @selector(clipBoundsBlock), clipBoundsBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_clipBoundsBlock)clipBoundsBlock{
    wh_clipBoundsBlock cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView * _Nullable(BOOL clipBounds) {
        [weakSelf setClipsToBounds:clipBounds];
        return weakSelf;
    };
}
// ---ClipsToBound---


// ---cornerRadius---
-(void)setCornerRadiusBlock:(wh_cornerRadiusBlock)cornerRadiusBlock{
    objc_setAssociatedObject(self, @selector(cornerRadiusBlock), cornerRadiusBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_cornerRadiusBlock)cornerRadiusBlock{
    wh_cornerRadiusBlock cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView * _Nullable(NSInteger cornerRadius) {
        [weakSelf.layer setCornerRadius:cornerRadius];
        return weakSelf;
    };
}
// ---cornerRadius---


// ---alpha---
-(void)setAlphaBlock:(wh_alphaBlock)alphaBlock{
    objc_setAssociatedObject(self, @selector(alphaBlock), alphaBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_alphaBlock)alphaBlock{
    wh_alphaBlock cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView * _Nullable(CGFloat alpha) {
        [weakSelf setAlpha:alpha];
        return weakSelf;
    };
}
// ---alpha---

// ---hidden---
-(void)setHiddenBlock:(wh_hiddenBlock)hiddenBlock{
    objc_setAssociatedObject(self, @selector(hiddenBlock), hiddenBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_hiddenBlock)hiddenBlock{
    wh_hiddenBlock cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView * _Nullable(BOOL hidden) {
        [weakSelf setHidden:hidden];
        return weakSelf;
    };
}
// ---hidden---

// ---contentMode---
-(void)setContentModeBlock:(wh_contentModeBlock)contentModeBlock{
    objc_setAssociatedObject(self, @selector(contentModeBlock), contentModeBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_contentModeBlock)contentModeBlock{
    wh_contentModeBlock cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView * _Nullable(UIViewContentMode contentMode) {
        [weakSelf setContentMode:contentMode];
        return weakSelf;
    };
}
// ---contentMode---

// ---setNeedsLayout---
-(void)setSetNeedsLayoutBlock:(wh_setNeedsLayoutBlock)setNeedsLayoutBlock{
    objc_setAssociatedObject(self, @selector(setNeedsLayoutBlock), setNeedsLayoutBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_setNeedsLayoutBlock)setNeedsLayoutBlock{
    wh_setNeedsLayoutBlock cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView * _Nullable(void) {
        [weakSelf setNeedsLayout];
        return weakSelf;
    };
}
// ---setNeedsLayout---


// ---layoutIfNeeded---
-(void)setLayoutIfNeededBlock:(wh_layoutIfNeededBlock)layoutIfNeededBlock{
    objc_setAssociatedObject(self, @selector(layoutIfNeededBlock), layoutIfNeededBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_layoutIfNeededBlock)layoutIfNeededBlock{
    wh_layoutIfNeededBlock cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView * _Nullable(void) {
        [weakSelf layoutIfNeeded];
        return weakSelf;
    };
}
// ---removeFromSuperview---
-(void)setRemoveFromSuperviewBlock:(wh_removeFromSuperviewBlock)removeFromSuperviewBlock{
    objc_setAssociatedObject(self, @selector(removeFromSuperviewBlock), removeFromSuperviewBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_removeFromSuperviewBlock)removeFromSuperviewBlock{
    wh_removeFromSuperviewBlock cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView * _Nullable(void) {
        [weakSelf removeFromSuperview];
        return weakSelf;
    };
}
// ---removeFromSuperview---


// ---convertPointToView---
-(void)setConvertPointToView:(wh_convertPointToView)convertPointToView{
    objc_setAssociatedObject(self, @selector(convertPointToView), convertPointToView, OBJC_ASSOCIATION_COPY);
}
-(wh_convertPointToView)convertPointToView{
    wh_convertPointToView cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^CGPoint (UIView *toView,CGPoint point) {
        return [weakSelf convertPoint:point toView:toView];
    };
}
// ---convertPointToView---

// ---convertPointfromView---
-(void)setConvertPointfromView:(wh_convertPointfromView)convertPointfromView{
    objc_setAssociatedObject(self, @selector(convertPointfromView), convertPointfromView, OBJC_ASSOCIATION_COPY);
}
-(wh_convertPointfromView)convertPointfromView{
    wh_convertPointfromView cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^CGPoint (UIView *toView,CGPoint point) {
        return [weakSelf convertPoint:point fromView:toView];
    };
}
// ---convertPointfromView---

// ---convertRectToView---
-(void)setConvertRectToView:(wh_convertRectToView)convertRectToView{
    objc_setAssociatedObject(self, @selector(convertRectToView), convertRectToView, OBJC_ASSOCIATION_COPY);
}
-(wh_convertRectToView)convertRectToView{
    wh_convertRectToView cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^CGRect (UIView *toView,CGRect rect) {
        return [weakSelf convertRect:rect toView:toView];
    };
}
// ---convertRectToView---


// ---convertRectFromView---
-(void)setConvertRectFromView:(wh_convertRectFromView)convertRectFromView{
    objc_setAssociatedObject(self, @selector(convertRectFromView), convertRectFromView, OBJC_ASSOCIATION_COPY);
}
-(wh_convertRectFromView)convertRectFromView{
    wh_convertRectFromView cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^CGRect (UIView *toView,CGRect rect) {
        return [weakSelf convertRect:rect fromView:toView];
    };
}
// ---convertRectFromView---

// ---sizeToFit---
-(void)setSieToFitBlock:(wh_sizeToFit)sieToFitBlock{
    objc_setAssociatedObject(self, @selector(sieToFitBlock), sieToFitBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_sizeToFit)sieToFitBlock{
    wh_sizeToFit cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView *(void) {
        [weakSelf sizeToFit];
        return weakSelf;
    };
}
// ---sizeToFit---
//bordColor
-(void)setBordColorBlock:(wh_bordColor)bordColorBlock{
    objc_setAssociatedObject(self, @selector(bordColorBlock), bordColorBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_bordColor)bordColorBlock{
    wh_bordColor cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView *(UIColor *color) {
        [weakSelf.layer setBorderColor:color.CGColor];
        return weakSelf;
    };
}
//bordWidth
-(void)setBordWidthBlock:(wh_bordWidth)bordWidthBlock{
    objc_setAssociatedObject(self, @selector(bordWidthBlock), bordWidthBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_bordWidth)bordWidthBlock{
    wh_bordWidth cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView *(CGFloat width) {
        [weakSelf.layer setBorderWidth:width];
        return weakSelf;
    };
}
//layerShadowOffset
-(void)setLayerShadowOffsetBlock:(wh_layerShadowOffset)layerShadowOffsetBlock{
    objc_setAssociatedObject(self, @selector(layerShadowOffsetBlock), layerShadowOffsetBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_layerShadowOffset)layerShadowOffsetBlock{
    wh_layerShadowOffset cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView *(CGSize shadowOffset) {
        [weakSelf.layer setShadowOffset:shadowOffset];
        return weakSelf;
    };
}

//shadowRadius
-(void)setLayerShadowRadiusBlock:(wh_layerShadowRadius)layerShadowRadiusBlock{
    objc_setAssociatedObject(self, @selector(layerShadowRadiusBlock), layerShadowRadiusBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_layerShadowRadius)layerShadowRadiusBlock{
    wh_layerShadowRadius cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView *(CGFloat shadowRadius) {
        [weakSelf.layer setShadowRadius:shadowRadius];
        return weakSelf;
    };
}

//shadowColor
-(void)setLayerShadowColorBlock:(wh_layerShadowColor)layerShadowColorBlock{
    objc_setAssociatedObject(self, @selector(layerShadowColorBlock), layerShadowColorBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_layerShadowColor)layerShadowColorBlock{
    wh_layerShadowColor cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView *(UIColor *color) {
        [weakSelf.layer setShadowColor:color.CGColor];
        return weakSelf;
    };
}

//shadowOpacity
-(void)setLayershadowOpacityBlock:(wh_layershadowOpacity)layershadowOpacityBlock{
    objc_setAssociatedObject(self, @selector(layershadowOpacityBlock), layershadowOpacityBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_layershadowOpacity)layershadowOpacityBlock{
    wh_layershadowOpacity cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView *(CGFloat shadowOpacity) {
        [weakSelf.layer setShadowOpacity:shadowOpacity];
        return weakSelf;
    };
}

//layerContent
-(void)setLayerContentBlock:(wh_layerContent)layerContentBlock{
    objc_setAssociatedObject(self, @selector(layerContentBlock), layerContentBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_layerContent)layerContentBlock{
    wh_layerContent cl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return cl ? cl: ^UIView *(UIImage *image) {
        [weakSelf.layer setContents:(id)image.CGImage];
        return weakSelf;
    };
}

@end
