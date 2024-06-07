//
//  Yeast.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

struct Yeast: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let minimumTemperature: Int
    let maximumTemperature: Int
    let fermentation: String
    let attenuation: Double
}
