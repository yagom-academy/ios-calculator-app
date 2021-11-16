
import XCTest

@testable import Calculator

class FormulaTests: XCTestCase {
    
    var formula: Formula!

    override func setUpWithError() throws {
        self.formula = Formula()
    }
    
    func insertInputArrayToFormula(operands: [Double], operators: [Operator]) {
        for operand in operands {
            self.formula.operandsQueue.enqueue(operand)
        }
        for `operator` in operators {
            self.formula.operatorsQueue.enqueue(`operator`)
        }
    }
    
    func test_emptyCalculatorItemQueue() {
        self.formula.operandsQueue = CalculatorItemQueue()
        self.formula.operatorsQueue = CalculatorItemQueue()
        
        XCTAssertEqual(self.formula.result(), 0)
    }

    func test_calculationAccuracy() {
        let inputOperands: [Double] = [5,5,5,5,5,5]
        let inputOperators: [Operator] = [.add, .add,.subtract,.multiply,.divide]
        
        insertInputArrayToFormula(operands: inputOperands, operators: inputOperators)
        
        XCTAssertEqual(self.formula.result(), 10)
    }
    
    func test_dividedZero() {
        let inputOperands: [Double] = [5,5,5,0,5]
        let inputOperators: [Operator] = [.add,.add,.divide,.add]
        
        insertInputArrayToFormula(operands: inputOperands, operators: inputOperators)
        
        XCTAssertEqual(self.formula.result(), Double.infinity)
    }

}
