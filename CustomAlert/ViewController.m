//
//  ViewController.m
//  CustomAlert
//
//  Created by Deepthi on 11/8/13.
//  Copyright (c) 2013 Adevent Global Solutions. All rights reserved.
//

#import "ViewController.h"
#import "CustomAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CustomAlert *alert = [[CustomAlert alloc] initWithTitle:@"Invalid Id" message:@"Please enter correct Id" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
