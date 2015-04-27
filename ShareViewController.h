//
//  ShareViewController.h
//  EstimateAid
//
//  Created by Bryan De Castro  on 4/23/15.
//  Copyright (c) 2015 Bryan De Castro . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>
#import <MessageUI/MessageUI.h>

@interface ShareViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITextField *emailText;


@end
