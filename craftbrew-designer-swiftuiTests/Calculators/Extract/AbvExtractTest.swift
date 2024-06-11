//
//  AbvExtractTest.swift
//  craftbrew-designer-swiftuiTests
//
//  Created by David Van Fleet on 6/7/24.
//

import XCTest
@testable import craftbrew_designer_swiftui

class AbvExtractTests: XCTestCase {
    var recipe: RecipeFormValues!

    override func setUp() {
        recipe = buildMockExtractRecipe()
    }

    override func tearDown() {
        recipe = nil
    }
    
    func testAbvCalculator() {
        let result = calculateAbv(recipe: recipe, brewhouseEfficiency: 0.80)
        XCTAssertEqual(result, 6.2)
    }
}
