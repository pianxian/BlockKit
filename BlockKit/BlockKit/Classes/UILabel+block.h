//
//  UILabel+block.h
//  分类测试
//
//  Created by 胡伟伟 on 2020/10/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//默认字体
typedef UILabel *_Nullable(^wh_systemFont)(CGFloat font);
//加粗字体
typedef UILabel *_Nullable(^wh_systemBoldFont)(CGFloat font);
//自定义字体
typedef UILabel *_Nullable(^wh_customFont)(NSString *fontName,CGFloat font);
//字体颜色
typedef UILabel *_Nullable(^wh_textColor)(UIColor *color);
//shadowColor
typedef UILabel *_Nullable(^wh_shadowColor)(UIColor *color);
//shadowOffset
typedef UILabel *_Nullable(^wh_shadowOffset)(CGSize shadowOffset);
//textAlignment
typedef UILabel *_Nullable(^wh_textAlignment)(NSTextAlignment textAlignment);

//lineBreakMode
typedef UILabel *_Nullable(^wh_lineBreakMode)(NSLineBreakMode lineBreakMode);
//attributedText
typedef UILabel *_Nullable(^wh_attributedText)(NSAttributedString * attributedText);
//highlightedTextColor
typedef UILabel *_Nullable(^wh_highlightedTextColor)(UIColor * highlightedTextColor);
//highlighted
typedef UILabel *_Nullable(^wh_highlighted)(BOOL highlighted);
//userInteractionEnabled
typedef UILabel *_Nullable(^wh_userInteractionEnabled)(BOOL userInteractionEnabled);
//enabled
typedef UILabel *_Nullable(^wh_enabled)(BOOL enabled);
//numberOfLines
typedef UILabel *_Nullable(^wh_numberOfLines)(NSInteger numberOfLines);

//adjustsFontSizeToFitWidth
typedef UILabel *_Nullable(^wh_adjustsFontSizeToFitWidth)(BOOL adjustsFontSizeToFitWidth);

@interface UILabel (block)
//默认字体
@property (nonatomic,copy) wh_systemFont systemFontBlock;
//加粗字体
@property (nonatomic,copy) wh_systemBoldFont systemBoldFontBlock;
//自定义字体
@property (nonatomic,copy) wh_customFont customFontBlock;
//字体颜色
@property (nonatomic,copy) wh_textColor textColorBlock;
//shadowColor
@property (nonatomic,copy) wh_shadowColor shadowColorBlock;
//shadowOffset
@property (nonatomic,copy) wh_shadowOffset shadowOffsetBlock;

//textAlignment
@property (nonatomic,copy) wh_textAlignment textAlignmenBlock;
//lineBreakMode
@property (nonatomic,copy) wh_lineBreakMode lineBreakModeBlock;
//attributedText
@property (nonatomic,copy) wh_attributedText attributedTextBlock;
//highlightedTextColor
@property (nonatomic,copy) wh_highlightedTextColor highlightedTextColorBlock;
//highlighted
@property (nonatomic,copy) wh_highlighted highlightedBlock;
//userInteractionEnabled
@property (nonatomic,copy) wh_userInteractionEnabled userInteractionEnabledBlock;
//enabled
@property (nonatomic,copy) wh_enabled enabledBlock;
//numberOfLines
@property (nonatomic,copy) wh_numberOfLines numberOfLinesBlock;
//adjustsFontSizeToFitWidth

@property (nonatomic,copy) wh_adjustsFontSizeToFitWidth adjustsFontSizeToFitWidthBlock;

@end

NS_ASSUME_NONNULL_END
