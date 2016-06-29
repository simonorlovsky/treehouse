//: Playground - noun: a place where people can play

import UIKit

/*
 Allow you to pass functions like data in your code
 
 "Anonymous function"
 
 higher order function
 */

func printString(aString: String) {
    print("Printing the strings passed in: \(aString)")
}

printString("Hi, my name is Simon")

let someFunction: String -> Void = printString

someFunction("hi")

/****/

func sum(a: Int, b: Int) -> Int {
    return a + b
}

let addTwoNumbers = sum
addTwoNumbers(1, b: 2)



func displayString(a: String -> Void) {
    a("I'm a function inside a function")
}

displayString(printString)


extension Int {
    func apply(operation: Int -> Int) -> Int {
        return operation(self)
    }
}

func double(value: Int) -> Int {
    return value*2
}

10.apply(double)

typealias IntegerFunction = Int -> ()

func gameCounter() -> IntegerFunction {
    func increment(i: Int){
        print("Integer passed in: \(i)")
    }
    return increment
}

let aCounter = gameCounter



