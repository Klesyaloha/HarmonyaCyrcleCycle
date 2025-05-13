//
//  Day.swift
//  HarmonyaCyrcleCycle
//
//  Created by Klesya on 5/13/25.
//

import Foundation

struct Day: Identifiable {
    let id = UUID()
    var date: Date
    var events: [Event] = []
}
