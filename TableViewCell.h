//
//  TableViewCell.h
//  EstimateAid
//
//  Created by Bryan De Castro  on 4/25/15.
//  Copyright (c) 2015 Bryan De Castro . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *costLabel;

@end
