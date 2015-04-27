//
//  DetailViewController.h
//  EstimateAid
//
//  Created by Bryan De Castro  on 4/23/15.
//  Copyright (c) 2015 Bryan De Castro . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DREstimate.h"
#import "SecondViewController.h"
#import "TableViewController.h"
@interface DetailViewController : UIViewController

//text fields for material detail view
@property (strong, nonatomic) IBOutlet UITextField *materialName;
@property (strong, nonatomic) IBOutlet UITextField *materialCost;

//materialButton(s)
- (IBAction)addMaterial:(id)sender;


//estimate model
@property (strong, nonatomic) DREstimate *estimate;

@end
