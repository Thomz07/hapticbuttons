#include "Tweak.h"

%group tweak
%hook SBVolumeControl

- (void)increaseVolume {

	%orig;
	preferencesChanged();
	UIImpactFeedbackGenerator *gen = [[UIImpactFeedbackGenerator alloc] init];
	[gen prepare];

	if(enabled){
		if(self._effectiveVolume == 1 && biggerVibration){
			gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
			[gen impactOccurred];
		} else if(!legacyVibrationEnabled){
			if (tapticStrength == 0)
				gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft];
			else if (tapticStrength == 1)
				gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
			else if (tapticStrength == 2)
				gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
			else if (tapticStrength == 3)
				gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
			else if (tapticStrength == 4)
				gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];

			[gen impactOccurred];
		} else {
			vibrate(0.025, 0.05, 1);
		}
	}
}

- (void)decreaseVolume {

	%orig;
	preferencesChanged();
	UIImpactFeedbackGenerator *gen = [[UIImpactFeedbackGenerator alloc] init];
	[gen prepare];

	if(enabled){
		if(self._effectiveVolume == 1 && biggerVibration){
			gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
			[gen impactOccurred];
		} else if(!legacyVibrationEnabled){
			if (tapticStrength == 0)
				gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft];
			else if (tapticStrength == 1)
				gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
			else if (tapticStrength == 2)
				gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
			else if (tapticStrength == 3)
				gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
			else if (tapticStrength == 4)
				gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];

			[gen impactOccurred];
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