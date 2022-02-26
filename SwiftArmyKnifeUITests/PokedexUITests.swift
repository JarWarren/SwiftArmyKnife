//
//  PokedexUITests.swift
//  PokedexUITests
//
//  Created by Paola Warren on 2/26/22.
//

import XCTest

class PokedexUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        app = XCUIApplication()
        app.launch()
    }
    
    func testSearchByIDAndName() {
        app.buttons["Pokedex"].tap()
        XCTAssertTrue(app.textFields.firstMatch.waitForExistence(timeout: 5))
        
        XCTAssertTrue(app.staticTexts["Pokedex"].exists)
        XCTAssertFalse(app.images.firstMatch.exists)
        
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText("151")
        app.buttons["Search"].tap()
        
        XCTAssertTrue(app.images["mew sprite"].waitForExistence(timeout: 10))
        XCTAssertTrue(app.staticTexts["Mew"].exists)
        
        app.textFields.firstMatch.tap()
        let deleteString = String(repeating: XCUIKeyboardKey.delete.rawValue, count: 3)
        app.textFields.firstMatch.typeText(deleteString)
        app.textFields.firstMatch.typeText("mewtwo")
        
        app.buttons["Search"].tap()
        
        XCTAssertTrue(app.images["mewtwo sprite"].waitForExistence(timeout: 10))
        XCTAssertTrue(app.staticTexts["Mewtwo"].exists)
    }
}
