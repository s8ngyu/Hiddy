#import "SparkAppList.h"


@interface SBApplicationIcon
- (NSString *)applicationBundleID;
@end


%hook SBIconModel
- (BOOL)isIconVisible:(SBApplicationIcon *)icon {
  NSString* bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier];

  if([SparkAppList doesIdentifier:@"com.peterdev.hiddy.plist" andKey:@"kEnabe" containBundleIdentifier:bundleIdentifier])
      NSArray<NSString *> *hide = @[bundleIdentifier];

      if ([hide containsObject:icon.applicationBundleID]) {
          return NO;
      }
  }

%end
