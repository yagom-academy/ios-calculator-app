//
//  StringExtensionTests.swift
//  StringExtensionTests
//
//  Created by Jae-hoon Sim on 2021/11/12.
//

import XCTest
@testable import Calculator

class StringExtensionTests: XCTestCase {
    var sut: String!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = String()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_split호출시_target이맨앞이면_count가1인지() {
        //given
        let target = Operator.add.rawValue
        sut = "+1242-324-35"
        //when
        let result = sut.split(with: target).count
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_split호출시_target이중간이면count가2인지() {
        //given
        let target = Operator.add.rawValue
        sut = "12-3+213/2*3"
        //when
        let result = sut.split(with: target).count
        //then
        XCTAssertEqual(result, 2)
    }
    
    func test_split호출시_target이두개면_count가3인지() {
        //given
        let target = Operator.add.rawValue
        sut = "42+4.332+6-3"
        //when
        let result = sut.split(with: target).count
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_split호출시_target이없으면_count가1인지() {
        //given
        let target = Operator.add.rawValue
        sut = "123.34-23*4.4-5.0-2.4-324"
        //when
        let result = sut.split(with: target).count
        //then
        XCTAssertEqual(result, 1)
    }
    
    func test_split호출시_target을문자열에서제거하는지() {
        //given
        let target = Operator.add.rawValue
        sut = "+12+3.3+4-23*4.4-5.0-2.4-32+4+"
        //when
        let result = sut.split(with: target)
        //then
        XCTAssertFalse(result.contains(String(target)))
    }
    
    func test_split호출시_기대하는결과값과일치하는지() {
        //given
        let target = Operator.add.rawValue
        sut = "12+3.3+4-23*4.4-5.0-2.4-32+4"
        let expectedResult = ["12", "3.3", "4-23*4.4-5.0-2.4-32", "4"]
        //when
        let result = sut.split(with: target)
        //then
        XCTAssertEqual(result, expectedResult)
    }
}
