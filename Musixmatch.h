@interface MXMObject : NSObject

@property NSDictionary* properties;
@property NSString* creationDate;
@property NSString* updatedTime;
@property NSString* lastModified;
@property NSString* raw;

@end

@implementation MXMObject
@end

@interface MXMProductFeatures : NSObject

@property BOOL noADS;
@property BOOL lyricsOffline;
@property BOOL partyMode;
@property BOOL payWall;
@property BOOL freeTrial;
@property BOOL covid19;

@end

@implementation MXMProductFeatures
@end

@interface MXMProduct : NSObject

@property NSString* startDate;
@property NSString* endDate;
@property NSString* productId;
@property NSString* productType;
@property MXMProductFeatures* features;

@end

@implementation MXMProduct
@end