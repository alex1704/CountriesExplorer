//
//  PopupNotification.m
//  FoapTest
//
//  Created by Alex Kostenko on 28.04.2023.
//

#import <Foundation/Foundation.h>
#import "PopupNotification.h"
#import "UIApplication+KeyWindow.h"

@implementation PopupNotification

+ (void)showNotificationWithText:(NSString *)text isError: (BOOL) isError {
  UIView *backgroundView = [[UIView alloc] initWithFrame: CGRectZero];
  backgroundView.backgroundColor = isError ? [UIColor redColor] : [UIColor greenColor];
  backgroundView.translatesAutoresizingMaskIntoConstraints = false;
  backgroundView.layer.cornerRadius = 8;
  backgroundView.layer.masksToBounds = YES;

  UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
  UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
  blurEffectView.translatesAutoresizingMaskIntoConstraints = false;
  [backgroundView addSubview:blurEffectView];

  [NSLayoutConstraint activateConstraints: @[
    [blurEffectView.topAnchor constraintEqualToAnchor:backgroundView.topAnchor],
    [blurEffectView.bottomAnchor constraintEqualToAnchor:backgroundView.bottomAnchor],
    [blurEffectView.leadingAnchor constraintEqualToAnchor:backgroundView.leadingAnchor],
    [blurEffectView.trailingAnchor constraintEqualToAnchor:backgroundView.trailingAnchor]
  ]];

  UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
  label.text = text;
  label.textColor = UIColor.whiteColor;
  label.textAlignment = NSTextAlignmentCenter;
  label.translatesAutoresizingMaskIntoConstraints = false;

  [backgroundView addSubview:label];
  backgroundView.layer.opacity = 0;

  [NSLayoutConstraint activateConstraints: @[
    [label.topAnchor constraintEqualToAnchor:backgroundView.topAnchor constant:24],
    [label.bottomAnchor constraintEqualToAnchor:backgroundView.bottomAnchor constant:-24],
    [label.leadingAnchor constraintEqualToAnchor:backgroundView.leadingAnchor constant:8],
    [label.trailingAnchor constraintEqualToAnchor:backgroundView.trailingAnchor constant:-8]
  ]];


  CGFloat width = fmin(CGRectGetWidth([UIScreen mainScreen].bounds) - 40, 300.0);

  UIWindow *window = [[UIApplication sharedApplication] getKeyWindow];
  [window addSubview: backgroundView];
  [window bringSubviewToFront: backgroundView];

  NSLayoutConstraint *topConstraint = [backgroundView.topAnchor constraintEqualToAnchor: window.topAnchor constant: -200];

  [NSLayoutConstraint activateConstraints: @[
    topConstraint,
    [backgroundView.centerXAnchor constraintEqualToAnchor: window.centerXAnchor],
    [backgroundView.widthAnchor constraintEqualToConstant: width]
  ]];

  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    topConstraint.constant = 66;
    [UIView animateWithDuration:1.0 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:0 animations:^{
      backgroundView.layer.opacity = 1;
      [window layoutIfNeeded];
    } completion:^(BOOL finished) {
      topConstraint.constant = -200;
      [UIView animateWithDuration:0.3 delay:2.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        backgroundView.layer.opacity = 0;
        [window layoutIfNeeded];
      } completion:^(BOOL finished) {
        [backgroundView removeFromSuperview];
      }];
    }];
  });
}

@end
