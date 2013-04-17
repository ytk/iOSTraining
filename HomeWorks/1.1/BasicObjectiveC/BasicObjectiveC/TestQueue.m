//
//  TestQueue.m
//  BasicObjectiveC
//
//  Created by 長島 豊 on 2013/04/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "TestQueue.h"

@interface TestQueue()

@property (nonatomic, retain) NSMutableArray *mutableArray;

@end

@implementation TestQueue

- (id)init
{
	self = [super init];
    _mutableArray = [[NSMutableArray alloc] init];
    return self;
}

- (void)push:(id)object
{
    [_mutableArray addObject:object];
}

- (id)pop
{
    id element = [_mutableArray objectAtIndex:0];
    [_mutableArray removeObjectAtIndex:0];
    return element;
}

- (NSInteger)size
{
    return [_mutableArray count];
}

- (id)get
{
    return _mutableArray;
}

@end
