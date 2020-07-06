#import <AudioToolbox/AudioServices.h>

@interface SBVolumeControl : NSObject
- (float)_effectiveVolume;
@end

BOOL enabled;
BOOL biggerVibration;
int tapticStrength;

#define kIdentifier @"com.thomz.hapticbuttonsprefs"
#define kSettingsChangedNotification (CFStringRef)@"com.thomz.hapticbuttonsprefs/reload"
#define kSettingsPath @"/var/mobile/Library/Preferences/com.thomz.hapticbuttonsprefs.plist"

NSDictionary *prefs;

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
}