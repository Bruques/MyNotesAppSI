//
//  MY_NOTES_APP_SITests.swift
//  MY_NOTES_APP_SITests
//
//  Created by Bruno Marques on 01/12/24.
//

import XCTest
import SwiftData
@testable import MY_NOTES_APP_SI

final class MY_NOTES_APP_SITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

final class NoteItemTests: XCTestCase {
    func testNoteInitialization() {
        let note = NoteItem(name: "Test Note", noteDescription: "Description", isCompleted: false)
        XCTAssertEqual(note.name, "Test Note")
        XCTAssertEqual(note.noteDescription, "Description")
        XCTAssertFalse(note.isCompleted)
    }
    
    func testToggleCompletion() {
        let note = NoteItem(name: "Test Note", noteDescription: "Description", isCompleted: false)
        note.toggle()
        XCTAssertTrue(note.isCompleted)
    }
    
    func testChangeName() {
        let note = NoteItem(name: "Old Name", noteDescription: "Description", isCompleted: false)
        note.changeName(to: "New Name")
        XCTAssertEqual(note.name, "New Name")
    }
    
    func testChangeDescription() {
        let note = NoteItem(name: "Note", noteDescription: "Old Description", isCompleted: false)
        note.changeDescription(to: "New Description")
        XCTAssertEqual(note.noteDescription, "New Description")
    }
}
