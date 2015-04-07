//
//  Representative.h
//  WhoIsMyRep
//
//  Created by Caleb Hicks on 4/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Representative : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *party;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *phone;
@property (strong, nonatomic) NSString *address;
@property (strong, nonatomic) NSString *url;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
