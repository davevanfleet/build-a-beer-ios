//
//  SpecificGravityExtractRecipeTests.swift
//  craftbrew-designer-swiftuiTests
//
//  Created by David Van Fleet on 6/7/24.
//

import XCTest
@testable import craftbrew_designer_swiftui

class SpecificGravityExtractRecipeTests: XCTestCase {
    var recipe: RecipeFormValues!

    override func setUp() {
        recipe = buildMockExtractRecipe()
    }

    override func tearDown() {
        recipe = nil
    }
    
    func testPotentialOriginalGravityCalculator() {
        let result = calculatePotentialOriginalGravity(recipe: recipe)
        XCTAssertEqual(result, 1.064)
    }
    
    func testEstimatedOriginalGravityCalculator() {
        let result = calculateEstimatedOriginalGravity(recipe: recipe, brewhouseEfficiency: 0.80)
        XCTAssertEqual(result, 1.051)
    }
    
    func testEstimatedFinalGravityCalculator() {
        let result = calculateEstimatedFinalGravity(recipe: recipe, brewhouseEfficiency: 0.80)
        XCTAssertEqual(result, 1.013)
    }

}
