//
//  GetFloatingRegionProtocol.h
//  EyesXCUI
//
//  Created by Anton Chuev on 10/26/17.
//  Copyright © 2017 Applitools. All rights reserved.
//

#import "FloatingMatchSettings.h"

@protocol GetFloatingRegionProtocol <NSObject>

- (nullable FloatingMatchSettings *)getRegion;

@end
