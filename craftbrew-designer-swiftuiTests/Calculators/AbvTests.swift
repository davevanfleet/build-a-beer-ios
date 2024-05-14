//
//  AbvTests.swift
//  craftbrew-designer-swiftuiTests
//
//  Created by David Van Fleet on 5/9/24.
//

import XCTest
@testable import craftbrew_designer_swiftui

class AbvTests: XCTestCase {
    var recipe: Recipe!

    override func setUp() {
        recipe = buildMockRecipe()
    }

    override func tearDown() {
        recipe = nil
    }
    
    func testAbvCalculator() {
        let result = calculateAbv(recipe: recipe)
        XCTAssertEqual(result, 5.4)
    }
}
