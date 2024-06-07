//
//  BitternessExtractTest.swift
//  craftbrew-designer-swiftuiTests
//
//  Created by David Van Fleet on 6/7/24.
//

import XCTest
@testable import craftbrew_designer_swiftui

class BitternessExtractTests: XCTestCase {
    var recipe: RecipeFormValues!

    override func setUp() {
        recipe = buildMockExtractRecipe()
    }

    override func tearDown() {
        recipe = nil
    }
    
    func testEstimateBitternessCalculator() {
        let result = calculateEstimateBitterness(recipe: recipe)
        XCTAssertEqual(result, 22)
    }
}
