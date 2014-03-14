//
//  ScreensViewController.m
//  Plaster
//
//  Created by Mushegh on 3/13/14.
//  Copyright (c) 2014 Mushegh. All rights reserved.
//

#import "DataManager.h"
#import "ScreensViewController.h"
#import "ScreenViewController.h"
#import "TestDataCreator.h"
#import "ScreensContainer.h"
#import "ScreenCell.h"

#define SCREENS_ITEMS_SECTION 0
#define SCREENS_ADD_SECTION 1

@interface ScreensViewController () <ScreensContainerDelegate> {
	Screen* _selectedScreen;
}

@property (weak, nonatomic) IBOutlet UITableView *screensTbView;

@end

@implementation ScreensViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	_screensTbView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    DataManager* dm = [DataManager getInstance];
	dm.screensContainer.delegate = self;
}

-(void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[_screensTbView reloadData];
}

#pragma mark - UITableView Data Source methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSInteger count = 1;
    DataManager* dm = [DataManager getInstance];
	if ([self isScreenSectionShown:section]) {
		count = dm.screensContainer.screens.count;
	}
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"ScreenCell";
	
    ScreenCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
	Screen* screen = nil;
    DataManager* dm = [DataManager getInstance];
	if ([self isScreenSectionShown:indexPath.section]) {
		screen = [dm.screensContainer.screens objectAtIndex:indexPath.row];
		[cell updateWithScreen:screen];
	} else if (SCREENS_ADD_SECTION == indexPath.section) {
		[cell.screenImageView setImage:[UIImage imageNamed:@"addScreen"]];
		[cell.screenNameLabel setText:@"Add a new screen"];
	}
	
    return cell;
}

#pragma mark - UITableView Delegate method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	_selectedScreen = nil;
    DataManager* dm = [DataManager getInstance];
	if ([self isScreenSectionShown:indexPath.section]) {
		_selectedScreen = [dm.screensContainer.screens objectAtIndex:indexPath.row];
	}
	[_screensTbView deselectRowAtIndexPath:indexPath animated:YES];
	[self performSegueWithIdentifier:@"ScreenSegue" sender:nil];
}

#pragma mark - Passing screen information to ScreenViewController

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"ScreenSegue"]) {
		ScreenViewController* screenViewController = segue.destinationViewController;
		screenViewController.screen = _selectedScreen;
	}
	_selectedScreen = nil;
}

#pragma mark - Private API 

-(BOOL) isScreenSectionShown:(NSInteger) section {
	return (SCREENS_ITEMS_SECTION == section);
}

#pragma mark - ScreensContainer Delegate method

-(void) screensContainerUpdated:(ScreensContainer*) screensContainer {
    [_screensTbView reloadData];
}

@end
