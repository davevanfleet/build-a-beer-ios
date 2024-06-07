//
//  Hop.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/9/24.
//

import Foundation

struct Hop: Decodable, Identifiable, Hashable {
    let id: Int
    let name: String
    let forAroma: Bool
    let forBittering: Bool
    let forDryHopping: Bool
    let forFlavor: Bool
    let minimumTypicalAlphaAcid: Double
    let maximumTypicalAlphaAcid: Double
    var averageAlphaAcid: Double {
        get {
            return (minimumTypicalAlphaAcid + maximumTypicalAlphaAcid) / 2
        }
    }
}
