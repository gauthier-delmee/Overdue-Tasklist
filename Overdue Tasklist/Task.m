//
//  Task.m
//  Overdue Tasklist
//
//  Created by Gauthier Delmee on 28/07/2014.
//  Copyright (c) 2014 Expectancy. All rights reserved.
//

#import "Task.h"

@implementation Task

-(id)init{
    self = [self initWithData:nil];
    
    return self;
}

-(id)initWithData:(NSDictionary *)data{
    //initialize the Task object by using the intializer method of NSObject
    self = [super init];
    
    //initialize the object instance with data passed throug the NSDictionary object
    if (self) {
        self.title = data[TASK_TITLE];
        self.description = data[TASK_DESCRIPTION];
        self.date = data[TASK_DUE_DATE];
        self.completion = [data[TASK_COMPLETION] boolValue];
    }
    
    return self;
}

@end
