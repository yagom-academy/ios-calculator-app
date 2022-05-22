//
//  parseTests.swift
//  parseTests
//
//  Created by 김동용 on 2022/05/20.
//

import XCTest

@testable import Calculator
class parseTests: XCTestCase {
    var sut: ExpressionParser.Type?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ExpressionParser.self
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_문자열에서_componentsByOperators메소드를사용하면_공백을기준으로나누어서순서대로반환하는가() {
        //given
        let input = "1 + 2 - 3 + 4 / 2"
        
        //when
        let result = input.split(with: " ")
        
        //then
        XCTAssertEqual(result, ["1", "+", "2", "-", "3", "+", "4", "/", "2"])
    }
    
    func test_문자열에서_componentsByOperators를사용하여_operands를_character로_형변환을하여집어넣는가() {
        //given
        let input = "1 + 2 - 3 + 4 / 2"
        
        //when
        let result = input.filter { $0.isNumber == false }
                            .filter{ $0 != " " }
                            .map { Character(extendedGraphemeClusterLiteral: $0) }
        
        //then
        XCTAssertEqual(result, ["+", "-", "+", "/"])
    }
    
    func test_문자열에서_componentsByOperators를사용하여_operaters를_character로_형변환을하여집어넣는가2() {
        //when
        let input = "1 + 2 - 3 + 4 / 2"
        
        //given
        let result = input.split(with: " ")
                    .compactMap { Operator(rawValue: Character($0)) }
        
        //then
        XCTAssertEqual(result, [Operator.add,
                                Operator.subtract,
                                Operator.add,
                                Operator.divide])
    }
    
    func test_문자열에서_componentsByOperators메소드를사용하면_숫자를순서대로반환하는가() {
        //given
        let input = "1 + 2 - 3 + 4 / 2"
        
        //when
        let result = input.compactMap { Double(String($0)) }
        
        //then
        XCTAssertEqual(result, [1.0, 2.0, 3.0, 4.0, 2.0])
    }
    
    func test_operandsQueue에_operands값이순서대로_들어가는가() {
        //given
        let input = "1 + 2 - 3 + 4 / 2"
        var operandsQueue = CalculatorItemQueue<Double>()
        let operands = input.compactMap { Double(String($0)) }
        
        operands.forEach { operandsQueue.enQueue($0) }
        
        //when
        let result = operandsQueue.enQueueStack
        
        //then
        XCTAssertEqual(result, [1.0, 2.0, 3.0, 4.0, 2.0])
    }
    
    func test_operatorQueue에_operators값이순서대로_들어가는가() {
        //given
        let input = "1 + 2 - 3 + 4 / 2"
        var operatorQueue = CalculatorItemQueue<Operator>()
        let operators = input.split(with: " ")
                        .filter { $0.count == 1 }
                        .compactMap{ Operator(rawValue: Character($0))}
        
        operators.forEach{ operatorQueue.enQueue($0) }
        
        //when
        let result = operatorQueue.enQueueStack
        
        //then
        XCTAssertEqual(result, [Operator.add,
                                Operator.subtract,
                                Operator.add,
                                Operator.divide])
    }
}
