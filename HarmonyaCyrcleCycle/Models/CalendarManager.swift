//
//  CalendarManager.swift
//  HarmonyaCyrcleCycle
//
//  Created by Klesya on 5/13/25.
//

import Foundation

class CalendarManager: ObservableObject {
    @Published var currentMonth: Month
    @Published var selectedDate: Date? = nil

    init(month: Int, year: Int) {
        self.currentMonth = Month(month: month, year: year)
    }

    func addEvent(_ event: Event) {
        if let index = currentMonth.days.firstIndex(where: { Calendar.current.isDate($0.date, inSameDayAs: event.date) }) {
            currentMonth.days[index].events.append(event)
        }
    }

    func events(for date: Date) -> [Event] {
        return currentMonth.days.first(where: { Calendar.current.isDate($0.date, inSameDayAs: date) })?.events ?? []
    }

    func goToPreviousMonth() {
        var newMonth = currentMonth.month - 1
        var newYear = currentMonth.year

        if newMonth == 0 {
            newMonth = 12
            newYear -= 1
        }

        currentMonth = Month(month: newMonth, year: newYear)
        selectedDate = nil
    }

    func goToNextMonth() {
        var newMonth = currentMonth.month + 1
        var newYear = currentMonth.year

        if newMonth == 13 {
            newMonth = 1
            newYear += 1
        }

        currentMonth = Month(month: newMonth, year: newYear)
        selectedDate = nil
    }
    
    // 🔸 À ajouter dans CalendarManager
    func goToToday() {
        let today = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month], from: today)

        if let month = components.month, let year = components.year {
            currentMonth = Month(month: month, year: year)
            selectedDate = today
        }
    }


}
