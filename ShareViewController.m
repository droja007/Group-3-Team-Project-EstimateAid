//
//  ShareViewController.m
//  EstimateAid
//
//  Created by Bryan De Castro  on 4/23/15.
//  Copyright (c) 2015 Bryan De Castro . All rights reserved.
//

#import "ShareViewController.h"

@interface ShareViewController ()

@end

@implementation ShareViewController

@synthesize emailText;

- (void)viewDidLoad {
    [super viewDidLoad];
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
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    return YES;
}

- (IBAction)sendEmail:(id)sender {

     
     if (self.emailText.text != nil)
     {
         
         //Use this to retrieve your recently saved file
         
         NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
         NSString *fileName = [documentPath stringByAppendingPathComponent:@"report.pdf"];
         
    NSString *recipient = [NSString stringWithFormat:@"%@",self.emailText.text];
        
    NSString *emailTitle = @"Your FREE Estimate awaits!";
    NSString *messageBody = @"Hey, check this free Estimate I got from ER Constructions at erconstruction@att.net ! CALL US at (786) 258-3570.";
    NSArray *toRecipents = [NSArray arrayWithObject:recipient];

    
         //**END OF EDIT**
         
         NSString *mimeType = @"application/pdf"; //This should be the MIME type for els files. May want to double check.
         NSData *fileData = [NSData dataWithContentsOfFile:fileName];
         NSString *fileNameWithExtension = @"report.pdf"; //This is what you want the file to be called on the email along with it's extension:
         
         //If you want to then delete the file:
         NSError *error;
         if (![[NSFileManager defaultManager] removeItemAtPath:fileName error:&error])
             NSLog(@"ERROR REMOVING FILE: %@", [error localizedDescription]);
         
         
         //Send email
         MFMailComposeViewController *mailMessage = [[MFMailComposeViewController alloc] init];
         [mailMessage setMailComposeDelegate:self];
         
         [mailMessage setSubject:emailTitle];
         [mailMessage setMessageBody:messageBody isHTML:NO];
         [mailMessage setToRecipients:toRecipents];
         [mailMessage addAttachmentData:fileData mimeType:mimeType fileName:fileNameWithExtension];
         
             // Present mail view controller on screen
         [self presentViewController:mailMessage animated:YES completion:nil];

    
     }
     else
     {
         self.emailText.text = @"";
     }
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail sent failure: %@", [error localizedDescription]);
            break;
        default:
            break;
    }
    
    // Close the Mail Interface
    [self dismissViewControllerAnimated:YES completion:NULL];
}
    
    




#pragma Facebook

- (IBAction)postToFacebook:(id)sender {
    
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *fbComposer = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeFacebook];
        
        NSString *resultText = @"Post to Facebook";
        
        //set the initial text message
        [fbComposer setInitialText: resultText];
        //add url
        //if ([fbComposer addURL:[NSURL URLWithString:@""]]) {
        //     NSLog(@"Blog url added");
        //}
        
        
        // you can remove all added URLs as follows
        [fbComposer removeAllURLs];
        
        //add image to post
        if ([fbComposer addImage:[UIImage imageNamed:@"Blue_Compass_A.jpg"]]) {
            NSLog(@"Estimate Report has been added to the post");
        }
        // if ([fbComposer addImage:[UIImage imageNamed: @"scan.jpg"]]) {
        //     NSLog(@"scan is added to the post");
        // }
        
        //remove all added images
        //[fbComposer removeAllImages];
        
        //present the composer to the user
        [self presentViewController:fbComposer animated:YES completion:nil];
        
    }else {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Facebook Error"
                                  message:@"You may not have set up facebook service on your device or\n                                  You may not connected to internet.\nPlease check ..."
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
        [alertView show];
    }
}


#pragma Twitter


- (IBAction)postToTwitter:(id)sender {
    
    
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
        SLComposeViewController *twitterComposer = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        
        NSString *resultText = @"Post to twitter";
        
        //set the initial text message
        [twitterComposer setInitialText: resultText];
        //add url
        //if ([twitterComposer addURL:[NSURL URLWithString:@"www.kmithi.blogspot.com"]]) {
        //     NSLog(@"Blog url added");
        //}
        
        
        // you can remove all added URLs as follows
        [twitterComposer removeAllURLs];
        
        //add image to post
        if ([twitterComposer addImage:[UIImage imageNamed:@"Unknown.jpeg"]]) {
            NSLog(@"Estimate Report has been added to the post");
        }
        // if ([fbComposer addImage:[UIImage imageNamed: @"scan.jpg"]]) {
        //     NSLog(@"scan is added to the post");
        // }
        
        //remove all added images
        //[twitterComposer removeAllImages];
        
        //present the composer to the user
        [self presentViewController:twitterComposer animated:YES completion:nil];
        
    }else {
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:@"Facebook Error"
                                  message:@"You may not have set up Twitter service on your device or\n                                  You may not connected to internet.\nPlease check ..."
                                  delegate:self
                                  cancelButtonTitle:@"OK"
                                  otherButtonTitles: nil];
        [alertView show];
    }
}


@end


