//
//  inspiratorViewController.h
//  Inspirator
//
//  Created by Yardimci, Harun on 9/26/13.
//  Copyright (c) 2013 Yardimci, Harun. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface inspiratorViewController : UIViewController

@interface inspiratorViewController : UIViewController

- (IBAction)postToTwitter:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnMore;

@property (weak, nonatomic) IBOutlet UILabel *lblQuote;
@property (weak, nonatomic) IBOutlet UILabel *lblAuthor;

@property (copy, nonatomic) NSString *author;
@property (copy, nonatomic) NSString *quote;
@property (copy, nonatomic) NSArray *contentArray;

- (IBAction) showNextQuote:(id)sender;

- (IBAction) scheduleAlarm:(id) sender;

- (IBAction) openSettings:(id)sender;

// Back from settings view to main view
- (IBAction) done:(UIStoryboardSegue *)seque;

@end
