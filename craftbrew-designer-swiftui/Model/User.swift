//
//  User.swift
//  craftbrew-designer-swiftui
//
//  Created by David Van Fleet on 5/28/24.
//

import Foundation

struct User: Decodable, Identifiable, Hashable {
    let id: Int
    let firstName: String
    let lastName: String
    let email: String
}
