//
//  UIApplication+KeyWindow.m
//  FoapTest
//
//  Created by Alex Kostenko on 28.04.2023.
//

#import "UIApplication+KeyWindow.h"

@implementation UIApplication (KeyWindow)

- (UIWindow *) getKeyWindow {
  UIWindowScene *keyWindowScene = nil;

  for (UIScene *scene in self.connectedScenes) {
    if (scene.activationState == UISceneActivationStateForegroundActive) {
      keyWindowScene = (UIWindowScene *)scene;
      return keyWindowScene.keyWindow;
    }
  }

  return  nil;
}

@end
