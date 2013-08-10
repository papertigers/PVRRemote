//
//  SecondViewController.m
//  PVR Remote
//
//  Created by Michael Zeller on 8/4/13.
//  Copyright (c) 2013 Lights and Shapes. All rights reserved.
//

#import "SecondViewController.h"
#import "ECSlidingViewController.h"
#import "LeftMenuViewController.h"
#import "XBMCAPIClient.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize menuButton;
@synthesize client;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //setup client
    client = [XBMCAPIClient sharedXBMCAPIClient];
    
    //Setup LeftMenu
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[LeftMenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
}
- (IBAction)sciencehdChannel:(id)sender {
    NSInteger channelid = 323;
    [client invokeMethod:@"Player.Open" withParameters:@{@"item": @{@"channelid": @(channelid)}}
     
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     //code
                     NSLog(@"%@", responseObject);
                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     //code
                     NSLog(@"The error: %@", error);
                 }];

}
- (IBAction)discoveryhdChannel:(id)sender {
    NSInteger channelid = 321;
    [client invokeMethod:@"Player.Open" withParameters:@{@"item": @{@"channelid": @(channelid)}}
     
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     //code
                     NSLog(@"%@", responseObject);
                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     //code
                     NSLog(@"The error: %@", error);
                 }];
    
}

-(IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}

    

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
