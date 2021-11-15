//
//  OperatorTests.swift
//  CalculatorTests
//
//  Created by JeongTaek Han on 2021/11/14.
//

import XCTest

class OperatorTests: XCTestCase {
    
    var sutAddOperator: Operator!
    var sutSubtractOperator: Operator!
    var sutDivideOperator: Operator!
    var sutMultiplyOperator: Operator!
    
    var sutDouble: Double!

    override func setUpWithError() throws {
        sutAddOperator = .add
        sutSubtractOperator = .subtract
        sutDivideOperator = .divide
        sutMultiplyOperator = .multiply
        sutDouble = 0.0
    }

    override func tearDownWithError() throws {
        sutAddOperator = nil
        sutSubtractOperator = nil
        sutDivideOperator = nil
        sutMultiplyOperator = nil
        sutDouble = nil
    }

    func test_Double형_0점2와_Double형_0점1을_add_operator로_연산하면_Double형_0점3이_반환되는가() {
        // given
        let leftOperand = 0.2
        let rightOperand = 0.1

        // when
        do {
            sutDouble = try sutAddOperator.calculate(lhs: leftOperand, rhs: rightOperand)
        } catch {
            XCTAssertTrue(false)
        }

        // then
        XCTAssertEqual(sutDouble, 0.3)
    }

    func test_Double형_10와_Double형_8을_substract_operator로_연산하면_Double형_2점0가_반환되는가() {
        // given
        let leftOperand = 10.0
        let rightOperand = 8.0

        // when
        do {
            sutDouble = try sutSubtractOperator.calculate(lhs: leftOperand, rhs: rightOperand)
        } catch {
            XCTAssertTrue(false)
        }

        // then
        XCTAssertEqual(sutDouble, 2.0)
    }

    func test_Double형_8와_Double형_10을_substract_operator로_연산하면_Double형_음수_2점0가_반환되는가() {
        // given
        let leftOperand = 8.0
        let rightOperand = 10.0

        // when
        do {
            sutDouble = try sutSubtractOperator.calculate(lhs: leftOperand, rhs: rightOperand)
        } catch {
            XCTAssertTrue(false)
        }
        
        // then
        XCTAssertEqual(sutDouble, -2.0)
    }


    func test_Double형_80와_Double형_10을_divide_operator로_연산하면_Double형_8점0가_반환되는가() {
        // given
        let leftOperand = 80.0
        let rightOperand = 10.0

        // when
        do {
            sutDouble = try sutDivideOperator.calculate(lhs: leftOperand, rhs: rightOperand)
        } catch {
            XCTAssertTrue(false)
        }
        
        // then
        XCTAssertEqual(sutDouble, 8.0)
    }
    
    func test_Double형_80와_Double형_0점0을_divide_operator로_연산하면_notANumber오류가_반환되는가() {
        // given
        let leftOperand = 80.0
        let rightOperand = 0.0
        
        // when
        do {
            sutDouble = try sutDivideOperator.calculate(lhs: leftOperand, rhs: rightOperand)
        } catch CalculatorError.divideByZero {
            XCTAssertTrue(true)
        } catch {
            XCTAssertTrue(false)
        }
    }
    
    func test_Double형_80와_Double형_10을_multiply_operator로_연산하면_Double형_800점0가_반환되는가() {
        // given
        let leftOperand = 80.0
        let rightOperand = 10.0

        // when
        do {
            sutDouble = try sutMultiplyOperator.calculate(lhs: leftOperand, rhs: rightOperand)
        } catch {
            XCTAssertTrue(false)
        }
        
        // then
        XCTAssertEqual(sutDouble, 800.0)
    }

    
}
