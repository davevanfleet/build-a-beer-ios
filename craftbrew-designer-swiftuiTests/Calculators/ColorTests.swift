//
//  ColorTests.swift
//  craftbrew-designer-swiftuiTests
//
//  Created by David Van Fleet on 5/9/24.
//

import XCTest
@testable import craftbrew_designer_swiftui

class ColorTests: XCTestCase {
    var recipe: Recipe!

    override func setUp() {
        recipe = buildMockRecipe()
    }

    override func tearDown() {
        recipe = nil
    }
    
    func testEstimatedColorCalculator() {
        let result = calculateEstimatedColor(recipe: recipe)
        XCTAssertEqual(result, 13)
    }
}
