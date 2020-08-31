#include "HAPRootListController.h"

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

-(void)openTwitterThomz:(id)sender {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://twitter.com/Thomzi07"]];
}

-(void)openDepiction:(id)sender {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://repo.packix.com/package/com.thomz.hapticbuttons/"]];
}

-(void)openGithub:(id)sender {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://github.com/Thomz07/hapticbuttons"]];
}

-(void)openTwitterLitten:(id)sender {
	[[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://twitter.com/Litteeen"]];
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
