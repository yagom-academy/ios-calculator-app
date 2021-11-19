//
//  Number_Tests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/18.
//

import XCTest
@testable import Calculator

class Number_Tests: XCTestCase {
    var sut = Number()
    var fakeLabel: String = ""
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
        sut.reset()
    }
    
    func test_Number의_초기_Label은_0이다() {
        fakeLabel = sut.value
        XCTAssertEqual(fakeLabel, "0")
    }
    
    // MARK:- updateValue Tests
    func test_value가0일때_updateValue호출시_input에_7을전달하면_label은_7이된다() {
        sut.updateValue(with: "7")
        fakeLabel = sut.value
        XCTAssertEqual(fakeLabel, "7")
    }
    
    func test_value가0일때_updateValue호출시_input에_0을전달하면_label은_0이된다() {
        sut.updateValue(with: "0")
        fakeLabel = sut.value
        XCTAssertEqual(fakeLabel, "0")
    }
    
    func test_value가0일때_input을_0_1_순서대로_updateValue호출하면_abel은_1이된다() {
        sut.updateValue(with: "0")
        sut.updateValue(with: "1")
        fakeLabel = sut.value
        XCTAssertEqual(fakeLabel, "1")
    }
    
    func test_value가0일때_input을_0_점_3_순서대로_updateValue호출하면_label은_0점3이된다() {
        sut.updateValue(with: "0")
        sut.updateValue(with: ".")
        sut.updateValue(with: "3")
        fakeLabel = sut.value
        XCTAssertEqual(fakeLabel, "0.3")
    }
    
    func test_value가소수일때_updateValue호출시_input에_점을전달하면_label는_변하지않는다() {
        let preExisting = Number(value: "0.3", isBiggerThan0: true)
        preExisting.updateValue(with: ".")
        fakeLabel = preExisting.value
        XCTAssertEqual(fakeLabel, "0.3")
    }
    
    func test_value가789일때_updateValue호출시_input에_점을전달하면_label은_789점이된다() {
        let preExisting = Number(value: "789", isBiggerThan0: true)
        preExisting.updateValue(with: ".")
        fakeLabel = preExisting.value
        XCTAssertEqual(fakeLabel, "789.")
    }
    
}
