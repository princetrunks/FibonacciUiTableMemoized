//
//  Fibonacci.swift
//  FibonacciSequence F_n = F_{n-1} + F_{n-2}
//
//  Created by chuck on 10/30/14.
//  Copyright (c) 2014 Chuck Gaffney. All rights reserved.
//

import Foundation


class Fibonacci {
    
    var upperBound : Int?
    
    var current : Int?
    
    init(){
        
        self.current = 0
        
    }
    
    //runs the Fib Sequence a set number of times
    func run(times:Double){
        
        //creates the variable that utilizies the generic function
           //F_n = F_{n-1} + F_{n-2}
        let fibonacci: (Int ->  Double) = memoize {
            fibonacci, n in
            return (n < 2) ? Double(n) : fibonacci(n - 1) + fibonacci(n - 2)
        }
        
        //calculate time to execute Fib Sequence
        let startTime = CFAbsoluteTimeGetCurrent()
        
        for n in 1...Int(times) {
            
            fibNumberArray.append(fibonacci(n))
        }
        
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        
        //precision formating
        let secondsFormat = ".5"
        
        let timesFormat = ".0"
        
        //display time it took to execute Fib Sequences
        println("Swift Fibonacci executionTime:\(timeElapsed.format(secondsFormat)) seconds for \(times.format(timesFormat)) Fib sequences")
        
    }
    
    
    //F_n = F_{n-1} + F_{n-2}; too slow once at about fib(30)
    func fib(n:Double) -> Double{
        
        let fibonacci: (Int ->  Double) = memoize {
            fibonacci, n in
            return (n < 2) ? Double(n) : fibonacci(n - 1) + fibonacci(n - 2)
        }
        
        return (n<=2 ? 1 : fib(n-1) + fib(n-2))
        
    }
    
    
    //runs Fibonacci number up to the limit number
    func runFibByLimit(limit:Int){
        
        iterateFib(0, next: 1, limit: limit)
        
    }
    
    //Recursive single function method; user sets the number limit
    func iterateFib(current: Int, next: Int, limit: Int) {
        
        //exit method if beyond limit
        if next >= limit {
            return
        }
        
        fibNumberArray.append(Double(current))
        
        let result = current + next
        
        iterateFib(next, next: result, limit: limit)
    }
    
  
}


