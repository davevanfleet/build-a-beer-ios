//
//  AbvTests.swift
//  craftbrew-designer-swiftuiTests
//
//  Created by David Van Fleet on 5/9/24.
//

import XCTest
@testable import craftbrew_designer_swiftui

class AbvTests: XCTestCase {
    var recipe: RecipeFormValues!

    override func setUp() {
        recipe = buildMockRecipe()
    }

    override func tearDown() {
        recipe = nil
    }
    
    func testAbvCalculator() {
        let result = calculateAbv(recipe: recipe, brewhouseEfficiency: 0.80)
        XCTAssertEqual(result, 5.4)
    }
}
