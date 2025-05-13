//
//  Event.swift
//  HarmonyaCyrcleCycle
//
//  Created by Klesya on 5/13/25.
//

import Foundation

struct Event: Identifiable {
    let id = UUID()
    var title: String
    var date: Date
    var description: String
}
