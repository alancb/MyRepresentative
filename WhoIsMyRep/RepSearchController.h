//
//  RepSearchController.h
//  WhoIsMyRep
//
//  Created by Caleb Hicks on 4/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Representative.h"

@interface RepSearchController : NSObject

- (void)representativesByZipCode:(NSString *)zip completion:(void (^)(NSArray * reps))completion;

@end
