//  FormulaTest.swift
//  FormulaTest
//  Created by LIMGAUI on 2022/03/20

import XCTest
@testable import Calculator

class FormulaTest: XCTestCase {
    var sut: Formula!
    var operands: CalculateItemQueue<Double>!
    var operators: CalculateItemQueue<Operator>!
    override func setUpWithError() throws {
        operands = CalculateItemQueue<Double>()
        operators = CalculateItemQueue<Operator>()
        sut = Formula(operands: operands, operators: operators)
    }
    override func tearDownWithError() throws {
        sut = nil
        operands = nil
        operators = nil
    }
    
    func test_result메서드() throws {
        let operands = [10, 2, 2, -2, 2]
        let operators = ["➕", "➖", "✖️", "➗"]
        operands.forEach{sut.operands.enqueue(Double($0))}
        operators.forEach{sut.operators.enqueue(Operator(rawValue: Character($0))!)}

        let result = try sut.result()

        XCTAssertEqual(result, -10.0)
    }
    
    func test_result메서드2() throws {
        let operands = [234.532, 254.521, 2.5, 3.5]
        let operators = ["➕", "✖️", "➗"]
        
        operands.forEach{sut.operands.enqueue(Double($0))}
        operators.forEach{sut.operators.enqueue(Operator(rawValue: Character($0))!)}
        
        let result = try sut.result()
        
        XCTAssertEqual(result, 349.323571428571429)
    }
    
    func test_result메서드호출시_피연산자와_연산자가값이없을떄_에러를던지는지() throws {
        let _ = try sut.result()
        
        XCTAssertThrowsError(CalculateError.cannotCalculation)
    }
}
