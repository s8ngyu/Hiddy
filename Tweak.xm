#import "SparkAppList.h"


@interface SBApplicationIcon
- (NSString *)applicationBundleID;
@end


%hook SBIconModel
- (BOOL)isIconVisible:(SBApplicationIcon *)icon {
  NSString* bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier]; // This is dependent on where it is called, may not be the correct method for your tweak!

  if([SparkAppList doesIdentifier:@"com.peterdev.hiddy" andKey:@"hide" containBundleIdentifier:bundleIdentifier]) // This returns TRUE if the bundle identifer exists
  {
      // The bundle identifier is 'on' in the list. Do whatever.
      // In the case of Notchless, this is an 'exclude' list - so I would prevent this hook from continuing and just return orig.
      NSArray<NSString *> *hide = @[bundleIdentifier];

      if ([hide containsObject:icon.applicationBundleID]) {
          return NO;
      }
  }
    return %orig;
}
%end
