//
//  FormulaTests.swift
//  CalculatorTests
//


import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {

    var sut: Formula!
    let operandTestCases1 = CalculatorItemQueue([10, 3])
    let operandTestCases2 = CalculatorItemQueue([12, 0])
    
    let operatorTestCases1 = CalculatorItemQueue([Operator.add, Operator.substract])
    let operatorTestCases2 = CalculatorItemQueue([Operator.multiply, Operator.divide])

    override func setUpWithError() throws {
        sut = Formula(operands: operandTestCases1, operators: operatorTestCases1)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func testFormula연산시_Double과Operator가아닌_다른타입이면_false리턴() {
        do {
            let result = try sut.result()
            XCTAssertEqual(result, -2)
        } catch CalculateError.invalidOperator {
            print(CalculateError.invalidOperator)
            XCTAssert(false)
        } catch CalculateError.invalidOperand {
            print(CalculateError.invalidOperand)
            XCTAssert(false)
        } catch {
            XCTAssert(false)
        }
    }
    
    func testFormula연산시_사칙연산이_모두있을경우_true리턴() {
        do {
            let result = try sut.result()
            XCTAssertEqual(result, 7)
        } catch {
            XCTAssert(false)
        }
        
    }
    
    func testFormula에서_divide연산시_0으로나눌때_false리턴() {
        sut = Formula(operands: operandTestCases2, operators: operatorTestCases2)
        do {
            _ = try sut.result()
        } catch CalculateError.divideByZero {
            XCTAssertFalse(false)
        } catch {
            XCTAssertFalse(true)
        }
    }
}
