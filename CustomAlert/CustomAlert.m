//
//  CustomAlert.m
//  CustomAlert
//
//  Created by Deepthi on 11/8/13.
//  Copyright (c) 2013 Adevent Global Solutions. All rights reserved.
//

#import "CustomAlert.h"
#import <QuartzCore/QuartzCore.h>

#define IS_IPHONE_SIMULATOR [[[UIDevice currentDevice]model] isEqualToString:@"iPhone Simulator"]
#define IS_IPHONE [[[UIDevice currentDevice]model] isEqualToString:@"iPhone"]
#define IS_IPAD [[[UIDevice currentDevice]model] isEqualToString:@"iPad"]
#define IS_WIDESCREEN  ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define IS_IPHONE5 ((IS_IPHONE_SIMULATOR || IS_IPHONE) && IS_WIDESCREEN)
@implementation CustomAlert


- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray*)otherButtonTitles
{
    self = [self  init];
    self.backgroundColor = [UIColor clearColor];
    if (self) {
        buttons = [[NSMutableArray alloc] initWithArray:otherButtonTitles];
        cancelString = cancelButtonTitle;
    }
    NSLog(@"this is for git test");
    self.frame = [[[[[[UIApplication sharedApplication]delegate] window]rootViewController]view] frame];
    self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;

    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.frame];
    bgView.alpha = 0.2;
    bgView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    bgView.backgroundColor = [UIColor blackColor];
    [self addSubview:bgView];
    UIImageView *alertBg = [[UIImageView alloc] init] ;

    if (IS_IPHONE || IS_IPHONE5 || IS_IPHONE_SIMULATOR) {
        [alertBg setFrame:CGRectMake(0, 0, 250, 200)];
    }
    else
    {
        [alertBg setFrame:CGRectMake(0, 0, 250, 200)];
    }
    alertBg.center = self.center;
    alertBg.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    alertBg.layer.cornerRadius = 10;
    alertBg.layer.shadowColor = [UIColor whiteColor].CGColor;
    alertBg.layer.borderWidth = 1;
    alertBg.layer.borderColor = [UIColor whiteColor].CGColor;

    alertBg.backgroundColor = [UIColor colorWithRed:29/255.0 green:77/255.0 blue:109/255.0 alpha:1];
    [self addSubview:alertBg];

    
     titleLabel = [[UILabel alloc]init];
    [titleLabel setFrame:CGRectMake(0, 5, alertBg.frame.size.width, 21)];
    titleLabel.textAlignment = UITextAlignmentCenter;
    titleLabel.backgroundColor = [UIColor clearColor];
	titleLabel.text = title;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    [alertBg addSubview:titleLabel];
    
    messageLabel = [[UILabel alloc]init];
    [messageLabel setFrame:CGRectMake(0, titleLabel.frame.size.height+10, alertBg.frame.size.width, 40)];
    messageLabel.numberOfLines =2;
    messageLabel.textAlignment = UITextAlignmentCenter;
    messageLabel.backgroundColor = [UIColor clearColor];
	messageLabel.text = message;
    messageLabel.textColor = [UIColor whiteColor];
    messageLabel.font = [UIFont fontWithName:@"Helvetica" size:16];
    [alertBg addSubview:messageLabel];

    for (NSString * buttonTitle in otherButtonTitles) {
        [self addButtonWithTitle:buttonTitle action:nil];
    }
    
    if (cancelString.length > 0) {
        UIButton *cancelButton = [[UIButton alloc] init];
        if (buttons.count == 0) {
            [cancelButton setFrame:CGRectMake(0, 0, 0, 0)];
        }

    
    }
    
    
    return self;
}

- (void)show
{
    [[[[[[UIApplication sharedApplication]delegate] window] rootViewController] view] addSubview:self];
    
}
- (void)addButtonWithTitle:(NSString *)title action:(SEL)action
{
    
}
/*
- (float)degrees2radians:(float)d
{
    float r = d * (M_PI / 180);
    return r;
}
- (void)showLoadingView :(NSString *)newMessage
{
    
    int degrees;
    if (STATUSBAR_ORIENTATION == UIInterfaceOrientationLandscapeLeft) {
        degrees = 270;
    }
    else  if (STATUSBAR_ORIENTATION == UIInterfaceOrientationLandscapeRight) {
        degrees = 90;
    }
    
    
    CGAffineTransform labelRotation = CGAffineTransformIdentity;
    labelRotation = CGAffineTransformRotate(labelRotation, [self degrees2radians:degrees]);
    self.loadingView.transform = labelRotation;
    self.loadingView.layer.backgroundColor = [UIColor blackColor].CGColor;
    self.loadingView.layer.cornerRadius = 10;
    self.loadingView.layer.shadowColor = [UIColor whiteColor].CGColor;
    self.loadingView.layer.borderWidth = 3;
    self.loadingView.layer.borderColor = [UIColor whiteColor].CGColor;
    UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityIndicator.center = CGPointMake(40,50);
    [activityIndicator setHidesWhenStopped:YES];
    [activityIndicator startAnimating];
    [self.loadingView addSubview:activityIndicator];
    [activityIndicator release];
    
	UILabel *statusLabel = [[UILabel alloc]init];
    [statusLabel setFrame:CGRectMake(80, 10, 250, 80)];
    statusLabel.numberOfLines = 0;
    //    statusLabel.textAlignment = UITextAlignmentCenter;
    statusLabel.backgroundColor = [UIColor clearColor];
    statusLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    statusLabel.tag = 1000;
	statusLabel.text = newMessage;
    statusLabel.textColor = [UIColor whiteColor];
    statusLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
    [self.loadingView addSubview:statusLabel];
    [statusLabel release];
	
    
    [delegate.window addSubview:self.loadingView];
    
    
    [pool release];
    
}
- (void)hideLoadingView {
	[self.loadingView removeFromSuperview];
    GAAppDelegate *delegate = (GAAppDelegate*)[[UIApplication sharedApplication]delegate];
    [delegate.window.rootViewController.view setUserInteractionEnabled:YES];
    [delegate.window.rootViewController.view setAlpha:1];
    
    [self.view setUserInteractionEnabled:YES];
}

- (void)updateLoadingViewStatusMessageTo:(NSString *)newMessage {
    
	UILabel *statusLabel = (UILabel *)[self.loadingView viewWithTag:1000];
	statusLabel.text =  newMessage;
}


*/
@end
