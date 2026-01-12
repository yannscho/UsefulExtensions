import SwiftUI

extension Date {
    var calendar: Calendar { Calendar.current }
    
    public var mondayOfWeek: Date {
        let components = calendar.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)
        return calendar.date(from: components) ?? Date.now
    }
    
    public func adding(_ value: Int, _ component: Calendar.Component) -> Date {
        calendar.date(byAdding: component, value: value, to: self) ?? Date.now
    }
    
    public func isSameDay(as other: Date) -> Bool {
        calendar.isDate(self, inSameDayAs: other)
    }
    
    public var asString: DateFormatter.Output {
        DateFormatter.Output(date: self)
    }
}

extension DateFormatter {
    public struct Output {
        let date: Date
        
        var abbreviated: String {
            date.formatted(date: .abbreviated, time: .omitted)
        }
        
        var long: String {
            date.formatted(date: .long, time: .omitted)
        }
        
        var numeric: String {
            date.formatted(date: .numeric, time: .omitted)
        }
        
        var full: String {
            date.formatted(date: .complete, time: .omitted)
        }
        
        var weekdayShort: String {
            date.formatted(.dateTime.weekday(.abbreviated))
        }
        
        var weekday: String {
            date.formatted(.dateTime.weekday(.wide))
        }
        
        var monthShort: String {
            date.formatted(.dateTime.month(.abbreviated))
        }
        
        var month: String {
            date.formatted(.dateTime.month(.wide))
        }
        
        var day: String {
            date.formatted(.dateTime.day())
        }
    }
}

/*
/// First day of the month
    var startOfMonth: Date {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: self)
        return calendar.date(from: components)!
    }
    
    /// Last day of the month
    var endOfMonth: Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: DateComponents(month: 1, day: -1), to: startOfMonth)!
    }
*/
