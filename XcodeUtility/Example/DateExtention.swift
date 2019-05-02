//
//  DateExtentions.swift
//  Bazhookah
//
//  Created by Muhammad Jabbar on 1/31/18.
//  Copyright © 2018 Muhammad Jabbar. All rights reserved.
//

import UIKit

extension Date {
    
    func yearsTo(date:Date) -> Int{
        return Calendar.current.dateComponents([.year], from: self, to: date).year!
    }
    func monthsTo(date:Date) -> Int{
        return Calendar.current.dateComponents([.month], from: self, to: date).month!
    }
    func weeksTo(date:Date) -> Int{
        return Calendar.current.dateComponents([.weekOfYear], from: self, to: date).weekOfYear!
    }
    func daysTo(date:Date) -> Int{
        return Calendar.current.dateComponents([.day], from: self, to: date).day!
    }
    func hoursTo(date:Date) -> Int{
        return Calendar.current.dateComponents([.hour], from: self, to: date).hour!
    }
    func minutesTo(date:Date) -> Int{
        return Calendar.current.dateComponents([.minute], from: self, to: date).minute!
    }
    func secondsTo(date:Date) -> Int{
        return Calendar.current.dateComponents([.second], from: self, to: date).second!
    }
    
    func offsetTo(date:Date) -> String {
        var value = 0
        var postfix = ""
        if yearsTo(date: date)   > 0 {
            value = yearsTo(date: date)
            postfix = "year"
            if value == 1   {
                return "next year"
            }
        }
        else if monthsTo(date: date)  > 0 {
            value = monthsTo(date: date)
            postfix = "month"
            if value == 1   {
                return "next month"
            }
        }
        else if weeksTo(date: date)   > 0 {
            value = weeksTo(date: date)
            postfix = "week"
            if value == 1   {
                return "next week"
            }
        }
        else if daysTo(date: date)    > 0 {
            value = daysTo(date: date)
            postfix = "day"
            if value == 1   {
                return "tomorrow"
            }
        }
        else if hoursTo(date: date)   > 0 {
            value = hoursTo(date: date)
            postfix = "hour"
        }
        else if minutesTo(date: date) > 0 {
            value = minutesTo(date: date)
            postfix = "minute"
        }
        else {
            value = secondsTo(date: date)
            postfix = "second"
        }
        
        if value > 1 || value == 0    {
            postfix += "s"
        }
        
        return "\(value) \(postfix)"
    }
//    ==============================================================================================================================
    
    func yearsFrom(date:Date) -> Int{
        return Calendar.current.dateComponents([.year], from: date, to: self).year!
    }
    func monthsFrom(date:Date) -> Int{
        return Calendar.current.dateComponents([.month], from: date, to: self).month!
    }
    func weeksFrom(date:Date) -> Int{
        return Calendar.current.dateComponents([.weekOfYear], from: date, to: self).weekOfYear!
    }
    func daysFrom(date:Date) -> Int{
        return Calendar.current.dateComponents([.day], from: date, to: self).day!
    }
    func hoursFrom(date:Date) -> Int{
        return Calendar.current.dateComponents([.hour], from: date, to: self).hour!
    }
    func minutesFrom(date:Date) -> Int{
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute!
    }
    func secondsFrom(date:Date) -> Int{
        return Calendar.current.dateComponents([.second], from: date, to: self).second!
    }
    
    func offsetFrom(date:Date) -> String {
        var value = 0
        var postfix = ""
        if yearsFrom(date: date)   > 0 {
            value = yearsFrom(date: date)
            postfix = "year"
        }
        else if monthsFrom(date: date)  > 0 {
            value = monthsFrom(date: date)
            postfix = "month"
        }
        else if weeksFrom(date: date)   > 0 {
            value = weeksFrom(date: date)
            postfix = "week"
        }
        else if daysFrom(date: date)    > 0 {
            value = daysFrom(date: date)
            postfix = "day"
        }
        else if hoursFrom(date: date)   > 0 {
            value = hoursFrom(date: date)
            postfix = "hour"
        }
        else if minutesFrom(date: date) > 0 {
            value = minutesFrom(date: date)
            postfix = "minute"
        }
        else {
            value = secondsFrom(date: date)
            postfix = "second"
        }
        
        if value > 1 || value == 0    {
            postfix += "s"
        }
        
        return "\(value) \(postfix)"
    }
    
    func stringFromLocalDateFormate(formateString:String = "yyyy-MM-dd HH:mm:ss")-> String
    {
        let localDateFormatter = DateFormatter()
        localDateFormatter.timeZone = TimeZone.current
        localDateFormatter.dateFormat = formateString
        localDateFormatter.locale = Locale(identifier: "en_US_POSIX")

        let localDate = localDateFormatter.string(from: self)
        return localDate
    }
    func stringFromDate()-> String
    {
        let localDateFormatter = DateFormatter()
        localDateFormatter.timeZone = TimeZone.current
        localDateFormatter.dateStyle = .medium
        localDateFormatter.doesRelativeDateFormatting = true
        localDateFormatter.locale = Locale(identifier: "en_US_POSIX")

        let localDate = localDateFormatter.string(from: self)
        return localDate
    }
    func dateFromStringWithUTC(formateString:String = "yyyy-MM-dd HH:mm:ss")-> String
    {
        let utcDateFormatter = DateFormatter()
        utcDateFormatter.dateFormat = formateString
        utcDateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        utcDateFormatter.locale = Locale(identifier: "en_US_POSIX")

        debugPrint(self)
        let utcDate = utcDateFormatter.string(from: self)
        return utcDate
    }
    func isGreaterThanDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    func isLessThanDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedAscending {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    func equalToDate(dateToCompare: Date) -> Bool {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare) == ComparisonResult.orderedSame {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    
    func addMonths(monthsToAdd: Int) -> Date {
        
        let sevenDaysAgo = Calendar.current.date(byAdding: .month, value: monthsToAdd, to: self)
        return sevenDaysAgo!
    }
    func addDays(daysToAdd: Int) -> Date {
        let secondsInDays: TimeInterval = Double(daysToAdd) * 60 * 60 * 24
        let dateWithDaysAdded: Date =  self.addingTimeInterval(secondsInDays)
        return dateWithDaysAdded
    }
    
    func addHours(hoursToAdd: Int) -> Date {
        let secondsInHours: TimeInterval = Double(hoursToAdd) * 60 * 60
        let dateWithHoursAdded: Date = self.addingTimeInterval(secondsInHours)
        
        //Return Result
        return dateWithHoursAdded
    }
    
    
    func stringWithUTCFormate(formateString:String = "yyyy-MM-dd")-> String
    {
        let localDateFormatter = DateFormatter()
        localDateFormatter.dateFormat = formateString
        localDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let localDate = localDateFormatter.string(from: self)
        return localDate
    }
    func startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
    }
    func endOfMonth() -> Date {
            return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.startOfMonth())!
    }
    func dateString(displayFormatter displayFormate: String? = "MMMM dd, yyyy",
                    displayTimeZone displayZone: DateTimeZone? = .CURRENT_TIME_ZONE,
                    displayLocale localeIdentifier : DateTimeLocale = .CURRENT_LOCALE) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = displayFormate
        dateFormatter.timeZone = displayZone == .CURRENT_TIME_ZONE ? TimeZone.current : TimeZone(identifier: displayZone!.rawValue)
        dateFormatter.locale = Locale(identifier: DateTimeLocale.en_US_POSIX.rawValue)
        if localeIdentifier == .CURRENT_LOCALE {
            dateFormatter.locale = Locale.current
        }
        return dateFormatter.string(from:self)
    }
}
