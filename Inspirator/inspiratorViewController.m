//
//  inspiratorViewController.m
//  Inspirator
//
//  Created by Yardimci, Harun on 9/26/13.
//  Copyright (c) 2013 Yardimci, Harun. All rights reserved.
//

#import <Social/Social.h>
#import "inspiratorViewController.h"

@interface inspiratorViewController ()

@end

@implementation inspiratorViewController

@synthesize author = _author;
@synthesize quote = _quote;

@synthesize datePicker;
@synthesize tableview;
@synthesize eventText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self loadQuotesFromFile];
    
//    NSLog(@" plist: %@ ", self.contentArray);
//    for (NSDictionary* dict in self.contentArray) {
//        NSLog(@" dict: %@ ", dict);
//    }
    
    // show The First Quote
    [self showNextQuote:self];
    
}

- (void)viewDidUnload {
    
    _author = nil;
    _quote = nil;
    
    self.author = nil;
    self.quote = nil;
    
}


- (IBAction)postToTwitter:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
    {
        SLComposeViewController *tweetSheet = [SLComposeViewController
                                               composeViewControllerForServiceType:SLServiceTypeTwitter];
        [tweetSheet setInitialText:@"Great fun to learn iOS programming at appcoda.com!"];
        [self presentViewController:tweetSheet animated:YES completion:nil];
    } else {
        NSLog(@"No twitter account");
    }
}


-(IBAction)done:(UIStoryboardSegue *)seque{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadQuotesFromFile {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    self.contentArray = [NSArray arrayWithContentsOfFile:filePath];
}


- (IBAction)showNextQuote:(id)sender {

    int randomNumber = [self getRandomNumber];
    
    self.lblQuote.text = [self getQuote:randomNumber];
    self.lblAuthor.text = [self getAuthor:randomNumber];
}

- (int) getRandomNumber {
    return arc4random() % [self.contentArray count];
}

- (NSString*)getQuote:(int)random {

    NSDictionary *dict = [self.contentArray objectAtIndex:random];
    self.quote = (NSString*)[dict objectForKey:@"quote"];
    
    // NSString *quoteText = [[NSString alloc] initWithFormat:@"\"%@\"", self.quote];
    NSString *quoteText = [[NSString alloc] initWithFormat:@"%@", self.quote];
    
    return quoteText;
}

- (NSString*)getAuthor:(int)random {

    NSDictionary *dict = [self.contentArray objectAtIndex:random];
    self.author = (NSString*)[dict objectForKey:@"author"];
    
    NSString *authorText = [[NSString alloc] initWithFormat:@"- %@", self.author];
    
    return authorText;
}


@end