//
//  MaltExtract.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 6/7/24.
//

import Foundation

struct MaltExtract: Decodable, Identifiable, Hashable {
    let id: UUID
    let name: String
    let lovibond: Double
    let fermentabilityPercentage: Double
    let suggestedMaximumUsage: Int
    let maltster: String
}
