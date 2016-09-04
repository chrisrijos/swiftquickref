//: Playground - noun: a place where people can play

import UIKit


//Dictionary init
let dictSample : [String : [AnyObject]] = ["Index1": ["Obj1", 1, 4, "Stuff"]]
var arr : [String] = []
typealias Example = (Int, Int, String)
func add(elm: Example) {
}

if let string = dictSample["Index1"] where (dictSample["Index1"]!.count > 0 /*< 1*/){ //built in assertion
    for (key, value) in dictSample{
        print("\(key)")
        for item in value {
            print("\(item))")
        }
    }
}

func swp(one: AnyObject, two: AnyObject) -> (AnyObject, AnyObject){
    return (two, one)
}

func longParams(any: AnyObject...){
    for name: AnyObject in any{
        print("\(name)")
    }
}

var listeners: [(String, (AnyObject?) -> ())]!

func addListener(name: String, action: (change: AnyObject?) -> ()) {
    listeners.append((name, action))
}

func removeListener(name: String) {
    if let idx = listeners.indexOf({ e in return e.0 == name }) {
        listeners.removeAtIndex(idx)
    }
}

func execute(change: Int) {
    for (_, listener) in listeners {
        listener(change)
    }
}

let t = (a: 5, b: "String", c: NSDate())

let mirror = Mirror(reflecting: t)
for (label, value) in mirror.children {
    switch value {
    case is Int:
        print("int")
    case is String:
        print("string")
    case is NSDate:
        print("nsdate")
    default: ()
    }
}

struct Banana {
    let size: Int
    let color: Int
}

typealias BananaTuple = (size: Int, color: Int)
func createBanana(size size: Int, color: Int) -> Banana {
    return Banana(size: size, color: color)
}

print("\(createBanana(size: 15, color: 16))")

