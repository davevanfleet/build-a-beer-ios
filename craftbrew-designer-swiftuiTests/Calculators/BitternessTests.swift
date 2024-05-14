//
//  BitternessTests.swift
//  craftbrew-designer-swiftuiTests
//
//  Created by David Van Fleet on 5/9/24.
//

import XCTest
@testable import craftbrew_designer_swiftui

class BitternessTests: XCTestCase {
    var recipe: Recipe!

    override func setUp() {
        recipe = buildMockRecipe()
    }

    override func tearDown() {
        recipe = nil
    }
    
    func testEstimateBitternessCalculator() {
        let result = calculateEstimateBitterness(recipe: recipe)
        XCTAssertEqual(result, 21)
    }
}
