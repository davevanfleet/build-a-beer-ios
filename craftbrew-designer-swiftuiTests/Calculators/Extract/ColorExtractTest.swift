//
//  ColorExtractTest.swift
//  craftbrew-designer-swiftuiTests
//
//  Created by David Van Fleet on 6/7/24.
//

import XCTest
@testable import craftbrew_designer_swiftui

class ColorExtractTests: XCTestCase {
    var recipe: RecipeFormValues!

    override func setUp() {
        recipe = buildMockExtractRecipe()
    }

    override func tearDown() {
        recipe = nil
    }
    
    func testEstimatedColorCalculator() {
        let result = calculateEstimatedColor(recipe: recipe)
        XCTAssertEqual(result, 11)
    }
}
