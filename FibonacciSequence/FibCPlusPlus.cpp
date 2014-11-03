//
//  FibCPlusPlus.cpp
//  FibonacciSequence
//
//  Created by chuck on 11/2/14.
//  Copyright (c) 2014 Chuck Gaffney. All rights reserved.
//


#include <iostream>
#include <vector>
#include <stdlib.h>     /* srand, rand */
#include <time.h>       /* time */
#include <algorithm>    // std::sort
#include <map>
#include <chrono>

#include "FibCPlusPlus.h"

double * fibArray_ ;

//creates a memoize Generic function
template<class InType, class OutType>
std::function<OutType(InType)> memoize(std::function<OutType(InType)> foo)
{
    // return a lambda, this is a function
    return [foo](InType n){
        static std::map<InType,OutType> memo;
        
        OutType ret;
        if(memo.count(n)>0) {
            ret =memo[n];
            return ret;
        }
        ret=foo(n);
        memo[n]=ret;
        return ret;
    };
}

std::function<unsigned(unsigned)> fibo1=[](unsigned n)
{
    if(n<=1)
        return n;
    return fibo1(n-1)+fibo1(n-2);
};


//recursive method; too slow, increases by nlog(n)
int fibonacci(double n)
{
    return ( n<=2 ? 1 : fibonacci(n-1) + fibonacci(n-2) );
};

double * FibCPlusPlus::Fib(double times)
{
    
    fibArray_ = &fibArray_[int(times)];
    
    fibo1=memoize(fibo1);
    
    std::chrono::high_resolution_clock::time_point begin = std::chrono::high_resolution_clock::now();
    
    //fibArray_ = fibo1(times);

    
    std::chrono::high_resolution_clock::time_point end = std::chrono::high_resolution_clock::now();
    
    std::chrono::duration<double> time_span = std::chrono::duration_cast<std::chrono::duration<double>>(end - begin);
    
    std::cout << "C++ executionTime: " << time_span.count() << " seconds for " << times << " sequences." << std::endl;
    
    return fibArray_;
    
}