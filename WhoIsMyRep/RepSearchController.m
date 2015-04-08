//
//  RepSearchController.m
//  WhoIsMyRep
//
//  Created by Caleb Hicks on 4/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "RepSearchController.h"

@implementation RepSearchController

- (void)representativesByZipCode:(NSString *)zip completion:(void (^)(NSArray * reps))completion {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://whoismyrepresentative.com/getall_mems.php?zip=%@&output=json", zip]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSArray *representatives = [[NSJSONSerialization JSONObjectWithData:data options:0 error:nil] objectForKey:@"results"];
        
        NSLog(@"%@", error);
        
        NSMutableArray *convertedReps = [NSMutableArray new];
        
        for (NSDictionary *dictionary in representatives) {
            Representative *rep = [[Representative alloc] initWithDictionary:dictionary];
            
            [convertedReps addObject:rep];
        }
        completion(convertedReps);
    }];
    
    [dataTask resume];

}

@end
