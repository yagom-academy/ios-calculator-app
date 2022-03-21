//  ExpressionParserTest.swift
//  ExpressionParserTest
//  Created by LIMGAUI on 2022/03/21

import XCTest
@testable import Calculator

class ExpressionParserTest: XCTestCase {
    override func setUpWithError() throws {
    }
    override func tearDownWithError() throws {
    }
    
    func test_split메서드호출시_플러스값을넣었을때_maxSplits매개변수값1만큼만_작동하는지() {
        let input = "5➕10➕2➖2✖️-2➗2"
        let splitedValues = ["5","10➕2➖2✖️-2➗2"]
        let result = input.split(with: "➕")
        
        XCTAssertEqual(result, splitedValues)
    }
    
    func test_componentsByOperators메서드호출시_피연산자만분리되는지() {
        let input = "5➕10➕2➖2✖️-2➗2"
        let operands = ["5","10","2","2","-2","2"]
        let result = ExpressionParser.componentsByOperators(from: input)
        
        XCTAssertEqual(result, operands)
    }
    
    func test_parse메서드호출시_입력한_계산식에서_연산자값과_피연산자값이_분리가되는지() {
        let input = "5➕10➕2➖2✖️-2➗2"
        
        let formula = ExpressionParser.parse(from: input)
        var operands = [String]()
        var operators = [String]()
        
        for _ in 1...formula.operands.count {
            guard let operand = formula.operands.dequeue else {return}
            operands.append(String(operand))
        }
        for _ in 1...formula.operators.count {
            guard let operatorValue = formula.operators.dequeue else {return}
            operators.append(String(operatorValue.rawValue))
        }
        let operandsResult = ["5.0","10.0","2.0","2.0","-2.0","2.0"]
        let operatorsResult = ["➕","➕","➖","✖️","➗"]
        
        XCTAssertEqual(operands, operandsResult)
        XCTAssertEqual(operators, operatorsResult)
    }
}
