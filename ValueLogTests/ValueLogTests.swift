//
//  ValueLogTests.swift
//  ValueLogTests
//
//  Created by Ian Manor on 18/02/21.
//

import XCTest
@testable import ValueLog

class ValueLogTests: XCTestCase {
    var viewModel: ContentViewModel!

    override func setUpWithError() throws {
        viewModel = ContentViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }

    func testAddValue() throws {
        let value = "Resilience"
        viewModel.addValue(value)
        XCTAssertFalse(viewModel.isValueDisabled(value))
        XCTAssertTrue(viewModel.values.contains(value))
    }

    func testArrayToggle() throws {
        var array = [1, 2, 3]
        array.toggle(3)
        array.toggle(4)
        XCTAssertEqual(array, [1, 2, 4])
    }
}
