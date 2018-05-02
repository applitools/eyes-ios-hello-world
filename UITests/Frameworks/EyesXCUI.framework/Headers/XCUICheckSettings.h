//
//  XCUICheckSettings.h
//  EyesXCUI
//
//  Created by Anton Chuev on 8/28/17.
//  Copyright © 2017 Applitools. All rights reserved.
//

#import "CheckSettings.h"
#import "Region.h"
#import <XCTest/XCTest.h>

NS_ASSUME_NONNULL_BEGIN

@protocol XCUICheckTargetProtocol <NSObject>

- (XCUIElement *)targetElement;

@end

@interface XCUICheckSettings : CheckSettings <XCUICheckTargetProtocol>

- (instancetype)initWithTargetElement:(XCUIElement *)targetElement;

- (XCUICheckSettings *)region:(Region *)region;

@end

NS_ASSUME_NONNULL_END
