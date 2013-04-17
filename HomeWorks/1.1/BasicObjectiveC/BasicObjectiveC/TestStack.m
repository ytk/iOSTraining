//
//  TestStack.m
//  BasicObjectiveC
//
//  Created by 長島 豊 on 2013/04/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "TestStack.h"

@interface TestStack()

@property (nonatomic, retain) NSMutableArray *mutableArray;

@end

@implementation TestStack

- (void)push:(id)object
{
    [_mutableArray insertObject:object atIndex:0];
}

@end