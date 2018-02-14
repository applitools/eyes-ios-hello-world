//
//  Strategy.h
//  HelloWorldiOS
//
//  Created by Anton Chuev on 2/13/18.
//  Copyright © 2018 Applitools. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol Strategy <NSObject>

- (UIImage *)image;
- (CGFloat)clickMeButtonCenterXLayoutValue;
- (NSAttributedString *)attributedText;

@end
