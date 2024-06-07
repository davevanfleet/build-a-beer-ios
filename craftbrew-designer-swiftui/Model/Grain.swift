//
//  Grain.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

struct Grain: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let lovibond: Double
    let fineGrindDryBasisPercentage: Double
    let suggestedMaximumUsage: Int
    let maltster: String
}
