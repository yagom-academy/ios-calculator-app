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
    
    func test_result메서드호출시_10더하기_2빼기_2곱하기_마이너스2나누기_2의값이_마이너스10이나오는지() {
        let operands = [10, 2, 2, -2, 2]
        let operators = ["➕", "➖", "✖️", "➗"]
        operands.forEach{sut.operands.enqueue(Double($0))}
        operators.forEach{sut.operators.enqueue(Operator(rawValue: Character($0))!)}

        let result = sut.result()

        XCTAssertEqual(result, -10.0)
    }
    
    func test_result메서드호출시_234점532더하기_254점521곱하기_2점5나누기_3점5의값이_349점323571428571429값이나오는지() {
        let operands = [234.532, 254.521, 2.5, 3.5]
        let operators = ["➕", "✖️", "➗"]
        
        operands.forEach{sut.operands.enqueue(Double($0))}
        operators.forEach{sut.operators.enqueue(Operator(rawValue: Character($0))!)}
        
        let result = sut.result()
        
        XCTAssertEqual(result, 349.323571428571429)
    }
}
