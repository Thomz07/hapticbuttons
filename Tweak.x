#include "Tweak.h"

%group tweak
%hook SBVolumeControl
%property (nonatomic, retain) UIImpactFeedbackGenerator *gen;

- (void)increaseVolume {

	%orig;
	if(self.gen){
		self.gen = [[UIImpactFeedbackGenerator alloc] init]; // prevent gen to be allocated every time you press a button
	}
	[self.gen prepare];

	if(enabled && !legacyVibrationEnabled){
		if(self._effectiveVolume == 1 && biggerVibration){
			self.gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];
		} else {
			if (tapticStrength == 0)
				self.gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft];
			else if (tapticStrength == 1)
				self.gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
			else if (tapticStrength == 2)
				self.gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
			else if (tapticStrength == 3)
				self.gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
			else if (tapticStrength == 4)
				self.gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];
		}	
		[self.gen impactOccurred];
	} else {
		vibrate(0.025, 0.05, 1);
	}
}

- (void)decreaseVolume {

	%orig;
	if(self.gen){
		self.gen = [[UIImpactFeedbackGenerator alloc] init]; // prevent gen to be allocated every time you press a button
	}
	[self.gen prepare];

	if(enabled && !legacyVibrationEnabled){
		if(self._effectiveVolume == 0 && biggerVibration){
			self.gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];
		} else {
			if (tapticStrength == 0)
				self.gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleSoft];
			else if (tapticStrength == 1)
				self.gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleLight];
			else if (tapticStrength == 2)
				self.gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleMedium];
			else if (tapticStrength == 3)
				self.gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleHeavy];
			else if (tapticStrength == 4)
				self.gen = [[UIImpactFeedbackGenerator alloc] initWithStyle:UIImpactFeedbackStyleRigid];
		}	
		[self.gen impactOccurred];
	} else {
		vibrate(0.025, 0.05, 1);
	}
}

%end
%end

%ctor {
	preferencesChanged();
	%init(tweak);
}