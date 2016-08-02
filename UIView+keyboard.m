//
//  UIView+keyboard.m
//  UIKeyBordPopUPCpntroller
//
//  Created by 龚纯 on 16/7/24.
//  Copyright © 2016年 龚纯. All rights reserved.
//

#import "UIView+keyboard.h"

@implementation UIViewController (keyboard)

-(void)registerViewForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardwillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

-(void)resignViewForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification object:nil];
}

-(void)keyboardwillShow:(NSNotification*)notification
{
    NSDictionary *userInfoDic = [notification userInfo];
    CGRect keyRect = [[userInfoDic objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];//keyboard frame
    CGFloat time = [[userInfoDic objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];//keyboard animation time
    [self keyboardWithShow:time key_height:keyRect];
}

-(void)keyboardWillHide:(NSNotification*)notification
{
    NSDictionary *userInfoDic = [notification userInfo];
    CGFloat time = [[userInfoDic objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];//keyboard animation time
    [self keyboardWithHide:time];
}

-(void)keyboardWithShow:(CGFloat)time key_height:(CGRect)keyRect
{
    NSLog(@"Keyboard show");
}
-(void)keyboardWithHide:(CGFloat)time
{
    NSLog(@"Keyboard disappear");
}
@end
