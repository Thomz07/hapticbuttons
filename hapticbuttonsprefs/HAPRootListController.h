#import <Preferences/PSListController.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListItemsController.h>

@interface HAPRootListController : PSListController
@end

@interface HapticButtonsHeaderCell : PSTableCell 
@end

@protocol PreferencesTableCustomView
- (id)initWithSpecifier:(id)arg1;
@end

@interface MPUMarqueeView : UIView
@property (nonatomic, assign) CGFloat marqueeDelay;
@property (nonatomic, assign) BOOL marqueeEnabled;
@property (nonatomic, assign) CGFloat contentGap;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, assign) CGSize contentSize;
@end

@interface _MPUMarqueeContentView : UIView
@end
