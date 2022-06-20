#import <Foundation/NSString.h>
#import <Foundation/NSUUID.h>
#import "Musixmatch.h"

NSString* uuid;

%hook MXMDevice
// randomize uuid
- (void)setGuid:(id)guid {
	if (!uuid)
		uuid = [[NSUUID UUID] UUIDString];
  	
	%orig(uuid);
}
- (id)guid {
	return uuid;
}
%end
%hook MXMCrowdUser
// better google community pfp resolution
- (id)profilePhoto {
	return [%orig stringByReplacingOccurrencesOfString:@"=s50" withString:@""];;
}
%end
%hook MXMUserProfile
// better user pfp resolution
- (id)picture {
	return [%orig stringByReplacingOccurrencesOfString:@"=s50" withString:@""];;
}
%end

%hook MXMConfig
// prem attempt 1
- (NSArray*)activeProducts {
	MXMProduct* subscription = [[MXMProduct alloc] init];
	subscription.startDate = @"1970-01-01T00:00:00.000Z";
	subscription.endDate = @"2048-01-01T21:00:00.000Z";
	subscription.productId = @"io.eimaen.nicesub";
	subscription.productType = @"subscription";

	MXMProductFeatures* features = [[MXMProductFeatures alloc] init];
	features.noADS = true;
	features.lyricsOffline = true;
	features.partyMode = true;
	features.payWall = false;
	features.covid19 = true;
	features.freeTrial = false;

	subscription.features = features;
	return (NSArray*) @[subscription];
}
%end

%hook MXMConfigManager
// cool stuff ahead
- (BOOL)canShowAppDebugSettingsEnabledFromAPI {
	return TRUE;
}
- (BOOL)mustEnabledBrandNewLayout {
	return TRUE;
}
- (BOOL)isSearchAsYouTubeEnabledFromAPI {
	return TRUE;
}
- (BOOL)isLyricsLetterByLetterEnabledFromAPI {
	return TRUE;
}
- (BOOL)canShowCreditsEnabledFromAPI {
	return TRUE;
}
- (BOOL)isLyricsViewDebugEnabledFromAPI {
	return TRUE;
}
%end

%hook MXMRequest
// disable caching
- (BOOL)useCache {
	return FALSE;
}
// disable caching
- (BOOL)usePersistentCache {
	return FALSE;
}
%end