//
//  StringTests.swift
//  CalculatorItemQueueTests
//
//  Created by junho lee on 2022/09/23.
//

import XCTest
@testable import Calculator

final class StringTests: XCTestCase {
    var sut: String!
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }

    func test_1더하기2를담은문자열에서_split호출시_더하기를전달했을때_1과2을담은배열을반환하는지() {
        // given
        sut = "1+2"
        
        // when
        let result: Array<String> = sut.split(with: "+")
        
        // then
        XCTAssertEqual(result, ["1", "2"])
    }
}
