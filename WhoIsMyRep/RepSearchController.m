//
//  RepSearchController.m
//  WhoIsMyRep
//
//  Created by Caleb Hicks on 4/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RepSearchController.h"

@implementation RepSearchController

- (NSArray *)representativesByZipCode:(NSString *)zip {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://whoismyrepresentative.com/getall_mems.php?zip=%@&output=json", zip]];
    
    NSError *error;
    
    NSArray *representatives = [[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:url] options:NSJSONReadingAllowFragments error:&error] objectForKey:@"results"];
    
    NSMutableArray *convertedReps = [NSMutableArray new];
    
    for (NSDictionary *dictionary in representatives) {
        Representative *rep = [[Representative alloc] initWithDictionary:dictionary];
        
        [convertedReps addObject:rep];
    }
    
    return convertedReps;
}

@end
