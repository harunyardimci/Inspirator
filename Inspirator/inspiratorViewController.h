//
//  inspiratorViewController.h
//  Inspirator
//
//  Created by Yardimci, Harun on 9/26/13.
//  Copyright (c) 2013 Yardimci, Harun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface inspiratorViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblQuote;
@property (weak, nonatomic) IBOutlet UILabel *lblAuthor;

- (IBAction)showNextQuote:(id)sender;


@property (copy, nonatomic) NSString *author;
@property (copy, nonatomic) NSString *quote;

@property (copy, nonatomic) NSArray *contentArray;


@end
