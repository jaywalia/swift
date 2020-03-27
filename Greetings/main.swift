//
//  main.swift
//  Greetings
//
//  Created by Jatindera Walia on 3/27/20.
//  Copyright © 2020 Kirei Kode. All rights reserved.
//

import Foundation

print("Hello, World!")
print("Greetings By Kirei Kode!")

var daysInMonth = [String: Int]()

daysInMonth["Jan"] = 31
daysInMonth["Feb"] = 28

print(daysInMonth)

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

var x = 2
repeat {
    x *= 2
} while x < 100
print(x)


var t = 0
for i in 1...100 {
    t += i
}
print(t)

func greet( greeting: String, person: String, day: String) -> String {
    return "\(greeting) \(person). Today is \(day)"
}

print(greet(greeting:"Namaste ", person:"Jay ", day:"Friday "))

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


func exists(list: [Int], condition: ((Int) -> Bool) ) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func largerThan100(n: Int) -> Bool {
    return n > 100
}

let n1 = [1,2,3,4]
let n2 = [1,2,3,4,101]
print( exists(list: n1, condition: largerThan100 ) )
print( exists(list: n2, condition: largerThan100 ) )

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

