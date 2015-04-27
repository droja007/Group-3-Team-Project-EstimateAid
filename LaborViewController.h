//
//  LaborViewController.h
//  EstimateAid
//
//  Created by Bryan De Castro  on 4/23/15.
//  Copyright (c) 2015 Bryan De Castro . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DREstimate.h"
#import "SecondViewController.h"

@interface LaborViewController : UIViewController

//textfields for labor page
@property (strong, nonatomic) IBOutlet UITextField *amountOfWorkers;
@property (strong, nonatomic) IBOutlet UITextField *averageHourlyWage;
@property (strong, nonatomic) IBOutlet UITextField *averageHoursWorkedPerDay;
@property (strong, nonatomic) IBOutlet UITextField *estimatedDayAmount;

//estimate object
@property (strong, nonatomic) DREstimate *estimate;

//labor button(s)
- (IBAction)updateLaborTotal:(id)sender;

@end
