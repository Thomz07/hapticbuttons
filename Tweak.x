#import <AudioToolbox/AudioServices.h>

@interface SBVolumeControl : NSObject
- (float)_effectiveVolume;
@end

%group tweak
%hook SBVolumeControl

- (void)increaseVolume {

	%orig;
	if(self._effectiveVolume == 1){
		AudioServicesPlaySystemSound(1521);
	} else {
		AudioServicesPlaySystemSound(1519);
	}
}

- (void)decreaseVolume {

	%orig;
	if(self._effectiveVolume == 0){
		AudioServicesPlaySystemSound(1521);
	} else {
		AudioServicesPlaySystemSound(1519);
	}
}

%end
%end

%ctor {
	%init(tweak);
}