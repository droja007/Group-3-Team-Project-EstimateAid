//
//  TableViewController.h
//  EstimateAid
//
//  Created by Bryan De Castro  on 4/23/15.
//  Copyright (c) 2015 Bryan De Castro . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DREstimate.h"
#import "DetailViewController.h"
#import "SecondViewController.h"
#import "TableViewCell.h"


@interface TableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) DREstimate *estimate;
@end
