//
//  CustomAlert.h
//  CustomAlert
//
//  Created by Deepthi on 11/8/13.
//  Copyright (c) 2013 Adevent Global Solutions. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol AlertViewDelegate <NSObject>
@optional

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;
@end


@interface CustomAlert : UIView
{
    UILabel   *titleLabel;
    UILabel   *messageLabel;
    NSString *cancelString;
    NSMutableArray *buttons;
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id /*<UIAlertViewDelegate>*/)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray*)otherButtonTitles;
- (void)addButtonWithTitle:(NSString *)title action:(SEL)action;   
- (void)show;

@end
