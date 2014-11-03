//
//  ObjCPP.m
//  FibonacciSequence
//
//  Created by chuck on 11/2/14.
//  Copyright (c) 2014 Chuck Gaffney. All rights reserved.
//

#import "ObjCPP.h"
#import "FibCPlusPlus.h"

@implementation ObjCPP

+ (void) fibCPlusPlus: (double) limit
{
    FibCPlusPlus::Fib((double)limit);
}

@end
