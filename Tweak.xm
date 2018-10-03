static BOOL kEnable = YES;
static BOOL kAppBundleID = NO;

/*
Dear Developers, I want to put bundle IDs in plist file in the 'kAppBundleID'.
And, want to use it in line:25, 26.

If it has one Bundle IDs, @"kAppBundleID" like this and If it has multiple Bundle IDs,
@"kAppBundleID",
@"kAppBundleID",
@"kAppBundleID"
like this. I'm new to AppList and can you guys help me?
*/


/*
@interface SBApplicationIcon
- (NSString *)applicationBundleID;
@end

%hook SBIconModel
- (BOOL)isIconVisible:(SBApplicationIcon *)icon {
  if(kEnable) {
    NSArray<NSString *> *hide = @[
        @"kAppBundleID",
        @"kAppBundleID"
    ];

    if ([hide containsObject:icon.applicationBundleID]) {
        return NO;
    }

    return %orig;
  }
  return %orig;
}
%end
*/
static void loadPrefs()
{
    NSMutableDictionary *prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.peterdev.hiddy.plist"];
    if(prefs)
    {
        kEnable = ( [prefs objectForKey:@"kEnable"] ? [[prefs objectForKey:@"kEnable"] boolValue] : kEnable );
    }
    [prefs release];

    NSMutableDictionary *prefsapplist = [[NSMutableDictionary alloc] initWithContentsOfFile:@"/var/mobile/Library/Preferences/com.peterdev.hiddy.applist.plist"];
    if(prefsapplist)
    {
        kAppBundleID = ( [prefsapplist objectForKey:@"kAppBundleID"] ? [[prefsapplist objectForKey:@"kAppBundleID"] boolValue] : kAppBundleID );
    }
    [prefsapplist release];

}

%ctor
{
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.peterdev.hiddy/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)loadPrefs, CFSTR("com.peterdev.hiddy.applist/settingschanged"), NULL, CFNotificationSuspensionBehaviorCoalesce);
    loadPrefs();
}
