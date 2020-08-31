#import <AudioToolbox/AudioServices.h>

@interface SBVolumeControl : NSObject
- (float)_effectiveVolume;
@property (nonatomic, retain) UIImpactFeedbackGenerator *gen;
@end

BOOL enabled;
BOOL biggerVibration;
int tapticStrength;
BOOL legacyVibrationEnabled;
BOOL oneDotTwoMessageHasBeenShowed;

#define kIdentifier @"com.thomz.hapticbuttonsprefs"
#define kSettingsChangedNotification (CFStringRef)@"com.thomz.hapticbuttonsprefs/reload"
#define kSettingsPath @"/var/mobile/Library/Preferences/com.thomz.hapticbuttonsprefs.plist"

NSDictionary *prefs;

void AudioServicesPlaySystemSoundWithVibration(UInt32 inSystemSoundID,id arg,NSDictionary* vibratePattern);

void vibrate(float durationInSeconds, float intensivity, long count) {

    NSMutableDictionary* dict = [NSMutableDictionary dictionary];
    NSMutableArray* arr = [NSMutableArray array];
    for (long i = count; i--;) {
        [arr addObject:[NSNumber numberWithBool:YES]]; //vibrate
        [arr addObject:[NSNumber numberWithInt:durationInSeconds*1000]];

        [arr addObject:[NSNumber numberWithBool:NO]];  //stop
        [arr addObject:[NSNumber numberWithInt:durationInSeconds*1000]];
    }

    [dict setObject:arr forKey:@"VibePattern"];
    [dict setObject:[NSNumber numberWithFloat:intensivity] forKey:@"Intensity"];

    AudioServicesPlaySystemSoundWithVibration(4095,nil,dict);

}

static void reloadPrefs() {
    if ([NSHomeDirectory() isEqualToString:@"/var/mobile"]) {
        CFArrayRef keyList = CFPreferencesCopyKeyList((CFStringRef)kIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost);

        if (keyList) {
            prefs = (NSDictionary *)CFBridgingRelease(CFPreferencesCopyMultiple(keyList, (CFStringRef)kIdentifier, kCFPreferencesCurrentUser, kCFPreferencesAnyHost));

            if (!prefs) {
                prefs = [NSDictionary new];
            }
            CFRelease(keyList);
        }
    } else {
        prefs = [NSDictionary dictionaryWithContentsOfFile:kSettingsPath];
    }
}

static BOOL boolValueForKey(NSString *key, BOOL defaultValue) {
    return (prefs && [prefs objectForKey:key] ? [[prefs objectForKey:key] boolValue] : defaultValue);
}


/*static double numberForValue(NSString *key, double defaultValue) {
	return (prefs && [prefs objectForKey:key] ? [[prefs objectForKey:key] doubleValue] : defaultValue);
}*/

static void preferencesChanged() {
    reloadPrefs();

    enabled = boolValueForKey(@"enabled", YES);
    biggerVibration = boolValueForKey(@"biggerVibration", YES);
    tapticStrength = [([prefs objectForKey:@"tapticStrength"] ?: @(0)) intValue];
    legacyVibrationEnabled = boolValueForKey(@"legacyVibrationEnabled", NO);
    oneDotTwoMessageHasBeenShowed = boolValueForKey(@"oneDotTwoMessageHasBeenShowed", NO);
}