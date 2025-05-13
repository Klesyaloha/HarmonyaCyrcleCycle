//
//  CyclePhase.swift
//  HarmonyaCyrcleCycle
//
//  Created by Klesya on 5/13/25.
//

import Foundation
import SwiftUI

struct CyclePhase: Identifiable {
    let id = UUID()
    var name: String               // 🌕 Pleine Lune, Ovulation, Hiver...
    var duration: Int             // en jours
    var color: Color             // pour affichage
    var symbol: String            // ex: "moon.fill", "drop.fill"
}
