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
    
    //Setup LeftMenu
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[LeftMenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    
    //Attempt a navigation controller
//    UINavigationBar *navBar = [[UINavigationBar alloc] init];
//    navBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 50);
//    [self.view addSubview:navBar];
    
    
//    self.menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    menuButton.frame = CGRectMake(8, 10, 34, 24);
//    [menuButton setBackgroundImage:[UIImage imageNamed:@"menuButton.png"] forState:UIControlStateNormal];
//    [menuButton addTarget:self action:@selector(revealMenu:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:self.menuButton];
    
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
