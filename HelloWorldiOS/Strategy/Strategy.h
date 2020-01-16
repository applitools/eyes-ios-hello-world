// Licensed under the Applitools SDK License, which can be found here: https://www.applitools.com/eula/sdk

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol Strategy <NSObject>

- (UIImage *)image;
- (CGFloat)clickMeButtonCenterXLayoutValue;
- (NSAttributedString *)attributedText;

@end
