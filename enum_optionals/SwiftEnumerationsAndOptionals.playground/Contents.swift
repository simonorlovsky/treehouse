//: Playground - noun: a place where people can play

enum Day {
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    case Sunday
}

enum DayType {
    case WeekDay
    case WeekEnd
}

func weekdayOrWeekend(day: Day) -> DayType {
    switch day {
    case .Saturday, .Sunday: return .WeekEnd
    default: return .WeekDay
    }
}

func muteNotifications(dayType: DayType) -> Bool {
    switch dayType {
    case .WeekEnd: return true
    case .WeekDay: return false
    }
}

let dayType = weekdayOrWeekend(.Sunday)

//associated enums
//Methods on enumeration

// wrapper = makes class easier to use
import UIKit

enum ColorComponents {
    case RGB(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    case HSB(CGFloat, CGFloat, CGFloat, CGFloat)
    
    func color() -> UIColor {
        switch self {
        case .RGB(let redValue, let greenValue, let blueValue, let alphaValue):
            return UIColor(red: redValue/255.0, green: greenValue/255.0, blue: blueValue/255.0, alpha: alphaValue)
        case .HSB(let hueValue, let saturationValue, let brightnessValue, let alphaValue):
            return UIColor(hue: hueValue/360.0, saturation: saturationValue/100.0, brightness: brightnessValue/100.0, alpha: alphaValue)
        }
    }
}

ColorComponents.RGB(red: 61.0, green: 120.0, blue: 198.0, alpha: 1.0).color()


import Foundation

enum UIBarButtonStyle {
    case Done
    case Plain
    case Bordered
}

class UIBarButtonItem {
    
    var title: String?
    let style: UIBarButtonStyle
    var target: AnyObject?
    var action: Selector
    
    init(title: String?, style: UIBarButtonStyle, target: AnyObject?, action: Selector) {
        self.title = title
        self.style = style
        self.target = target
        self.action = action
    }
}

enum Button {
    case Done(String)
    case Edit(String)
    
    func toUIBarButtonItem(title: String, style: UIBarButtonStyle, target: String, action: Selector) -> UIBarButtonItem {
        return UIBarButtonItem(title: title, style: style, target: target, action: action)
    }
}

let doneButton = Button.Done("Done")

/*
 optionals
 - allow for the absence of data
 */





