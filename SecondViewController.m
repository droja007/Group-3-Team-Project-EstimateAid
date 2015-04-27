//
//  SecondViewController.m
//  EstimateAid
//
//  Created by Bryan De Castro  on 4/19/15.
//  Copyright (c) 2015 Bryan De Castro . All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController
{
    //location manager for Geo Location
    CLLocationManager *locationManager;
    //
    CLGeocoder *geocoder;
    //
    CLPlacemark *placemark;

}

@synthesize employeeName, laborTotal, clientName, materialsTotal, address, estimate, longitudeLabel, latitudeLabel;

//creates the estimate for the first time
- (void)viewDidLoad {
    [super viewDidLoad];
    //creates the new estimate model
    self.estimate = [DREstimate sharedEstimate];
    
    //allocate location Manager for Geo Loc.
    locationManager = [[CLLocationManager alloc]init];
    
    //
    geocoder = [[CLGeocoder alloc]init];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //incase there is no camera hardware installed.
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    
}
//loads updated data if any
- (void)viewDidAppear:(BOOL)animated
{
    clientName.text = self.estimate.clientName;
    employeeName.text = self.estimate.employeeName;
    laborTotal.text = [NSString stringWithFormat:@"%f",[self.estimate getTotalLaborCost]];
    materialsTotal.text = [NSString stringWithFormat:@"%f",[self.estimate getTotalMaterialCost]];
    address.text = self.estimate.address;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma GeoLocation

         
- (IBAction)getGeoLocation:(id)sender {
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [locationManager startUpdatingLocation];
    
    
    
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    
    //NSlog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to get your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    
    [errorAlert show];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
       self.longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        self.latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
    }
    
    
    // Stop Location Manager
    [locationManager stopUpdatingLocation];
    

    // Reverse Geocoding
    NSLog(@"Resolving the Address");
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"Found placemarks: %@, error: %@", placemarks, error);
        if (error == nil && [placemarks count] > 0) {
            placemark = [placemarks lastObject];
            self.address.text = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                                 placemark.subThoroughfare, placemark.thoroughfare,
                                 placemark.postalCode, placemark.locality,
                                 placemark.administrativeArea,
                                 placemark.country];
        } else {
            NSLog(@"%@", error.debugDescription);
        }
    } ];
    
}

#pragma Camera

- (IBAction)takePhoto:(id)sender {
    //allocated and initiates the image picker controller.
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    //allows for the picture to be edited.
    picker.allowsEditing = YES;
    
    //sets the source type to the camera.
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    //presents the controller on the screen as a pop up and animated.
    [self presentViewController:picker animated:YES completion:NULL];

}

- (IBAction)selectPhoto:(id)sender {
    //allocated and initiates the image picker controller.
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    //allows for the picture to be edited.
    picker.allowsEditing = YES;
    //sets the source type to the photo library.
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
     //presents the controller on the screen as a pop up and animated.
    [self presentViewController:picker animated:YES completion:NULL];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    //finds the edited picture and assigns it to the image view on the screen.
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    //dismisses the view controller.
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    //when the user hits cancel it dismisses the camera view controller.
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

#pragma Reports


- (IBAction)createReport:(id)sender {
    
    
    
}
@end
