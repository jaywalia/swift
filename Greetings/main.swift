//
//  main.swift
//  Greetings
//
//  Created by Jatindera Walia on 3/27/20.
//  Copyright © 2020 Kirei Kode. All rights reserved.
//

import Foundation


// Say Hello
print("Hello, World!")
print("Greetings By Kirei Kode!")

// Maps
var daysInMonth = [String: Int]()

daysInMonth["Jan"] = 31
daysInMonth["Feb"] = 28

print(daysInMonth)

// maps & arrays
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

// loop
var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

// while
var x = 2
repeat {
    x *= 2
} while x < 100
print(x)

// range
var t = 0
for i in 1...100 {
    t += i
}
print(t)

// functions & interpolation
func greet( greeting: String, person: String, day: String) -> String {
    return "\(greeting) \(person). Today is \(day)"
}

print(greet(greeting:"Namaste ", person:"Jay ", day:"Friday "))

// functions returning tuples
func stats( grades: [Int] )
    -> ( n: Int, min : Int, max: Int, sum: Int, mean: Float) {
    
        let n = grades.count;
        var min = grades[0]
        var max = grades[0]
        var sum = 0
        
        for g in grades {
            if g < min { min = g }
            if max < g { max = g }
            sum += g
        }
        
        let mean = Float(sum) / Float(n)
        
        return (n, min, max, sum, mean)
}

print(stats(grades: [1, 2, 3, 4, 5, 6, 7, 8 , 9, 10]))

// function closure
func counterFactory(start: Int) -> ( () -> Int ) {

    var c = start
    func counter() -> Int {
        c += 1
        return c
    }
    
    return counter;
}

var count1To10 = counterFactory(start: 0)
for _ in 1...10 {
    print(count1To10(), terminator: ",")
}
print()

var count20To50 = counterFactory(start: 20)
for _ in 1...30 {
    print(count20To50(), terminator: ",")
}
print()

// function as a parameter
func exists(list: [Int], condition: ((Int) -> Bool) ) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

// function larger than 100
func largerThan100(n: Int) -> Bool {
    return n > 100
}


let n1 = [1,2,3,4]
let n2 = [1,2,3,4,101]
print( exists(list: n1, condition: largerThan100 ) )
print( exists(list: n2, condition: largerThan100 ) )

// function lambdas
let n3 = n1.map({
    (n: Int) -> Int in
    return n % 2 == 0 ? n * 2 : 0
})

print(n3)

let n4a = n1.sorted(by: {
    (n1: Int, n2: Int) -> Bool in
        return n1 > n2
})
let n4b = n1.sorted(by: {$0 > $1} )
let n4 = n1.sorted{ $0 > $1 }
print(n4b)

// classes

class Shape {
    
    var noOfSides = 0
    let message = "Shape with"

    func describe() -> String {
        return message + " \(noOfSides) sides."
    }
    
    func setSides(sides: Int) {
        noOfSides = sides
    }
}

let triangle = Shape()
triangle.setSides(sides:3)
print(triangle.describe())

// Class with init
class NamedShape {
    var name: String
    var noOfSides: Int = 0
    let message: String = "Shape with "
    
    init(name: String) {
        self.name = name
    }
    
    // clean up in deinit
    deinit {
        noOfSides = 0 // not required
    }
    
    func describe() -> String {
        return message + "\(noOfSides) sides."
    }
    
}

// inherit

class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        noOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func describe() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let sq = Square(sideLength: 5.2, name: "my test square")
print(sq.area())
print(sq.describe())


// circle class
class Circle : NamedShape {
    var radius : Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        noOfSides = 0
    }
    
    func area() -> Double {
        return Double.pi*radius*radius;
    }
    
    override func describe() -> String {
        return "A circle with radius of length \(radius)"
    }
}

let c = Circle(radius : 3, name: "super circle")
print("c area: \(c.area())")
print(c.describe())

// Equilateral Triangle

class EquilateralTriangle : NamedShape {
    var sideLength: Double = 0.0
    init(sideLength: Double, name: String) {
            self.sideLength = sideLength
            super.init(name: name)
            noOfSides = 3
        }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func describe() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}


var eqTR = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(eqTR.perimeter)

eqTR.perimeter = 9.9
print(eqTR.sideLength)


// triangle + Square :: will set
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)

triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)


// BASICS

// operators
// unary are prefix and postfix
// binary are infix
// ternary : Only one : if x % 2 == 0 ? return "even" : "odd"
// operands

// assignment operator
let xx = 1
var xy = 2
xy = xx

let (x1, y1) = (1, 2)
//if x = y {} Assignment operator doesn't return anything UNLIKE C

// arithmetic operator
// + , - , *, / ( NO OVERFLOW BY DEFAULT )

var n11 = Int.max;
print ("n1 : \(n11)")
//var n21 = n11 + 1
//print ("n2 : \(n21)")

// remainder operator : 9 % 4
// 9 = (4*2) + 1 ( 1 is returned)

// unary minus operator
// - (-1) = + 1

// unary plus operator : only to provide symmetry when writing negative numbers
// compound assignment operators : a += 1
// comparison operators : ==, !=, <, > , >=, <= , === , !==
// tuple comparison (1, carrot) < (2, banana) : left to right comparison
// ternary operator : q ? a1: a2;
// Nil coalescing operator :  a ?? b is equivalent to a != nil ? a! : b
//      notice the a! : it means i know a is not nil, go ahead and forcefull unwrap it
// Range operators : 1...5 (includes 5)  1..<5 (doesn't include 5) [2...] (from 2 to infinity) [...7] books also has half range ops
// Logical &&, ||, !
//
//


