//
//  UIView+block.h
//  分类测试
//
//  Created by 胡伟伟 on 2020/10/9.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN
//添加子控件Block
typedef UIView *_Nullable(^wh_addSubView)(UIView *childView);

//添加子控件Block
typedef UIView *_Nullable(^wh_insetSubViewBlowSubView)(UIView *childView,UIView *siblingSubview);

//添加子控件Block
typedef UIView *_Nullable(^wh_insetSubViewAboveSubView)(UIView *childView,UIView *siblingSubview);

typedef UIView *_Nullable(^wh_insetSubViewAtIndex)(UIView *childView,NSInteger index);

typedef UIView *_Nullable(^wh_bringSubViewToFront)(UIView *childView);

typedef UIView *_Nullable(^wh_sendSubViewToBack)(UIView *childView);

//tagBlock
typedef UIView *_Nullable(^wh_tagBlock)(NSInteger tag);
//backGroundColor
typedef UIView *_Nullable(^wh_backgroundColorBlock)(UIColor *color);
//clipBounds
typedef UIView *_Nullable(^wh_clipBoundsBlock)(BOOL chipBounds);
//cornerRadius
typedef UIView *_Nullable(^wh_cornerRadiusBlock)(NSInteger cornerRadius);
//alpha
typedef UIView *_Nullable(^wh_alphaBlock)(CGFloat alpha);
//hidden
typedef UIView *_Nullable(^wh_hiddenBlock)(BOOL hidden);
//contentMode
typedef UIView *_Nullable(^wh_contentModeBlock)(UIViewContentMode contentMode);
//setNeedsLayout
typedef UIView *_Nullable(^wh_setNeedsLayoutBlock)(void);
//layoutIfNeeded
typedef UIView *_Nullable(^wh_layoutIfNeededBlock)(void);

//removeFromSuperview
typedef UIView *_Nullable(^wh_removeFromSuperviewBlock)(void);

//convertPointToView
typedef CGPoint (^wh_convertPointToView)(UIView *toView,CGPoint point);

//convertPointfromView
typedef CGPoint (^wh_convertPointfromView)(UIView *fromeView,CGPoint point);
//convertRectToView
typedef CGRect (^wh_convertRectToView)(UIView *toView,CGRect rect);
//convertRectFromView
typedef CGRect (^wh_convertRectFromView)(UIView *fromeView,CGRect rect);
//sizetoFit
typedef UIView *_Nullable(^wh_sizeToFit)(void);

//bordColor
typedef UIView *_Nullable(^wh_bordColor)(UIColor *color);
//bordWidth

typedef UIView *_Nullable(^wh_bordWidth)(CGFloat width);
//layerShadowOffset

typedef UIView *_Nullable(^wh_layerShadowOffset)(CGSize shadowOffset);
//shadowRadius
typedef UIView *_Nullable(^wh_layerShadowRadius)(CGFloat shadowRadius);
//shadowColor
typedef UIView *_Nullable(^wh_layerShadowColor)(UIColor * color);
//shadowOpacity
typedef UIView *_Nullable(^wh_layershadowOpacity)(CGFloat shadowOpacity);
//layerContent
typedef UIView *_Nullable(^wh_layerContent)(UIImage *image);



@interface UIView (block)
//添加子控件Block
@property (nonatomic,copy) wh_addSubView addSubView;
//添加子控件Block
@property (nonatomic,copy) wh_insetSubViewBlowSubView insetSubViewBlowSubView;
//添加子控件Block
@property (nonatomic,copy) wh_insetSubViewAboveSubView insetSubViewAboveSubView;

@property (nonatomic,copy) wh_insetSubViewAtIndex insetSubViewAtIndex;
@property (nonatomic,copy) wh_bringSubViewToFront bringSubViewToFront;
@property (nonatomic,copy) wh_sendSubViewToBack sendSubViewToBack;


//tagBlock
@property (nonatomic,copy) wh_tagBlock tagBlock;
//backGroundColor
@property (nonatomic,copy) wh_backgroundColorBlock backgroundColorBlock;
//clipBounds
@property (nonatomic,copy) wh_clipBoundsBlock clipBoundsBlock;
//cornerRadius
@property (nonatomic,copy) wh_cornerRadiusBlock cornerRadiusBlock;
//alpha
@property (nonatomic,copy) wh_alphaBlock alphaBlock;
//hidden
@property (nonatomic,copy) wh_hiddenBlock hiddenBlock;
//contentMode
@property (nonatomic,copy) wh_contentModeBlock contentModeBlock;
//setNeedsLayout
@property (nonatomic,copy) wh_setNeedsLayoutBlock setNeedsLayoutBlock;
//layoutIfNeeded
@property (nonatomic,copy) wh_layoutIfNeededBlock layoutIfNeededBlock;

//removeFromSuperview
@property (nonatomic,copy) wh_removeFromSuperviewBlock removeFromSuperviewBlock;

//convertPointToView
@property (nonatomic,copy) wh_convertPointToView convertPointToView;
//convertPointfromView
@property (nonatomic,copy) wh_convertPointfromView convertPointfromView;
//convertRectToView
@property (nonatomic,copy) wh_convertRectToView convertRectToView;
//convertRectFromView
@property (nonatomic,copy) wh_convertRectFromView convertRectFromView;
//sizeToFit
@property (nonatomic,copy) wh_sizeToFit sieToFitBlock;


//bordColor
@property (nonatomic,copy) wh_bordColor bordColorBlock;
//bordWidth
@property (nonatomic,copy) wh_bordWidth bordWidthBlock;
//layerShadowOffset
@property (nonatomic,copy) wh_layerShadowOffset layerShadowOffsetBlock;
//shadowRadius
@property (nonatomic,copy) wh_layerShadowRadius layerShadowRadiusBlock;
//shadowColor
@property (nonatomic,copy) wh_layerShadowColor layerShadowColorBlock;
//shadowOpacity
@property (nonatomic,copy) wh_layershadowOpacity layershadowOpacityBlock;
//layerContent
@property (nonatomic,copy) wh_layerContent layerContentBlock;

@end

NS_ASSUME_NONNULL_END
