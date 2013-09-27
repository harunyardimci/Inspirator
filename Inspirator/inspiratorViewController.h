//
//  inspiratorViewController.h
//  Inspirator
//
//  Created by Yardimci, Harun on 9/26/13.
//  Copyright (c) 2013 Yardimci, Harun. All rights reserved.
//

#import <UIKit/UIKit.h>

//@interface inspiratorViewController : UIViewController

@interface inspiratorViewController : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	IBOutlet UITableView *tableview;
	IBOutlet UIDatePicker *datePicker;
	IBOutlet UITextField *eventText;
}

@property (nonatomic, retain) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, retain) IBOutlet UITableView *tableview;
@property (nonatomic, retain) IBOutlet UITextField *eventText;

@property (weak, nonatomic) IBOutlet UILabel *lblQuote;
@property (weak, nonatomic) IBOutlet UILabel *lblAuthor;

@property (copy, nonatomic) NSString *author;
@property (copy, nonatomic) NSString *quote;
@property (copy, nonatomic) NSArray *contentArray;

- (IBAction) showNextQuote:(id)sender;
- (IBAction) scheduleAlarm2:(id) sender;

- (IBAction) openSettings:(id)sender;

@end
