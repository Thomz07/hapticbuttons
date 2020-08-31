#import <Preferences/PSListController.h>
#import <Preferences/PSTableCell.h>
#import <Preferences/PSSpecifier.h>
#import <Preferences/PSListItemsController.h>

@interface HAPRootListController : PSListController
-(void)setObjectInPreset:(id)value forKey:(NSString *)key;
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
-(void)setFadeEdgeInsets:(UIEdgeInsets)arg1;
@end

@interface _MPUMarqueeContentView : UIView
@end

@interface NSTask : NSObject
@property(copy) NSArray *arguments;
@property(copy) NSString *launchPath;
- (id)init;
- (void)waitUntilExit;
- (void)launch;
@end

@interface NSUserDefaults (Multipla)
-(id)objectForKey:(NSString *)key inDomain:(NSString *)domain;
-(void)setObject:(id)value forKey:(NSString *)key inDomain:(NSString *)domain;
@end
