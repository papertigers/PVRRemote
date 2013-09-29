//
//  SecondViewController.h
//  PVR Remote
//
//  Created by Michael Zeller on 8/4/13.
//  Copyright (c) 2013 Lights and Shapes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBMCAPIClient.h"

@interface ChannelsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) UIButton *menuButton;
@property (weak, nonatomic) XBMCAPIClient *client;
@property (weak, nonatomic) IBOutlet UITableView *channelsTable;
@property (strong, nonatomic) NSArray *channels;
@property (strong, nonatomic) NSMutableArray *filteredChannels;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@end
