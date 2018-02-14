//
//  DifferencesStrategy.m
//  HelloWorldiOS
//
//  Created by Anton Chuev on 2/13/18.
//  Copyright © 2018 Applitools. All rights reserved.
//

#import "DifferencesStrategy.h"

@implementation DifferencesStrategy

- (UIImage *)image {
    return [UIImage imageNamed:@"bug"];
}

- (CGFloat)clickMeButtonCenterXLayoutValue {
    return 50.f;
}

- (NSAttributedString *)attributedText {
    NSMutableString *htmlString = [NSMutableString stringWithString:@"<font size=\"26\"><center><span style=\"color:#8b00ff;\">H</span>"];
    [htmlString appendString:@"<span style=\"color:#4600ff;\">E</span>"];
    [htmlString appendString:@"<span style=\"color:#0000ff;\">L</span>"];
    [htmlString appendString:@"<span style=\"color:#0080ff;\">L</span>"];
    [htmlString appendString:@"<span style=\"color:#00ffff;\">O</span>"];
    [htmlString appendString:@"<span style=\"color:#00ff80;\"> </span>"];
    [htmlString appendString:@"<span style=\"color:#ffff00;\">W</span>"];
    [htmlString appendString:@"<span style=\"color:#ffff00;\">O</span>"];
    [htmlString appendString:@"<span style=\"color:#ffbf00;\">R</span>"];
    [htmlString appendString:@"<span style=\"color:#ff7f00;\">L</span>"];
    [htmlString appendString:@"<span style=\"color:#ff4000;\">D</span>"];
    [htmlString appendString:@"<span style=\"color:#ff0000;\">!</span></center></font>"];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]
                                                   initWithData: [htmlString dataUsingEncoding:NSUnicodeStringEncoding]
                                                   options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                                   documentAttributes: nil
                                                   error: nil
                                                   ];
    return [attributedString copy];
}

@end
