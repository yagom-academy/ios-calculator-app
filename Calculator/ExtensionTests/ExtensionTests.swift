//
//  ExtensionTests.swift
//  ExtensionTests
//
//  Created by 조영민 on 2021/11/12.
//

import XCTest

class ExtensionTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func test_String을Extension한_split을_써서_타겟을_포함한_문자열이_나오는지() {
        var testString = "11+12+13"
        var test = testString.split(with: "+")
        XCTAssertEqual(test, ["11","+","12","+","13"])
    }
}
