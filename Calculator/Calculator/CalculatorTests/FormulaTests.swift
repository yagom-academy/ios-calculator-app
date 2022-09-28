//
//  FormulaTests.swift
//  CalculatorTests
//


import XCTest
@testable import Calculator

class FormulaTests: XCTestCase {

    var sut: Formula!

    override func setUpWithError() throws {
        sut = Formula(operrands: CalculatorItemQueue([1, "1123", 3]),
                      operators: CalculatorItemQueue([Operator.substract, Operator.multiply, Operator.add]))
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }

    func test_sdf() {
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
