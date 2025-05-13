//
//  CustomCycle.swift
//  HarmonyaCyrcleCycle
//
//  Created by Klesya on 5/13/25.
//

import Foundation

struct CustomCycle: Identifiable {
    let id = UUID()
    var title: String                 // "Cycle lunaire", "Cycle hormonal"
    var startDate: Date              // point de départ
    var totalDuration: Int           // nombre de jours du cycle complet
    var phases: [CyclePhase]         // différentes étapes

    /// Calcule la phase active à une date donnée
    func phase(on date: Date) -> CyclePhase? {
        let calendar = Calendar.current
        let daysSinceStart = calendar.dateComponents([.day], from: startDate, to: date).day ?? 0
        let dayInCycle = (daysSinceStart % totalDuration + totalDuration) % totalDuration

        var cumulative = 0
        for phase in phases {
            cumulative += phase.duration
            if dayInCycle < cumulative {
                return phase
            }
        }
        return nil
    }
}
