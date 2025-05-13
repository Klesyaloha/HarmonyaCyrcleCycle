//
//  Month.swift
//  HarmonyaCyrcleCycle
//
//  Created by Klesya on 5/13/25.
//

import Foundation

struct Month {
    var month: Int
    var year: Int
    var days: [Day]

    init(month: Int, year: Int) {
        self.month = month
        self.year = year
        self.days = Self.generateDays(for: month, year: year)
    }

    static func generateDays(for month: Int, year: Int) -> [Day] {
        var result: [Day] = []
        let calendar = Calendar.current
        let components = DateComponents(year: year, month: month)
        guard let startDate = calendar.date(from: components),
              let range = calendar.range(of: .day, in: .month, for: startDate) else {
            return []
        }

        for day in range {
            if let date = calendar.date(from: DateComponents(year: year, month: month, day: day)) {
                result.append(Day(date: date))
            }
        }
        return result
    }
}
