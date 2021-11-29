//
//  Number_Tests.swift
//  CalculatorTests
//
//  Created by 1 on 2021/11/18.
//

import XCTest
@testable import Calculator

class CalculatorManager_Tests: XCTestCase {
    var sut = CalculatorManager()
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
        let preExisting = CalculatorManager(value: "0.3", isBiggerThan0: true)
        preExisting.updateValue(with: ".")
        fakeLabel = preExisting.value
        XCTAssertEqual(fakeLabel, "0.3")
    }
    
    func test_value가789일때_updateValue호출시_input에_점을전달하면_label은_789점이된다() {
        let preExisting = CalculatorManager(value: "789", isBiggerThan0: true)
        preExisting.updateValue(with: ".")
        fakeLabel = preExisting.value
        XCTAssertEqual(fakeLabel, "789.")
    }
    
    func test_value가30일때_updateValueg호출시_input에_점을전달하면_label은_30점이된다() {
        let preExisting = CalculatorManager(value: "30", isBiggerThan0: true)
        preExisting.updateValue(with: ".")
        fakeLabel = preExisting.value
        XCTAssertEqual(fakeLabel, "30.")
    }
    
    //MARK:- toggleSign Tests
    func test_value가양수일때_toggleSign을_호출하면_label에_마이너스부호가_추가된다() {
        let sut = CalculatorManager(value: "777", isBiggerThan0: true)
        sut.toggleSign()
        fakeLabel = sut.value
        XCTAssertTrue(fakeLabel.contains("-"))
    }
    
    func test_value가양수일때_toggleSign을_두번호출하면_label엔_마이너스부호가_없다() {
        let sut = CalculatorManager(value: "777", isBiggerThan0: true)
        sut.toggleSign()
        sut.toggleSign()
        fakeLabel = sut.value
        XCTAssertFalse(fakeLabel.contains("-"))
    }
    
    func test_value가음수일때_toggleSign을_호출하면_label엔_마이너스부호가_없다() {
        let sut = CalculatorManager(value: "-777", isBiggerThan0: false)
        sut.toggleSign()
        fakeLabel = sut.value
        XCTAssertEqual(fakeLabel, "777")
        XCTAssertFalse(fakeLabel.contains("-"))
    }
    
    func test_value가0일때_toggleSign을_호출하면_label엔_마이너스부호가_없다() {
        sut.toggleSign()
        fakeLabel = sut.value
        XCTAssertFalse(fakeLabel.contains("-"))
    }
    
    func test_value가_20자리일때_value는_변하지않는다() {
        let sut = CalculatorManager(value: "12345678901234567890", isBiggerThan0: true)
        sut.updateValue(with: "1")
        XCTAssertEqual(sut.value, "12345678901234567890")
        
    }
    
    //MARK:- updateValue Tests
    func test_value가_100이고_0을_updateValue에_넣어주면_3자리마다_콤마가추가된다() {
        let sut = CalculatorManager(value: "100" , isBiggerThan0: true)
        sut.updateValue(with: "0")
        XCTAssertEqual(sut.value, "1,000")
    }
    
    func test_value가_마이너스12345이고_6을_updateValue에넣어주면_value에는_마이너스123456에서_3자리마다_콤마가추가된_문자열이_할당된다() {
        let sut = CalculatorManager(value: "-12345" , isBiggerThan0: false)
        sut.updateValue(with: "6")
        XCTAssertEqual(sut.value, "-123,456")
    }
    
    func test_value가_123점일때_4를_updateValue에넣어주면_value는_123점4가된다() {
        let sut = CalculatorManager(value: "123." , isBiggerThan0: true)
        sut.updateValue(with: "4")
        XCTAssertEqual(sut.value, "123.4")
    }
    
    func test_value가_0점일때_0을_updateValue에넣어주면_value는_0이된다() {
        let sut = CalculatorManager(value: "0." , isBiggerThan0: true)
        sut.updateValue(with: "0")
        XCTAssertEqual(sut.value, "0")
    }
    
    func test_value가_0점123일때_0을_updateValue에넣어주면_value는_0점123이된다() {
        let sut = CalculatorManager(value: "0.123" , isBiggerThan0: true)
        sut.updateValue(with: "0")
        XCTAssertEqual(sut.value
                       , "0.123")
    }
    
    func test_value가_21자리이상일때_formatter를_호출하면_21번째자리에서_반올림한숫자를_반환된다() {
        let sut = CalculatorManager(value: "0.12737958362846485936" , isBiggerThan0: true)
        let formmatedValue = sut.textualRepresentation(with: Double(sut.value)!)
        XCTAssertEqual(formmatedValue, "0.1273795836284648593")
    }
    
    func test_value가_소수점이하18자리일때_formatter를_호출하면_소수점이하17자리까지만_반환된다() {
        let sut = CalculatorManager(value: "0.127379583628464859" , isBiggerThan0: true)
        let formmatedValue = sut.textualRepresentation(with: Double(sut.value)!)
        XCTAssertEqual(formmatedValue, "0.12737958362846485")
    }
    
    func test_value가_총21자리일때_formatter를_호출하면_반올림한_20자리수가_반환된다() {
        let sut = CalculatorManager(value: "12345678901234567891.5" , isBiggerThan0: true)
        let formmatedValue = sut.textualRepresentation(with: Double(sut.value)!)
        XCTAssertEqual(formmatedValue, "12,345,678,901,234,567,892")
    }
}
