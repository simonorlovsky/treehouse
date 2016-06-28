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
