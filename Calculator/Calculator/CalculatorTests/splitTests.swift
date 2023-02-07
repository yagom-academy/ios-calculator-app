//
//  SplitTests.swift
//  CalculatorQueueTests
//
//  Created by 송종환 on 2023/01/31.
//

import XCTest

@testable import Calculator

final class SplitTests: XCTestCase {
    
    var sut: String!
    
    override func setUpWithError() throws {
        sut = String()
    }

    override func tearDownWithError() throws {
       sut = nil
    }
    
    func test_split매서드에_addOperater를_넣었을때_addOperator를_기준으로_operand를_분리해내_스트링배열로_반환한다() {
        let input = "1+2-23*41/12"
        let inputOperator: Character = "+"
        
        let expectedResult = ["1","2-23*41/12"]
        
        let result = input.split(someOperator: inputOperator)
       
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_split매서드에_subtractOperater를_넣었을때_subtractOperator를_기준으로_operand를_분리해내_스트링배열로_반환한다() {
        let input = "1+2-23*41/12"
        let inputOperator: Character = "-"
        
        let expectedResult = ["1+2","23*41/12"]
        
        let result = input.split(someOperator: inputOperator)
       
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_split매서드에_divideOperater를_넣었을때_divideOperator를_기준으로_operand를_분리해내_스트링배열로_반환한다() {
        let input = "1+2-23*41/12"
        let inputOperator: Character = "/"
        
        let expectedResult = ["1+2-23*41","12"]
        
        let result = input.split(someOperator: inputOperator)
       
        
        XCTAssertEqual(result, expectedResult)
    }
    
    func test_split매서드에_mulitplyOperater를_넣었을때_multiplyOperator를_기준으로_operand를_분리해내_스트링배열로_반환한다() {
        let input = "1+2-23*41/12"
        let inputOperator: Character = "*"
        
        let expectedResult = ["1+2-23","41/12"]
        
        let result = input.split(someOperator: inputOperator)
       
        
        XCTAssertEqual(result, expectedResult)
    }
}
