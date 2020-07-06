#include "Tweak.h"

%group tweak
%hook SBVolumeControl

- (void)increaseVolume {

	%orig;
	preferencesChanged();
	if(enabled){
		if(self._effectiveVolume == 1 && biggerVibration){
			AudioServicesPlaySystemSound(1521);
		} else if(!legacyVibrationEnabled){
			if(tapticStrength == 0){
				AudioServicesPlaySystemSound(1519);
			} else if(tapticStrength == 1){
				AudioServicesPlaySystemSound(1520);
			} else if(tapticStrength == 2){
				AudioServicesPlaySystemSound(1521);
			} else {
				AudioServicesPlaySystemSound(1519);
			}
		} else {
			vibrate(0.025, 0.05, 1);
		}
	}
}

- (void)decreaseVolume {

	%orig;
	preferencesChanged();
	if(enabled){
		if(self._effectiveVolume == 0 && biggerVibration){
			AudioServicesPlaySystemSound(1521);
		} else if(!legacyVibrationEnabled){
			if(tapticStrength == 0){
				AudioServicesPlaySystemSound(1519);
			} else if(tapticStrength == 1){
				AudioServicesPlaySystemSound(1520);
			} else if(tapticStrength == 2){
				AudioServicesPlaySystemSound(1521);
			} else {
				AudioServicesPlaySystemSound(1519);
			}
		} else {
			vibrate(0.025, 0.05, 1);
		}
	}
}

%end
%end

%ctor {
	preferencesChanged();
	%init(tweak);
}