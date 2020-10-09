//
//  UIButton+block.m
//
//  Created by 胡伟伟 on 2020/10/9.
//

#import "UIButton+block.h"
#import <objc/runtime.h>

@implementation UIButton (block)

//默认状态title
-(void)setNormalTitleBlock:(wh_normalTitle)normalTitleBlock{
    objc_setAssociatedObject(self, @selector(normalTitleBlock), normalTitleBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_normalTitle)normalTitleBlock{
    wh_normalTitle bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(NSString *text) {
        [weakSelf setTitle:text forState:UIControlStateNormal];
        return weakSelf;
    };
}
//Highlightedtitle
-(void)setHighlightedTitleBlock:(wh_HighlightedTitle)highlightedTitleBlock{
    objc_setAssociatedObject(self, @selector(highlightedTitleBlock), highlightedTitleBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_HighlightedTitle)highlightedTitleBlock{
    wh_HighlightedTitle bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(NSString *text) {
        [weakSelf setTitle:text forState:UIControlStateHighlighted];
        return weakSelf;
    };
}
//Disabledtitle
-(void)setDisabledTitleBlock:(wh_disabledTitle)disabledTitleBlock{
    objc_setAssociatedObject(self, @selector(disabledTitleBlock), disabledTitleBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_disabledTitle)disabledTitleBlock{
    wh_disabledTitle bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(NSString *text) {
        [weakSelf setTitle:text forState:UIControlStateDisabled];
        return weakSelf;
    };
}

//Selected title
-(void)setSelectedTitleBlock:(wh_selectedTitle)selectedTitleBlock{
    objc_setAssociatedObject(self, @selector(selectedTitleBlock), selectedTitleBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_selectedTitle)selectedTitleBlock{
    wh_selectedTitle bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(NSString *text) {
        [weakSelf setTitle:text forState:UIControlStateSelected];
        return weakSelf;
    };
}


//默认状态Attributedtitle
-(void)setNormalAttributedTitleBlock:(wh_normalAttributedTitle)normalAttributedTitleBlock{
    objc_setAssociatedObject(self, @selector(normalAttributedTitleBlock), normalAttributedTitleBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_normalAttributedTitle)normalAttributedTitleBlock{
    wh_normalAttributedTitle bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(NSAttributedString *attributedTitle) {
        [weakSelf setAttributedTitle:attributedTitle forState:UIControlStateNormal];
        return weakSelf;
    };
}


//Highlightedtitle
-(void)setHighlightedAttributedTitleBlock:(wh_highlightedAttributedTitle)highlightedAttributedTitleBlock{
    objc_setAssociatedObject(self, @selector(highlightedAttributedTitleBlock), highlightedAttributedTitleBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_highlightedAttributedTitle)highlightedAttributedTitleBlock{
    wh_highlightedAttributedTitle bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(NSAttributedString *attributedTitle) {
        [weakSelf setAttributedTitle:attributedTitle forState:UIControlStateHighlighted];
        return weakSelf;
    };
}


//Disabledtitle
-(void)setDisabledAttributedTitleBlock:(wh_disabledAttributedTitle)disabledAttributedTitleBlock{
    objc_setAssociatedObject(self, @selector(disabledAttributedTitleBlock), disabledAttributedTitleBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_disabledAttributedTitle)disabledAttributedTitleBlock{
    wh_disabledAttributedTitle bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(NSAttributedString *attributedTitle) {
        [weakSelf setAttributedTitle:attributedTitle forState:UIControlStateDisabled];
        return weakSelf;
    };
}

//Selected title
-(void)setSelectedAttributedTitleBlock:(wh_selectedAttributedTitle)selectedAttributedTitleBlock{
    objc_setAssociatedObject(self, @selector(selectedAttributedTitleBlock), selectedAttributedTitleBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_selectedAttributedTitle)selectedAttributedTitleBlock{
    wh_selectedAttributedTitle bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(NSAttributedString *attributedTitle) {
        [weakSelf setAttributedTitle:attributedTitle forState:UIControlStateSelected];
        return weakSelf;
    };
}


//默认状态titleColor
-(void)setNormalTitleColorBlock:(wh_normalTitleColor)normalTitleColorBlock{
    objc_setAssociatedObject(self, @selector(normalTitleColorBlock), normalTitleColorBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_normalTitleColor)normalTitleColorBlock{
    wh_normalTitleColor bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(UIColor *color) {
        [weakSelf setTitleColor:color forState:UIControlStateNormal];
        return weakSelf;
    };
}

//HighlightedtitleColor
-(void)setHighlightedTitleColorBlock:(wh_highlightedTitleColor)highlightedTitleColorBlock{
    objc_setAssociatedObject(self, @selector(highlightedTitleColorBlock), highlightedTitleColorBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_highlightedTitleColor)highlightedTitleColorBlock{
    wh_highlightedTitleColor bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(UIColor *color) {
        [weakSelf setTitleColor:color forState:UIControlStateHighlighted];
        return weakSelf;
    };
}


//DisabledtitleColor
-(void)setDisabledTitleColorBlock:(wh_disabledTitleColor)disabledTitleColorBlock{
    objc_setAssociatedObject(self, @selector(disabledTitleColorBlock), disabledTitleColorBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_disabledTitleColor)disabledTitleColorBlock{
    wh_disabledTitleColor bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(UIColor *color) {
        [weakSelf setTitleColor:color forState:UIControlStateDisabled];
        return weakSelf;
    };
}


//Selected titleColor

-(void)setSelectedTitleColorBlock:(wh_selectedTitleColor)selectedTitleColorBlock{
    objc_setAssociatedObject(self, @selector(selectedTitleColorBlock), selectedTitleColorBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_selectedTitleColor)selectedTitleColorBlock{
    wh_selectedTitleColor bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(UIColor *color) {
        [weakSelf setTitleColor:color forState:UIControlStateSelected];
        return weakSelf;
    };
}

//默认状态Image
-(void)setNormalImageBlock:(wh_normalImage)normalImageBlock{
    objc_setAssociatedObject(self, @selector(normalImageBlock), normalImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_normalImage)normalImageBlock{
    wh_normalImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(UIImage *image) {
        [weakSelf setImage:image forState:UIControlStateNormal];
        return weakSelf;
    };
}
//HighlightedImage
-(void)setHighlightedImageBlock:(wh_highlightedImage)highlightedImageBlock{
    objc_setAssociatedObject(self, @selector(highlightedImageBlock), highlightedImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_highlightedImage)highlightedImageBlock{
    wh_highlightedImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(UIImage *image) {
        [weakSelf setImage:image forState:UIControlStateHighlighted];
        return weakSelf;
    };
}

//DisabledImage
-(void)setDisabledImageBlock:(wh_disabledImage)disabledImageBlock{
    objc_setAssociatedObject(self, @selector(disabledImageBlock), disabledImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_disabledImage)disabledImageBlock{
    wh_disabledImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(UIImage *image) {
        [weakSelf setImage:image forState:UIControlStateDisabled];
        return weakSelf;
    };
}
//SelectedImage
-(void)setSelectedImageBlock:(wh_selectedImage)selectedImageBlock{
    objc_setAssociatedObject(self, @selector(selectedImageBlock), selectedImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_selectedImage)selectedImageBlock{
    wh_selectedImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(UIImage *image) {
        [weakSelf setImage:image forState:UIControlStateSelected];
        return weakSelf;
    };
}


//默认状态bacggroundImage
-(void)setNormalBackgroundImageBlock:(wh_normalBackgroundImage)normalBackgroundImageBlock{
    objc_setAssociatedObject(self, @selector(normalBackgroundImageBlock), normalBackgroundImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_normalBackgroundImage)normalBackgroundImageBlock{
    wh_normalBackgroundImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(UIImage *image) {
        [weakSelf setBackgroundImage:image forState:UIControlStateNormal];
        return weakSelf;
    };
}

//HighlightedbacggroundImage
-(void)setHighlightedBackgroundImageBlock:(wh_highlightedBackgroundImage)highlightedBackgroundImageBlock{
    objc_setAssociatedObject(self, @selector(highlightedBackgroundImageBlock), highlightedBackgroundImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_highlightedBackgroundImage)highlightedBackgroundImageBlock{
    wh_highlightedBackgroundImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(UIImage *image) {
        [weakSelf setBackgroundImage:image forState:UIControlStateHighlighted];
        return weakSelf;
    };
}

//DisabledbacggroundImage
-(void)setDisabledBackgroundImageBlock:(wh_disabledBackgroundImage)disabledBackgroundImageBlock{
    objc_setAssociatedObject(self, @selector(disabledBackgroundImageBlock), disabledBackgroundImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_disabledBackgroundImage)disabledBackgroundImageBlock{
    wh_disabledBackgroundImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(UIImage *image) {
        [weakSelf setBackgroundImage:image forState:UIControlStateDisabled];
        return weakSelf;
    };
}

//SelectedbacggroundImage
-(void)setSelectedBackgroundImageBlock:(wh_selectedBackgroundImage)selectedBackgroundImageBlock{
    objc_setAssociatedObject(self, @selector(selectedBackgroundImageBlock), selectedBackgroundImageBlock, OBJC_ASSOCIATION_COPY);
}
-(wh_selectedBackgroundImage)selectedBackgroundImageBlock{
    wh_selectedBackgroundImage bl = objc_getAssociatedObject(self, _cmd);
    __weak typeof(self)weakSelf = self;
    return bl ? bl: ^UIButton * _Nullable(UIImage *image) {
        [weakSelf setBackgroundImage:image forState:UIControlStateSelected];
        return weakSelf;
    };
}

@end
