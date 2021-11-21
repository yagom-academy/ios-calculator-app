//
//  Number_Tests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/18.
//

import XCTest
@testable import Calculator

class NumberManager_Tests: XCTestCase {
    var sut = NumberManager()
    var fakeLabel: String = ""
    
    override func setUpWithError() throws {
    }
    
    override func tearDownWithError() throws {
        sut.reset()
    }
    
    func test_초기_Label은_0이다() {
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
        let preExisting = NumberManager(value: "0.3", isBiggerThan0: true)
        preExisting.updateValue(with: ".")
        fakeLabel = preExisting.value
        XCTAssertEqual(fakeLabel, "0.3")
    }
    
    func test_value가789일때_updateValue호출시_input에_점을전달하면_label은_789점이된다() {
        let preExisting = NumberManager(value: "789", isBiggerThan0: true)
        preExisting.updateValue(with: ".")
        fakeLabel = preExisting.value
        XCTAssertEqual(fakeLabel, "789.")
    }
    
    func test_value가30일때_updateValueg호출시_input에_점을전달하면_label은_30점이된다() {
        let preExisting = NumberManager(value: "30", isBiggerThan0: true)
        preExisting.updateValue(with: ".")
        fakeLabel = preExisting.value
        XCTAssertEqual(fakeLabel, "30.")
    }
    
    //MARK:- toggleSign Tests
    func test_value가양수일때_toggleSign을_호출하면_label에_마이너스부호가_추가된다() {
        let testNum = NumberManager(value: "777", isBiggerThan0: true)
        testNum.toggleSign()
        fakeLabel = testNum.value
        XCTAssertTrue(fakeLabel.contains("-"))
    }
    
    func test_value가양수일때_toggleSign을_두번호출하면_label엔_마이너스부호가_없다() {
        let testNum = NumberManager(value: "777", isBiggerThan0: true)
        testNum.toggleSign()
        testNum.toggleSign()
        fakeLabel = testNum.value
        XCTAssertFalse(fakeLabel.contains("-"))
    }
    
    func test_value가음수일때_toggleSign을_호출하면_label엔_마이너스부호가_없다() {
        let testNum = NumberManager(value: "-777", isBiggerThan0: false)
        testNum.toggleSign()
        fakeLabel = testNum.value
        XCTAssertEqual(fakeLabel, "777")
        XCTAssertFalse(fakeLabel.contains("-"))
    }
    
    func test_value가0일때_toggleSign을_호출하면_label엔_마이너스부호가_없다() {
        sut.toggleSign()
        fakeLabel = sut.value
        XCTAssertFalse(fakeLabel.contains("-"))
    }
    
    func test_value가_20자리일때_value는_변하지않는다() {
        let testNum = NumberManager(value: "12345678901234567890", isBiggerThan0: true)
        testNum.updateValue(with: "1")
        XCTAssertEqual(testNum.value, "12345678901234567890")
        
    }
    
    //MARK:- formmater Tests
    func test_value가_1000000일때_formmater를_호출하면_3자리마다_콤마가추가된다() {
        let testNum = NumberManager(value: "1000000" , isBiggerThan0: true)
        let formmatedValue = testNum.formatter(testNum.value)
        XCTAssertEqual(formmatedValue, "1,000,000")
    }
    
    func test_value가_마이너스12345일때_formatter를_호출하면_3자리마다_콤마가추가된다() {
        let testNum = NumberManager(value: "-12345" , isBiggerThan0: false)
        let formmatedValue = testNum.formatter(testNum.value)
        XCTAssertEqual(formmatedValue, "-12,345")
    }
    
    func test_value가_12345점6789일때_formatter를_호출하면_3자리마다_콤마가추가된다() {
        let testNum = NumberManager(value: "12345.6789" , isBiggerThan0: true)
        let formmatedValue = testNum.formatter(testNum.value)
        XCTAssertEqual(formmatedValue, "12,345.6789")
    }
    
    func test_value가_0점0일때_formatter를_호출하면_0을_반환한다() {
        let testNum = NumberManager(value: "0.0" , isBiggerThan0: true)
        let formmatedValue = testNum.formatter(testNum.value)
        XCTAssertEqual(formmatedValue, "0")
    }
    
    func test_value가_0점123000일때_formatter를_호출하면_0을_반환한다() {
        let testNum = NumberManager(value: "0.123000" , isBiggerThan0: true)
        let formmatedValue = testNum.formatter(testNum.value)
        XCTAssertEqual(formmatedValue, "0.123")
    }
    
    func test_value가_21자리이상일때_formatter를_호출하면_21번째자리에서_반올림한숫자를_반환된다() {
        let testNum = NumberManager(value: "0.12737958362846485936" , isBiggerThan0: true)
        let formmatedValue = testNum.formatter(testNum.value)
        XCTAssertEqual(formmatedValue, "0.1273795836284648593")
    }
    
    func test_value가_소수점이하18자리일때_formatter를_호출하면_소수점이하17자리까지만_반환된다() {
        let testNum = NumberManager(value: "0.127379583628464859" , isBiggerThan0: true)
        let formmatedValue = testNum.formatter(testNum.value)
        XCTAssertEqual(formmatedValue, "0.12737958362846485")
    }
    
    func test_value가_총21자리일때_formatter를_호출하면_반올림한_20자리수가_반환된다() {
        let testNum = NumberManager(value: "12345678901234567891.5" , isBiggerThan0: true)
        let formmatedValue = testNum.formatter(testNum.value)
        XCTAssertEqual(formmatedValue, "12,345,678,901,234,567,892")
    }
}
