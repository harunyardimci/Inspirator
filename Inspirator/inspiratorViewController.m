//
//  inspiratorViewController.m
//  Inspirator
//
//  Created by Yardimci, Harun on 9/26/13.
//  Copyright (c) 2013 Yardimci, Harun. All rights reserved.
//

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
    
	datePicker = nil;
	tableview = nil;
	eventText = nil;
    
    _author = nil;
    _quote = nil;
    
    self.author = nil;
    self.quote = nil;
    
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

- (IBAction) openSettings:(id)sender {

    UIViewController* settingsViewController = [[UIViewController alloc] initWithNibName:@"Settings" bundle:[NSBundle mainBundle]];
    [self.view addSubview:settingsViewController.view];
}


- (IBAction) scheduleAlarm:(id) sender {
//    [eventText resignFirstResponder];
//    
//    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
//    
//    // Get the current date
//    NSDate *pickerDate = [self.datePicker date];
//    
//    // Break the date up into components
//    NSDateComponents *dateComponents = [calendar components:( NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit )
//												   fromDate:pickerDate];
//    NSDateComponents *timeComponents = [calendar components:( NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit )
//												   fromDate:pickerDate];
//    // Set up the fire time
//    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
//    [dateComps setDay:[dateComponents day]];
//    [dateComps setMonth:[dateComponents month]];
//    [dateComps setYear:[dateComponents year]];
//    [dateComps setHour:[timeComponents hour]];
//	// Notification will fire in one minute
//    [dateComps setMinute:[timeComponents minute]];
//	[dateComps setSecond:[timeComponents second]];
//    NSDate *itemDate = [calendar dateFromComponents:dateComps];
//    [dateComps release];
//    
//    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
//    if (localNotif == nil)
//        return;
//    localNotif.fireDate = itemDate;
//    localNotif.timeZone = [NSTimeZone defaultTimeZone];
//    
//	// Notification details
//    localNotif.alertBody = [eventText text];
//	// Set the action button
//    localNotif.alertAction = @"View";
//    
//    localNotif.soundName = UILocalNotificationDefaultSoundName;
//    localNotif.applicationIconBadgeNumber = 1;
//    
//	// Specify custom data for the notification
//    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"someValue" forKey:@"someKey"];
//    localNotif.userInfo = infoDict;
//    
//	// Schedule the notification
//    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
//    [localNotif release];
    
//	[self.tableview reloadData];
}




//- (void)addNotification {
//    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
//    
//    localNotification.fireDate = [NSDate date];
//    localNotification.alertBody = @"get your daily inspiration";
//    localNotification.soundName = UILocalNotificationDefaultSoundName;
//    localNotification.applicationIconBadgeNumber = 1;
//    
//    NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"Object 1", @"Key 1", @"Object 2", @"Key 2", nil];
//    localNotification.userInfo = infoDict;
//    
//    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
//    [localNotification release];
//}

//- (void) dealloc {
//    [super dealloc];
//}


@end