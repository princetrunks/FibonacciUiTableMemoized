//
//  extensions.swift
//  FibonacciSequence
//
//  Created by Chuck Gaffney on 11/2/14.
//  Copyright (c) 2014 Chuck Gaffney. All rights reserved.
//
//  Files used to store project's extensions

import Foundation

//using Swift Generics and tuble returns to utilize a memoization methodology
func memoize<T: Hashable, U>( body: ( (T)->U, T )->U ) -> (T)->U {
    var memo = Dictionary<T, U>()
    var result: ((T)->U)!
    result = { x in
        if let q = memo[x] { return q }
        let r = body(result, x)
        memo[x] = r
        return r
    }
    return result
}


//used to convert the UITextField to large numbers since it's own native functions only have .toInt
 //Optional to allow early checks with if let
extension String {
    var floatValue: Float? {
        return (self as NSString).floatValue
    }
    
    var doubleValue: Double?{
        return (self as NSString).doubleValue
    }
}

//used to make precision formating for Double values
extension Double {
    func format(f: String) -> String {
        return NSString(format: "%\(f)f", self)
    }
}
