//
//  EditTaskViewController.h
//  Overdue Tasklist
//
//  Created by Gauthier Delmee on 28/07/2014.
//  Copyright (c) 2014 Expectancy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditTaskViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *textFieldTaskName;
@property (strong, nonatomic) IBOutlet UITextView *textViewTaskDescription;
@property (strong, nonatomic) IBOutlet UIDatePicker *dueDateDatePicker;

- (IBAction)saveBarButtonItemPressed:(UIBarButtonItem *)sender;

@end
