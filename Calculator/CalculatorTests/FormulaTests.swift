
import XCTest

@testable import Calculator

class FormulaTests: XCTestCase {
    
    var formula: Formula!

    override func setUpWithError() throws {
        self.formula = Formula()
    }
    
    func insertInputArrayToFormula(operands: [Double], operators: [Operator]) {
        for operand in operands {
            self.formula.operands.enqueue(operand)
        }
        for `operator` in operators {
            self.formula.operators.enqueue(`operator`)
        }
    }
    
    func test_optionalInitializer_Case1() {
        let inputOperands: [String] = ["5","-","5","*","5"]
        let inputOperators: [String] = ["+","5","/","5"]
        
        XCTAssertNil(Formula(operands: inputOperands, operators: inputOperators))
    }
    
    func test_optionalInitializer_Case2() {
        let inputOperands: [String] = ["5","5","5","5","5"]
        let inputOperators: [String] = ["+","5","/","5"]
        
        XCTAssertNil(Formula(operands: inputOperands, operators: inputOperators))
    }
    
    func test_optionalInitializer_Case3() {
        let inputOperands: [String] = ["5","5","5","5","5"]
        let inputOperators: [String] = ["","5","/","5"]
        
        XCTAssertNil(Formula(operands: inputOperands, operators: inputOperators))
    }
    func test_optionalInitializer_Case4() {
        let inputOperands: [String] = ["5","5","5","5","5"]
        let inputOperators: [String] = ["z","5","/","5"]
        
        XCTAssertNil(Formula(operands: inputOperands, operators: inputOperators))
    }
    
    func test_emptyCalculatorItemQueue() {
        self.formula.operands = CalculatorItemQueue()
        self.formula.operators = CalculatorItemQueue()
        
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
