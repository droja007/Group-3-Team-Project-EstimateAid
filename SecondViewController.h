//
//  SecondViewController.h
//  EstimateAid
//
//  Created by Bryan De Castro  on 4/19/15.
//  Copyright (c) 2015 Bryan De Castro . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DREstimate.h"
#import "TableViewController.h"
#import "LaborViewController.h"
#import "DetailViewController.h"
#import <CoreLocation/CoreLocation.h>



@interface SecondViewController : UIViewController <CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

//textfields in the estimate page
@property (strong, nonatomic) IBOutlet UITextField *clientName;
@property (strong, nonatomic) IBOutlet UITextField *employeeName;
@property (strong, nonatomic) IBOutlet UITextField *laborTotal;
@property (strong, nonatomic) IBOutlet UITextField *materialsTotal;
@property (strong, nonatomic) IBOutlet UITextField *address;


//labels for longitude and latitude for Geo Locations
@property (strong, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *latitudeLabel;

//estimate model
@property (strong, nonatomic) DREstimate *estimate;

//estimate buttons
- (IBAction)getGeoLocation:(id)sender;

- (IBAction)takePhoto:(id)sender;
- (IBAction)selectPhoto:(id)sender;


- (IBAction)createReport:(id)sender;


//picture dispays
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

