//
//  OperatorTests.swift
//  OperatorTests
//
//  Created by Ayaan on 2022/09/22.
//

import XCTest

class OperatorTests: XCTestCase {
    var sut: Operator!

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testOperator_주어진_Character타입_a를_이용해_Operator를_생성한_경우_그_결과는_Nil이다() {
        //given
        let input: Character = "a"
        
        //when
        sut = Operator.init(rawValue: input)
        
        //then
        XCTAssertNil(sut)
    }
    
    func testOperator_주어진_Character타입_더하기기호를_이용해_Operator를_생성한_경우_그_결과는_Operator_Type의_add_case와_같다() {
        //given
        let input: Character = "+"
        
        //when
        sut = Operator.init(rawValue: input)
        
        //then
        XCTAssertEqual(Operator.add, sut)
    }
    
    func testOperator_주어진_Character타입_빼기기호를_이용해_Operator를_생성한_경우_그_결과는_Operator_Type의_subtract_case와_같다() {
        //given
        let input: Character = "−"
        
        //when
        sut = Operator.init(rawValue: input)
        
        //then
        XCTAssertEqual(Operator.subtract, sut)
    }
    
    func testOperator_주어진_Character타입_곱하기기호를_이용해_Operator를_생성한_경우_그_결과는_Operator_Type의_divide_case와_같다() {
        //given
        let input: Character = "×"
        
        //when
        sut = Operator.init(rawValue: input)
        
        //then
        XCTAssertEqual(Operator.divide, sut)
    }
    
    func testOperator_주어진_Character타입_나누기기호를_이용해_Operator를_생성한_경우_그_결과는_Operator_Type의_multiply_case와_같다() {
        //given
        let input: Character = "÷"
        
        //when
        sut = Operator.init(rawValue: input)
        
        //then
        XCTAssertEqual(Operator.multiply, sut)
    }
    
    func testOperator_주어진_add_case가_실수2와_실수4를_이용해_calculate메소드를_호출한_경우_그_결과는_실수6와_같다() {
        //given
        let input: [Double] = [2.0, 4.0]
        sut = Operator.add
        
        //when
        let result: Double = sut.calculate(input[0], input[1])
        
        //then
        XCTAssertEqual(6.0, result)
    }
    
    func testOperator_주어진_subtract_case가_실수4와_실수2를_이용해_calculate메소드를_호출한_경우_그_결과는_실수2와_같다() {
        //given
        let input: [Double] = [4.0, 2.0]
        sut = Operator.subtract
        
        //when
        let result: Double = sut.calculate(input[0], input[1])
        
        //then
        XCTAssertEqual(2.0, result)
    }
    
    func testOperator_주어진_divide_case가_실수6와_실수2를_이용해_calculate메소드를_호출한_경우_그_결과는_실수3와_같다() {
        //given
        let input: [Double] = [6.0, 2.0]
        sut = Operator.divide
        
        //when
        let result: Double = sut.calculate(input[0], input[1])
        
        //then
        XCTAssertEqual(3.0, result)
    }
    
    func testOperator_주어진_multiply_case가_실수9와_실수5를_이용해_calculate메소드를_호출한_경우_그_결과는_실수45와_같다() {
        //given
        let input: [Double] = [9.0, 5.0]
        sut = Operator.multiply
        
        //when
        let result: Double = sut.calculate(input[0], input[1])
        
        //then
        XCTAssertEqual(45.0, result)
    }
    
    func testOperator_주어진_allCases를_forEach로_순회한_경우_각_요소의_type은_Operator타입이다() {
        //given
        let input: [Operator] = Operator.allCases
        
        //when
        input.forEach {
            //then
            XCTAssertTrue(Operator.self == type(of: $0))
        }
    }
    
    func testOperator_주어진_add_case를_CalculateItem_Type으로_Type_Checking한_경우_그_결과는_참이다() {
        //given
        sut = Operator.add
        
        //when
        let result: Bool = sut is CalculateItem
        
        //then
        XCTAssertTrue(result)
    }
}
