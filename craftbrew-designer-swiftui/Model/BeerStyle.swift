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
    let originalGravityMinimum: Float
    let originalGravityMaximum: Float
    let finalGravityMinimum: Float
    let finalGravityMaximum: Float
    let abvMinimum: Float
    let abvMaximum: Float
    let fermentation: Int
    let bjcpCode: String
}
