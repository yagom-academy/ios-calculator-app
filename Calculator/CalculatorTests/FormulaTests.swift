
import XCTest

@testable import Calculator

class FormulaTests: XCTestCase {
    
    var formula: Formula!

    override func setUpWithError() throws {
        self.formula = Formula()
    }
    
    func insertInputArrayToFormula(operands: [Double], operators: [Operator]) {
        for operand in operands {
            self.formula.enqueueToOperandsQueue(operand)
        }
        for `operator` in operators {
            self.formula.enqueueToOperatorsQueue(`operator`)
        }
    }
    
    func test_emptyCalculatorItemQueue() {
        self.formula = Formula()
        
        XCTAssertThrowsError(try formula.result(), "Dequeue 할 값이 존재하지 않습니다") { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.queueIsEmpty)
        }
    }

    func test_calculationAccuracy() {
        let inputOperands: [Double] = [5,5,5,5,5,5]
        let inputOperators: [Operator] = [.add, .add,.subtract,.multiply,.divide]

        insertInputArrayToFormula(operands: inputOperands, operators: inputOperators)

        XCTAssertEqual(try self.formula.result(), 10)
    }

    func test_dividedZero() {
        let inputOperands: [Double] = [5,5,5,0,5]
        let inputOperators: [Operator] = [.add,.add,.divide,.add]

        insertInputArrayToFormula(operands: inputOperands, operators: inputOperators)

        XCTAssertThrowsError(try formula.result(), "나누기 0 에러") { error in
            XCTAssertEqual(error as? CalculatorError, CalculatorError.dividedByZero)
        }
    }

}
