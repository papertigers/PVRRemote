//
//  MainViewController.m
//  PVR Remote
//
//  Created by Michael Zeller on 8/4/13.
//  Copyright (c) 2013 Lights and Shapes. All rights reserved.
//

#import "MainViewController.h"
#import "ECSlidingViewController.h"
#import "LeftMenuViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

@synthesize menuButton;
@synthesize client;

- (IBAction)menuBttn:(id)sender {
   [self.slidingViewController anchorTopViewTo:ECRight]; 
}

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

-(IBAction)revealMenu:(id)sender
{
    [self.slidingViewController anchorTopViewTo:ECRight];
}
- (IBAction)selectButton:(id)sender {
    [client invokeMethod:@"Input.Select" withParameters:@{}
     
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     //code
                     NSLog(@"%@", responseObject);
                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     //code
                     NSLog(@"The error: %@", error);
                 }];
}
- (IBAction)leftButton:(id)sender {
    [client invokeMethod:@"Input.Left" withParameters:@{}
     
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     //code
                     NSLog(@"%@", responseObject);
                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     //code
                     NSLog(@"The error: %@", error);
                 }];
}
- (IBAction)rightButton:(id)sender {
    [client invokeMethod:@"Input.Right" withParameters:@{}
     
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     //code
                     NSLog(@"%@", responseObject);
                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     //code
                     NSLog(@"The error: %@", error);
                 }];
}
- (IBAction)upButton:(id)sender {
    [client invokeMethod:@"Input.Up" withParameters:@{}
     
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     //code
                     NSLog(@"%@", responseObject);
                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     //code
                     NSLog(@"The error: %@", error);
                 }];
}
- (IBAction)downButton:(id)sender {
    [client invokeMethod:@"Input.Down" withParameters:@{}
     
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     //code
                     NSLog(@"%@", responseObject);
                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     //code
                     NSLog(@"The error: %@", error);
                 }];
}
- (IBAction)playButton:(id)sender {
    [client invokeMethod:@"Player.PlayPause" withParameters:@{@"playerid": @(1)}
     
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     //code
                     NSLog(@"%@", responseObject);
                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     //code
                     NSLog(@"The error: %@", error);
                 }];
}
- (IBAction)stopButton:(id)sender {
    [client invokeMethod:@"Player.Stop" withParameters:@{@"playerid": @(1)}
     
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     //code
                     NSLog(@"%@", responseObject);
                 } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     //code
                     NSLog(@"The error: %@", error);
                 }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
