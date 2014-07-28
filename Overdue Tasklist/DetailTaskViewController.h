//
//  DetailTaskViewController.h
//  Overdue Tasklist
//
//  Created by Gauthier Delmee on 28/07/2014.
//  Copyright (c) 2014 Expectancy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *labelTaskName;
@property (strong, nonatomic) IBOutlet UILabel *labelTaskDescription;
@property (strong, nonatomic) IBOutlet UILabel *labelDueDate;

- (IBAction)editBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
