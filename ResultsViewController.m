//
//  ResultsViewController.m
//  WhoIsMyRep
//
//  Created by Caleb Hicks on 4/7/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ResultsViewController.h"
#import "RepSearchController.h"

@interface ResultsViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) RepSearchController *searchController;

@property (strong, nonatomic) NSArray *representatives;

@end

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = self.zipCode;
    
    self.searchController = [RepSearchController new];
    
    [self.searchController representativesByZipCode:self.zipCode completion:^(NSArray *reps) {
        self.representatives = reps;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"repCell"];
    
    Representative *rep = self.representatives[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ - %@", rep.name, rep.party];
    cell.detailTextLabel.text = rep.address;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.representatives.count;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
