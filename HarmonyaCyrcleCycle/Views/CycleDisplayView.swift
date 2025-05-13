//
//  CycleDisplayView.swift
//  HarmonyaCyrcleCycle
//
//  Created by Klesya on 5/13/25.
//

import SwiftUI

struct CycleDisplayView: View {
    var cycle: CustomCycle
    var date: Date

    var body: some View {
        if let phase = cycle.phase(on: date) {
            VStack(spacing: 8) {
                Text("Cycle: \(cycle.title)")
                    .font(.headline)

                Label(phase.name, systemImage: phase.symbol)
                    .padding()
                    .background(phase.color.opacity(0.2))
                    .cornerRadius(10)

                Text("Jour \(dayInCycle(for: date, in: cycle) + 1) / \(cycle.totalDuration)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        } else {
            Text("Pas de phase trouvée.")
        }
    }

    func dayInCycle(for date: Date, in cycle: CustomCycle) -> Int {
        let days = Calendar.current.dateComponents([.day], from: cycle.startDate, to: date).day ?? 0
        return (days % cycle.totalDuration + cycle.totalDuration) % cycle.totalDuration
    }
}
//
//#Preview {
//    CycleDisplayView()
//}
