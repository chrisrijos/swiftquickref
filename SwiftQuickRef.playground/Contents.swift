//: Playground - noun: a place where people can play

import UIKit
import Foundation


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

typealias Payload = [String: AnyObject]
let TopAppURL = "https://itunes.apple.com/us/rss/topgrossingipadapplications/limit=25/json"

func getTopAppsWithSuccess(success: ((iTunesData: NSData!) -> Void)) {
    //1
    //loadDataFromURL(NSURL(string: TopAppURL)!, completion:{(data, error) -> Void in
        //2
        //if let data = data {
            //3
            //success(iTunesData: data)
        //}
    //})
}

func prettyPrintJson(object: AnyObject?) -> String {
    var prettyResult: String = ""
    if object == nil {
        return ""
    } else if let resultArray = object as? [AnyObject] {
        var entries: String = ""
        for index in 0..<resultArray.count {
            if (index == 0) {
                entries = "\(resultArray[index])"
            } else {
                entries = "\(entries), \(prettyPrintJson(resultArray[index]))"
            }
        }
        prettyResult = "[\(entries)]"
    } else if object is NSDictionary  {
        let objectAsDictionary: [String: AnyObject] = object as! [String: AnyObject]
        prettyResult = "{"
        var entries: String = ""
        for (key,_) in objectAsDictionary {
            entries = "\"\(entries), \"\(key)\":\(prettyPrintJson(objectAsDictionary[key]))"
        }
        prettyResult = "{\(entries)}"
        return prettyResult
    } else if let objectAsNumber = object as? NSNumber {
        prettyResult = "\(objectAsNumber.stringValue)"
    } else if let objectAsString = object as? NSString {
        prettyResult = "\"\(objectAsString)\""
    }
    return prettyResult
}

