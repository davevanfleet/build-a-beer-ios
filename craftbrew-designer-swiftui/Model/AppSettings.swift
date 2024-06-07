//
//  AppSettings.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/30/24.
//

import Foundation

enum BrewingMethod: Codable {
    case extract
    case allGrain
}

struct AppSettings: Codable {
    var brewingMethod = BrewingMethod.allGrain
    var batchSize = 5.0
    var brewhouseEfficiency = 0.75
}
