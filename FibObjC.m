//
//  FibObjC.m
//  FibonacciSequence
//
//  Created by chuck on 11/2/14.
//  Copyright (c) 2014 Chuck Gaffney. All rights reserved.
//


#import "FibObjC.h"

@implementation FibObjC

static NSMutableArray* fibArray;

+ (void) ObjCFib: (NSInteger) array_size
{
    
    NSDate *methodStart = [NSDate date];
    
    
    NSMutableArray* arr = [[NSMutableArray alloc]init];
    for (int k =0; k< array_size; k++)
    {
        if(k<2)
        {
            [arr addObject:[NSString stringWithFormat:@"%d",k]];
            continue;
        }
        else
        {
            int fib = [[arr objectAtIndex:k-2] intValue] + [[arr objectAtIndex:k-1] intValue];
            [arr addObject:[NSString stringWithFormat:@"%d",fib]];
        }
        
        
    }
    
    fibArray = arr;
    
    NSDate *methodFinish = [NSDate date];
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
    NSLog(@"ObjC Fibonacci executionTime: %f seconds for %ld sequences. \n", executionTime, (long)array_size);
    
}

@end
