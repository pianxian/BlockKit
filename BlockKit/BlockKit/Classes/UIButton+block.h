//
//  UIButton+block.h
//  分类测试
//
//  Created by 胡伟伟 on 2020/10/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//默认状态title
typedef UIButton *_Nullable(^wh_normalTitle)(NSString *text);
//Highlightedtitle
typedef UIButton *_Nullable(^wh_HighlightedTitle)(NSString *text);
//Disabledtitle
typedef UIButton *_Nullable(^wh_disabledTitle)(NSString *text);
//Selected title
typedef UIButton *_Nullable(^wh_selectedTitle)(NSString *text);


//默认状态Attributedtitle
typedef UIButton *_Nullable(^wh_normalAttributedTitle)(NSAttributedString *attributedTitle);
//Highlightedtitle
typedef UIButton *_Nullable(^wh_highlightedAttributedTitle)(NSAttributedString *attributedTitle);
//Disabledtitle
typedef UIButton *_Nullable(^wh_disabledAttributedTitle)(NSAttributedString *attributedTitle);
//Selected title
typedef UIButton *_Nullable(^wh_selectedAttributedTitle)(NSAttributedString *attributedTitle);


//默认状态titleColor
typedef UIButton *_Nullable(^wh_normalTitleColor)(UIColor *color);
//HighlightedtitleColor
typedef UIButton *_Nullable(^wh_highlightedTitleColor)(UIColor *text);
//DisabledtitleColor
typedef UIButton *_Nullable(^wh_disabledTitleColor)(UIColor *text);
//Selected titleColor
typedef UIButton *_Nullable(^wh_selectedTitleColor)(UIColor *text);



//默认状态Image
typedef UIButton *_Nullable(^wh_normalImage)(UIImage *image);
//HighlightedImage
typedef UIButton *_Nullable(^wh_highlightedImage)(UIImage *image);
//DisabledImage
typedef UIButton *_Nullable(^wh_disabledImage)(UIImage *image);
//SelectedImage
typedef UIButton *_Nullable(^wh_selectedImage)(UIImage *image);


//默认状态bacggroundImage
typedef UIButton *_Nullable(^wh_normalBackgroundImage)(UIImage *image);
//HighlightedbacggroundImage
typedef UIButton *_Nullable(^wh_highlightedBackgroundImage)(UIImage *image);
//DisabledbacggroundImage
typedef UIButton *_Nullable(^wh_disabledBackgroundImage)(UIImage *image);
//SelectedbacggroundImage
typedef UIButton *_Nullable(^wh_selectedBackgroundImage)(UIImage *image);


@interface UIButton (block)

//默认状态title
@property (nonatomic,copy) wh_normalTitle normalTitleBlock;
//Highlightedtitle
@property (nonatomic,copy) wh_HighlightedTitle highlightedTitleBlock;
//Disabledtitle
@property (nonatomic,copy) wh_disabledTitle disabledTitleBlock;
//Selected title
@property (nonatomic,copy) wh_selectedTitle selectedTitleBlock;

//默认状态Attributedtitle
@property (nonatomic,copy) wh_normalAttributedTitle normalAttributedTitleBlock;

//Highlightedtitle
@property (nonatomic,copy) wh_highlightedAttributedTitle highlightedAttributedTitleBlock;
//Disabledtitle
@property (nonatomic,copy) wh_disabledAttributedTitle disabledAttributedTitleBlock;
//Selected title
@property (nonatomic,copy) wh_selectedAttributedTitle selectedAttributedTitleBlock;

//默认状态titleColor
@property (nonatomic,copy) wh_normalTitleColor normalTitleColorBlock;
//HighlightedtitleColor
@property (nonatomic,copy) wh_highlightedTitleColor highlightedTitleColorBlock;

//DisabledtitleColor
@property (nonatomic,copy) wh_disabledTitleColor disabledTitleColorBlock;

//Selected titleColor
@property (nonatomic,copy) wh_selectedTitleColor selectedTitleColorBlock;


//默认状态Image
@property (nonatomic,copy) wh_normalImage normalImageBlock;
//HighlightedImage
@property (nonatomic,copy) wh_highlightedImage highlightedImageBlock;
//DisabledImage
@property (nonatomic,copy) wh_disabledImage disabledImageBlock;
//SelectedImage
@property (nonatomic,copy) wh_selectedImage selectedImageBlock;


//默认状态bacggroundImage
@property (nonatomic,copy) wh_normalBackgroundImage normalBackgroundImageBlock;

//HighlightedbacggroundImage
@property (nonatomic,copy) wh_highlightedBackgroundImage highlightedBackgroundImageBlock;
//DisabledbacggroundImage
@property (nonatomic,copy) wh_disabledBackgroundImage disabledBackgroundImageBlock;
//SelectedbacggroundImage
@property (nonatomic,copy) wh_selectedBackgroundImage selectedBackgroundImageBlock;

@end

NS_ASSUME_NONNULL_END
