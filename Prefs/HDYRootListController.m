#include "HDYRootListController.h"
#import "SparkAppListTableViewController.h"

@implementation HDYRootListController
- (instancetype)init {
	self = [super init];

	if (self) {
			HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
			appearanceSettings.tableViewCellSeparatorColor = [UIColor colorWithWhite:0 alpha:0];
			self.hb_appearanceSettings = appearanceSettings;
	}

	return self;
}

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [[self loadSpecifiersFromPlistName:@"Root" target:self] retain];
	}

	return _specifiers;
}

-(void)selectHideApps
{
    SparkAppListTableViewController* s = [[SparkAppListTableViewController alloc] initWithIdentifier:@"com.peterdev.hiddy" andKey:@"hide"];

    [self.navigationController pushViewController:s animated:YES];
    self.navigationItem.hidesBackButton = FALSE;
}

@end
