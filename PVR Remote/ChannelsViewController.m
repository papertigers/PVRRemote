//
//  SecondViewController.m
//  PVR Remote
//
//  Created by Michael Zeller on 8/4/13.
//  Copyright (c) 2013 Lights and Shapes. All rights reserved.
//

#import "ChannelsViewController.h"
#import "ECSlidingViewController.h"
#import "LeftMenuViewController.h"
#import "XBMCAPIClient.h"

@interface ChannelsViewController ()

@end

@implementation ChannelsViewController 

@synthesize menuButton = _menuButton;
@synthesize client = _client;
@synthesize channelsTable = _channelsTable;
@synthesize searchBar = _searchBar;
@synthesize channels = _channels;
@synthesize filteredChannels = _filteredChannels;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //setup client
    self.client = [XBMCAPIClient sharedXBMCAPIClient];
    
    //Setup LeftMenu
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[LeftMenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    //self.channels = [NSArray arrayWithObjects:@"One", @"Two", @"Three", nil];
    
    [self.client invokeMethod:@"PVR.GetChannels" withParameters:@{@"channelgroupid": @"alltv", @"properties": [NSArray arrayWithObjects:@"channel",nil]}
     
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     BOOL isValid = [NSJSONSerialization isValidJSONObject:responseObject];
                     if (isValid){
                         NSLog(@"Its Valid");
                         NSArray *channels = [responseObject objectForKey:@"channels"];
                         self.channels = channels;
                     }
                     
                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     NSLog(@"%@", error);
                 }];

}

-(void)setChannels:(NSArray *)channels
{
    if(_channels != channels) {
        _channels = channels;
        [self.channelsTable reloadData];
    }
}

//- (IBAction)sciencehdChannel:(id)sender {
//    NSInteger channelid = 323;
//    [self.client invokeMethod:@"Player.Open" withParameters:@{@"item": @{@"channelid": @(channelid)}}
//     
//                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                     //code
//                     NSLog(@"%@", responseObject);
//                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                     //code
//                     NSLog(@"The error: %@", error);
//                 }];
//
//}
//- (IBAction)discoveryhdChannel:(id)sender {
//    NSInteger channelid = 321;
//    [self.client invokeMethod:@"Player.Open" withParameters:@{@"item": @{@"channelid": @(channelid)}}
//     
//                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                     //code
//                     NSLog(@"%@", responseObject);
//                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//                     //code
//                     NSLog(@"The error: %@", error);
//                 }];
//    
//}

-(IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

    

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchThroughData
{
    self.filteredChannels = nil;
    
    NSPredicate *filteredPredicate = [NSPredicate predicateWithFormat:@"SELF.label contains [search] %@", self.searchBar.text];
    self.filteredChannels = [[self.channels filteredArrayUsingPredicate:filteredPredicate] mutableCopy];
    
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self searchThroughData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.channelsTable) {
       return [self.channels count];
    } else {
        [self searchThroughData];
        return [self.filteredChannels count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    if (tableView == self.channelsTable) {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.channels objectAtIndex:indexPath.row] objectForKey:@"label"]];
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.filteredChannels objectAtIndex:indexPath.row] objectForKey:@"label"]];
    }
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//Add selector code here
    NSArray *whatChannels = tableView == self.channelsTable ? self.channels : self.filteredChannels;
    NSInteger channelid = [[[whatChannels objectAtIndex:indexPath.row] objectForKey:@"channelid"] integerValue];
    [self.client invokeMethod:@"Player.Open" withParameters:@{@"item": @{@"channelid": @(channelid)}}
     
                      success:^(AFHTTPRequestOperation *operation, id responseObject) {
                          //code
                          NSLog(@"%@", responseObject);
                      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                          //code
                          NSLog(@"The error: %@", error);
                      }];
}
    

@end
