//
//  JournalModelTests.swift
//  JournalModelTests
//
//  Created by Paola Warren on 2/26/22.
//

import XCTest
@testable import SwiftArmyKnife

class JournalModelTests: XCTestCase {
    func testCreateEntry() {
        // Setup
        let model = JournalModel()
        
        // Verify the initial state
        XCTAssertTrue(model.entries.isEmpty)
        
        // Perform the test
        model.createEntry(title: "create", contents: "")
        
        // Verify final state
        XCTAssertEqual(model.entries.first?.title, "create")
    }
    
    func testUpdateEntry() {
        // Setup
        let model = JournalModel()
        model.createEntry(title: "", contents: "")
        guard let entry = model.entries.first else { return XCTFail("entry was nil") }
        
        // Verify the initial state
        XCTAssertEqual(entry.title, "")
        XCTAssertEqual(entry.contents, "")
        
        // Perform test
        model.update(entry: entry, title: "update", contents: "update contents")
        
        // Verify final state
        XCTAssertEqual(entry.title, "update")
        XCTAssertEqual(entry.contents, "update contents")
    }
    
    func testDeleteEntry() {
        // Setup
        let model = JournalModel()
        model.createEntry(title: "", contents: "")
        
        // Verify the initial state
        XCTAssertEqual(model.entries.count, 1)
        
        // Perform test
        let indexSet = IndexSet(integer: 0)
        model.delete(indexSet: indexSet)
        
        // Verify final state
        XCTAssertTrue(model.entries.isEmpty)
    }
}
