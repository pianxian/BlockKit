//
//  UILabel+block.m
//
//  Created by 胡伟伟 on 2020/10/9.
//

#import "UILabel+block.h"
#import <objc/runtime.h>

@implementation UILabel (block)

//默认字体
-(void)setSystemFontBlock:(wh_systemFont)systemFontBlock{
    objc_setAssociatedObject(self, @selector(systemFontBlock), systemFontBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_systemFont)systemFontBlock{
    wh_systemFont bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(CGFloat  font) {
        [weakSelf setFont:[UIFont systemFontOfSize:font]];
        return weakSelf;
    };
}
//加粗字体
-(void)setSystemBoldFontBlock:(wh_systemBoldFont)systemBoldFontBlock{
    objc_setAssociatedObject(self, @selector(systemBoldFontBlock), systemBoldFontBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_systemBoldFont)systemBoldFontBlock{
    wh_systemBoldFont bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(CGFloat  font) {
        [weakSelf setFont:[UIFont boldSystemFontOfSize:font]];
        return weakSelf;
    };
}
//自定义字体
-(void)setCustomFontBlock:(wh_customFont)customFontBlock{
    objc_setAssociatedObject(self, @selector(customFontBlock), customFontBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_customFont)customFontBlock{
    wh_customFont bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(NSString *fontName,CGFloat font) {
        [weakSelf setFont:[UIFont fontWithName:fontName size:font]];
        return weakSelf;
    };
}

//字体颜色
-(void)setTextColorBlock:(wh_textColor)textColorBlock{
    objc_setAssociatedObject(self, @selector(textColorBlock), textColorBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_textColor)textColorBlock{
    wh_textColor bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(UIColor *color) {
        [weakSelf setTextColor:color];
        return weakSelf;
    };
}
//shadowColor
-(void)setShadowColorBlock:(wh_shadowColor)shadowColorBlock{
    objc_setAssociatedObject(self, @selector(shadowColorBlock), shadowColorBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_shadowColor)shadowColorBlock{
    wh_shadowColor bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(UIColor *color) {
        [weakSelf setShadowColor:color];
        return weakSelf;
    };
}
//shadowOffset
-(void)setShadowOffsetBlock:(wh_shadowOffset)shadowOffsetBlock{
    objc_setAssociatedObject(self, @selector(shadowOffsetBlock), shadowOffsetBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_shadowOffset)shadowOffsetBlock{
    wh_shadowOffset bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(CGSize shadowOffset) {
        [weakSelf setShadowOffset:shadowOffset];
        return weakSelf;
    };
}

//textAlignment
-(void)setTextAlignmenBlock:(wh_textAlignment)textAlignmenBlock{
    objc_setAssociatedObject(self, @selector(textAlignmenBlock), textAlignmenBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_textAlignment)textAlignmenBlock{
    wh_textAlignment bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(NSTextAlignment textAlignment) {
        [weakSelf setTextAlignment:textAlignment];
        return weakSelf;
    };
}

//lineBreakMode
-(void)setLineBreakModeBlock:(wh_lineBreakMode)lineBreakModeBlock{
    objc_setAssociatedObject(self, @selector(lineBreakModeBlock), lineBreakModeBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_lineBreakMode)lineBreakModeBlock{
    wh_lineBreakMode bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(NSLineBreakMode lineBreakMode) {
        [weakSelf setLineBreakMode:lineBreakMode];
        return weakSelf;
    };
}

//attributedText
-(void)setAttributedTextBlock:(wh_attributedText)attributedTextBlock{
    objc_setAssociatedObject(self, @selector(attributedTextBlock), attributedTextBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_attributedText)attributedTextBlock{
    wh_attributedText bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(NSAttributedString *attributedText) {
        [weakSelf setAttributedText:attributedText];
        return weakSelf;
    };
}

//highlightedTextColor
-(void)setHighlightedTextColorBlock:(wh_highlightedTextColor)highlightedTextColorBlock{
    objc_setAssociatedObject(self, @selector(highlightedTextColorBlock), highlightedTextColorBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_highlightedTextColor)highlightedTextColorBlock{
    wh_highlightedTextColor bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(UIColor *highlightedTextColor) {
        [weakSelf setHighlightedTextColor:highlightedTextColor];
        return weakSelf;
    };
}

//highlighted
-(void)setHighlightedBlock:(wh_highlighted)highlightedBlock{
    objc_setAssociatedObject(self, @selector(highlightedBlock), highlightedBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_highlighted)highlightedBlock{
    wh_highlighted bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(BOOL highlighted) {
        [weakSelf setHighlighted:highlighted];
        return weakSelf;
    };
}

//userInteractionEnabled
-(void)setUserInteractionEnabledBlock:(wh_userInteractionEnabled)userInteractionEnabledBlock{
    objc_setAssociatedObject(self, @selector(userInteractionEnabledBlock), userInteractionEnabledBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_userInteractionEnabled)userInteractionEnabledBlock{
    wh_userInteractionEnabled bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(BOOL highlighted) {
        [weakSelf setUserInteractionEnabled:highlighted];
        return weakSelf;
    };
}

//enabled
-(void)setEnabledBlock:(wh_enabled)enabledBlock{
    objc_setAssociatedObject(self, @selector(enabledBlock), enabledBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_enabled)enabledBlock{
    wh_enabled bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(BOOL enabled) {
        [weakSelf setEnabled:enabled];
        return weakSelf;
    };
}
//numberOfLines
-(void)setNumberOfLinesBlock:(wh_numberOfLines)numberOfLinesBlock{
    objc_setAssociatedObject(self, @selector(numberOfLinesBlock), numberOfLinesBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_numberOfLines)numberOfLinesBlock{
    wh_numberOfLines bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(NSInteger numberOfLines) {
        [weakSelf setNumberOfLines:numberOfLines];
        return weakSelf;
    };
}


//adjustsFontSizeToFitWidth
-(void)setAdjustsFontSizeToFitWidthBlock:(wh_adjustsFontSizeToFitWidth)adjustsFontSizeToFitWidthBlock{
    objc_setAssociatedObject(self, @selector(adjustsFontSizeToFitWidthBlock), adjustsFontSizeToFitWidthBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_adjustsFontSizeToFitWidth)adjustsFontSizeToFitWidthBlock{
    wh_adjustsFontSizeToFitWidth bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UILabel * _Nullable(BOOL adjustsFontSizeToFitWidth) {
        [weakSelf setAdjustsFontSizeToFitWidth:adjustsFontSizeToFitWidth];
        return weakSelf;
    };
}


@end
