//
//  TestQueue.h
//  BasicObjectiveC
//
//  Created by 長島 豊 on 2013/04/17.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestQueue : NSObject

- (void)push:(id)object;
- (id)pop;
- (NSInteger)size;
- (id)get;

@end