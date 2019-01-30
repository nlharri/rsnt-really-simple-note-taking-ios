//
//  ReallySimpleNoteDateHelper.swift
//  rsnt-really-simple-note-taking-ios
//
//  Created by Németh László Harri on 2019. 01. 25..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import Foundation

class ReallySimpleNoteDateHelper {
    static func convertDate(date: NSDate) -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: Date()) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "EEEE, MMM d, yyyy, hh:mm:ss"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        return myStringafd
    }

    static func convertDate(date: Date) -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: Date()) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "EEEE, MMM d, yyyy, hh:mm:ss"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        return myStringafd
    }
}

extension Date {
    func toMillis() -> Int64! {
        return Int64((self.timeIntervalSince1970 * 1000).rounded())
    }
    
    init(milliseconds:Int64!) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds / 1000))
    }
}
