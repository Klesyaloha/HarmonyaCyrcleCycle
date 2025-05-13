//
//  CalendarView.swift
//  HarmonyaCyrcleCycle
//
//  Created by Klesya on 5/13/25.
//

import SwiftUI

struct CalendarView: View {
    @StateObject private var calendarManager = CalendarManager(month: 5, year: 2025)
    @State private var showingAddEvent = false

    let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "d"
        return f
    }()

    var body: some View {
        NavigationView {
            VStack(spacing: 50){
                Image("harmonyaLogo")
                    .padding(.top, -100)
                Button(action: {
                    calendarManager.goToToday()
                }) {
                    Label("Revenir à aujourd’hui 📍", systemImage: "calendar")
                        .font(.subheadline)
                        .padding(8)
                        .background(Color.sunset.opacity(0.2))
                        .cornerRadius(8)
                        .foregroundColor(.black)
                }
                .padding()
                
                VStack {
                    HStack {
                        Button(action: {
                            calendarManager.goToPreviousMonth()
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Text("\(monthName(calendarManager.currentMonth.month)) \(calendarManager.currentMonth.year)")
                            .font(.PlayfairDisplaySC.bold(size: 40))
                        
                        Spacer()
                        
                        Button(action: {
                            calendarManager.goToNextMonth()
                        }) {
                            Image(systemName: "chevron.right")
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    LazyVGrid(columns: Array(repeating: .init(.flexible()), count: 7), spacing: 10) {
                        ForEach(calendarManager.currentMonth.days) { day in
                            Button(action: {
                                calendarManager.selectedDate = day.date
                            }) {
                                VStack {
                                    Text(dateFormatter.string(from: day.date))
                                        .fontWeight(.medium)
                                        .frame(maxWidth: .infinity)
                                        .padding(8)
                                        .background(Calendar.current.isDate(day.date, inSameDayAs: calendarManager.selectedDate ?? Date()) ? Color.blue.opacity(0.2) : Color.clear)
                                        .clipShape(Circle())
                                    if !day.events.isEmpty {
                                        Circle()
                                            .fill(Color.red)
                                            .frame(width: 6, height: 6)
                                    }
                                }
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal)
                    
                    if let selected = calendarManager.selectedDate {
                        EventListView(date: selected, events: calendarManager.events(for: selected))
                    }
                    
                    Button(" + Ajouter un événement") {
                        showingAddEvent = true
                    }
                    .foregroundColor(.lilac)
                    .padding()
                    .sheet(isPresented: $showingAddEvent) {
                        if let selected = calendarManager.selectedDate {
                            AddEventView(date: selected, manager: calendarManager)
                        }
                    }
                }
                .padding()
                .background(
                    Rectangle()
                        .foregroundStyle(.olivine.opacity(0.5))
                        .frame(width: 390.0, height: 480)
                        .cornerRadius(30)
                )
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    func monthName(_ month: Int) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.monthSymbols[month - 1].capitalized
    }
}


#Preview {
    CalendarView()
}
