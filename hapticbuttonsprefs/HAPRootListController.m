#include "HAPRootListController.h"

NSDictionary *prefs;
NSString *domain = @"/var/mobile/Library/Preferences/com.thomz.hapticbuttonsprefs.plist";

@implementation HAPRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[[UISwitch appearanceWhenContainedInInstancesOfClasses:@[self.class]] setOnTintColor:[UIColor colorWithRed: 0.85 green: 0.27 blue: 0.33 alpha: 1.00]];
	[[UISegmentedControl appearanceWhenContainedInInstancesOfClasses:@[self.class]] setTintColor:[UIColor colorWithRed: 0.85 green: 0.27 blue: 0.33 alpha: 1.00]];

}

-(void)viewDidLoad {
	[super viewDidLoad];
	UIBarButtonItem *applyButton = [[UIBarButtonItem alloc] initWithTitle:@"Respring" style:UIBarButtonItemStylePlain target:self action:@selector(respring:)];
    self.navigationItem.rightBarButtonItem = applyButton;

	prefs = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.thomz.hapticbuttonsprefs"];

	BOOL oneDotTwoMessageHasBeenShowed = [[prefs objectForKey:@"oneDotTwoMessageHasBeenShowed"] boolValue];

	if(!oneDotTwoMessageHasBeenShowed){
		UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Hey User"
							message:@"Sorry for the battery drain that Haptic Buttons used to cause. I fixed it in this version, I used to do a really stupid thing in my code that made the code check for preferences everytime you press a volume button :/ \nYou (sadly) now need to respring to apply your changes."
							preferredStyle:UIAlertControllerStyleAlert];

		UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel
		handler:^(UIAlertAction * action) {
			[self setObjectInPreset:@YES forKey:@"oneDotTwoMessageHasBeenShowed"];
		}];

		[alert addAction:defaultAction];
		[self presentViewController:alert animated:YES completion:nil];
	}
}

-(void)setObjectInPreset:(id)value forKey:(NSString *)key {
	[[NSUserDefaults standardUserDefaults] setObject:value forKey:key inDomain:domain]; //literally useless except to make the following method look neater
}

-(void)respring:(id)sender {

	UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Respring"
							message:@"Are you sure you want to Respring ?"
							preferredStyle:UIAlertControllerStyleActionSheet];

		UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel
		handler:^(UIAlertAction * action) {}];

		UIAlertAction* yes = [UIAlertAction actionWithTitle:@"Respring" style:UIAlertActionStyleDestructive
		handler:^(UIAlertAction * action) {
			NSTask *t = [[NSTask alloc] init];
			[t setLaunchPath:@"usr/bin/sbreload"];
			[t launch];
		}];

		[alert addAction:defaultAction];
		[alert addAction:yes];
		[self presentViewController:alert animated:YES completion:nil];
}

-(void)openTwitterThomz:(id)sender {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://twitter.com/Thomzi07"] options:@{} completionHandler:^(BOOL success){}];
}

-(void)openDepiction:(id)sender {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://repo.packix.com/package/com.thomz.hapticbuttons/"] options:@{} completionHandler:^(BOOL success){}];
}

-(void)openGithub:(id)sender {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://github.com/Thomz07/hapticbuttons"] options:@{} completionHandler:^(BOOL success){}];
}

-(void)openTwitterLitten:(id)sender {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://twitter.com/Litteeen"] options:@{} completionHandler:^(BOOL success){}];
}

@end

@implementation HapticButtonsHeaderCell 
// I originaly stole a cell from Dave so i'll just link his twitter here : https://twitter.com/DaveWijk

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(id)reuseIdentifier specifier:(id)specifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier specifier:specifier];

	if (self) {

	NSBundle *bundle = [[NSBundle alloc]initWithPath:@"/Library/PreferenceBundles/HapticButtonsPrefs.bundle"];
	UIImage *logo = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"iconFullSize" ofType:@"png"]];
	UIImageView *icon = [[UIImageView alloc]initWithImage:logo];
	icon.frame = CGRectMake(self.contentView.bounds.size.width-35,35,70,70);
	icon.layer.masksToBounds = YES;
	icon.layer.cornerRadius = 15;

	MPUMarqueeView *tweakLabelMarquee = [[MPUMarqueeView alloc] initWithFrame:CGRectMake(12.5,32.5,icon.frame.origin.x-25,50)];
	[tweakLabelMarquee setFadeEdgeInsets:UIEdgeInsetsMake(0,10,0,10)];
    
    UILabel *tweakLabel = [[UILabel alloc] init];
	[tweakLabel setTextAlignment:NSTextAlignmentLeft];
    [tweakLabel setFont:[UIFont systemFontOfSize:47.5 weight: UIFontWeightRegular]];
    tweakLabel.text = @"Haptic Buttons ";

	CGSize size = [tweakLabel sizeThatFits:CGSizeMake(tweakLabel.frame.size.width, FLT_MAX)];
	tweakLabelMarquee.contentSize = size;
	tweakLabel.frame = CGRectMake(0,0,size.width,50);

	[tweakLabelMarquee.contentView addSubview:tweakLabel];
	tweakLabelMarquee.marqueeEnabled = YES;
	tweakLabelMarquee.clipsToBounds = YES;
    
    UILabel *devLabel = [[UILabel alloc] initWithFrame:CGRectMake(25,70,self.contentView.bounds.size.width+30,50)];
	[devLabel setTextAlignment:NSTextAlignmentLeft];
    [devLabel setFont:[UIFont systemFontOfSize:22 weight: UIFontWeightMedium] ];
	devLabel.alpha = 0.8;
    devLabel.text = @"by Thomz";
    
    [self addSubview:tweakLabelMarquee];
    [self addSubview:devLabel];
	[self addSubview:icon];

    }
    	return self;

}

- (instancetype)initWithSpecifier:(PSSpecifier *)specifier {
	return [self initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HapticButtonsHeaderCell" specifier:specifier];
}

- (void)setFrame:(CGRect)frame {
	frame.origin.x = 0;
	[super setFrame:frame];
}

- (CGFloat)preferredHeightForWidth:(CGFloat)arg1{
    return 140.0f;
}

@end
