//
//  Task.h
//  Overdue Tasklist
//
//  Created by Gauthier Delmee on 28/07/2014.
//  Copyright (c) 2014 Expectancy. All rights reserved.
//

#import <Foundation/Foundation.h>

#define TASK_TITLE @"title"
#define TASK_DESCRIPTION @"description"
#define TASK_DUE_DATE @"date"
#define TASK_COMPLETION @"completion"

@interface Task : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSDate *date;
@property (nonatomic) BOOL completion;

@end
