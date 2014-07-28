//
//  ViewController.m
//  Overdue Tasklist
//
//  Created by Gauthier Delmee on 28/07/2014.
//  Copyright (c) 2014 Expectancy. All rights reserved.
//

#import "ViewController.h"
#import "Task.h"
#import "AddTaskViewController.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
-(NSMutableArray *)taskObjects{
    if (!_taskObjects) {
        _taskObjects = [[NSMutableArray alloc] init];
    }
    
    return _taskObjects;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *tasksAsPropertyLists = [[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_TASKS_OBJECTS_KEY];
    for (NSDictionary *dictionary in tasksAsPropertyLists) {
        Task *taskObject = [self taskObjectForDictionary:dictionary];
        [self.taskObjects addObject:taskObject];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)reoderBarButtonItemPressed:(UIBarButtonItem *)sender {
}

- (IBAction)addTaskBarButtonItemPressed:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"toAddTaskViewControllerSegue" sender:sender];
}

#pragma mark - Segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([sender isKindOfClass:[UIBarButtonItem class]] && [segue.destinationViewController isKindOfClass:[AddTaskViewController class]]) {
        AddTaskViewController *addTaskViewController = segue.destinationViewController;
        addTaskViewController.delegate = self;
    }
}

#pragma mark - AddTaskViewControllerDelegate Methods
-(void)didCancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)didAddTask:(Task *)task{
    
    [self.taskObjects addObject:task];
    
    NSMutableArray *taskObjectsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:ADDED_TASKS_OBJECTS_KEY] mutableCopy];
    if (!taskObjectsAsPropertyLists) taskObjectsAsPropertyLists = [[NSMutableArray alloc] init];
    
    [taskObjectsAsPropertyLists addObject:[self taskObjectsAsAPropertyList:task]];
    
    [[NSUserDefaults standardUserDefaults] setObject:taskObjectsAsPropertyLists forKey:ADDED_TASKS_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.tableView reloadData];
}

#pragma mark - Helper Methods
-(NSDictionary *)taskObjectsAsAPropertyList:(Task *)taskObject{
    NSDictionary *dictionary = @{TASK_TITLE : taskObject.title, TASK_DESCRIPTION : taskObject.description, TASK_DUE_DATE : taskObject.date, TASK_COMPLETION : [NSNumber numberWithBool:taskObject.completion]};
    
    return dictionary;
}

-(Task *)taskObjectForDictionary:(NSDictionary *)dictionary{
    Task *taskObject = [[Task alloc] initWithData:dictionary];
    
    return taskObject;
}


@end
