//
//  ViewController.h
//  Overdue Tasklist
//
//  Created by Gauthier Delmee on 28/07/2014.
//  Copyright (c) 2014 Expectancy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *taskObjects;

- (IBAction)reoderBarButtonItemPressed:(UIBarButtonItem *)sender;
- (IBAction)addTaskBarButtonItemPressed:(UIBarButtonItem *)sender;


@end

