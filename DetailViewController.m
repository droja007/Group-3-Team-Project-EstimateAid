//
//  DetailViewController.m
//  EstimateAid
//
//  Created by Bryan De Castro  on 4/23/15.
//  Copyright (c) 2015 Bryan De Castro . All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize estimate, materialCost, materialName;
- (void)viewDidLoad {
    [super viewDidLoad];
    estimate = [DREstimate sharedEstimate];
    
    materialName.text = @"";
    materialCost.text = [NSString stringWithFormat:@"%f", 0.00];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)addMaterial:(id)sender {
    [estimate addMaterialToDictionary:[NSString stringWithString:materialName.text] withCost:[materialCost.text doubleValue]];
    
}
@end
