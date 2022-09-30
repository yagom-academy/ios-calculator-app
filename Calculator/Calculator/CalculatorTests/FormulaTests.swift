//
//  FormulaTests.swift
//  CalculatorTests
//


import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {

    var sut: Formula!

    override func setUpWithError() throws {
        sut = Formula(operrands: CalculatorItemQueue([1, 3]),
                      operators: CalculatorItemQueue([Operator.substract, Operator.multiply, Operator.add]))
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func testFormula연산시_Double과Operator가아닌_다른타입이면_false리턴() {
        do {
            let result = try sut.result()
            XCTAssertEqual(result, 1)
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
}
