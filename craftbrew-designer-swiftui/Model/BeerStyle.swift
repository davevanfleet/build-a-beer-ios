//
//  BeerStyle.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

struct BeerStyle: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let overallImpression: String
    let appearanceDescription: String
    let aromaDescription: String
    let flavorDescription: String
    let mouthfeelDescription: String
    let comments: String
    let history: String
    let ibuMinimum: Int
    let ibuMaximum: Int
    let srmMinimum: Int
    let srmMaximum: Int
    let originalGravityMinimum: Double
    let originalGravityMaximum: Double
    let finalGravityMinimum: Double
    let finalGravityMaximum: Double
    let abvMinimum: Double
    let abvMaximum: Double
    let fermentation: String
    let bjcpCode: String
    let sampleRecipe: Recipe?
    let sampleExtractRecipe: Recipe?
}
