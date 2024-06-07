//
//  craftbrew_designer_swiftuiTests.swift
//  craftbrew-designer-swiftuiTests
//
//  Created by David Van Fleet on 5/7/24.
//

import XCTest
@testable import craftbrew_designer_swiftui

class SpecificGravityTests: XCTestCase {
    var recipe: RecipeFormValues!

    override func setUp() {
        recipe = buildMockRecipe()
    }

    override func tearDown() {
        recipe = nil
    }
    
    func testPotentialOriginalGravityCalculator() {
        let result = calculatePotentialOriginalGravity(recipe: recipe)
        XCTAssertEqual(result, 1.069)
    }
    
    func testEstimatedOriginalGravityCalculator() {
        let result = calculateEstimatedOriginalGravity(recipe: recipe, brewhouseEfficiency: 0.80)
        XCTAssertEqual(result, 1.055)
    }
    
    func testEstimatedFinalGravityCalculator() {
        let result = calculateEstimatedFinalGravity(recipe: recipe, brewhouseEfficiency: 0.80)
        XCTAssertEqual(result, 1.014)
    }

}
