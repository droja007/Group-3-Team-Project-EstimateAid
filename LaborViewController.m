//
//  LaborViewController.m
//  EstimateAid
//
//  Created by Bryan De Castro  on 4/23/15.
//  Copyright (c) 2015 Bryan De Castro . All rights reserved.
//

#import "LaborViewController.h"

@interface LaborViewController ()

@end

@implementation LaborViewController
{
    
    SecondViewController *EstimateViewC;
}

@synthesize amountOfWorkers,averageHourlyWage,averageHoursWorkedPerDay,estimatedDayAmount, estimate;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.estimate = [DREstimate sharedEstimate];
    
    
    self.estimatedDayAmount.text = [NSString stringWithFormat:@"%i", estimate.estimatedDayAmount];
    self.amountOfWorkers.text = [NSString stringWithFormat:@"%i", estimate.workerCount];
    self.averageHoursWorkedPerDay.text =[NSString stringWithFormat:@"%i", estimate.averageHoursWorkedPerDay];
    self.averageHourlyWage.text = [NSString stringWithFormat:@"%f", estimate.averageHourlyRate];
    
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


- (IBAction)updateLaborTotal:(id)sender {
    
    int workers = [[amountOfWorkers text] intValue];
    estimate.workerCount = workers;
  
    int day = [[self.estimatedDayAmount text] intValue];
    estimate.estimatedDayAmount = day;
   
    int hours = [[averageHoursWorkedPerDay text] intValue];
    estimate.averageHoursWorkedPerDay = hours;

    double hourlyRate = [[averageHourlyWage text] doubleValue];
    estimate.averageHourlyRate = hourlyRate;

    
}
@end
