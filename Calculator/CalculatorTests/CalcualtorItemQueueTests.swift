import XCTest

@testable import Calculator

class CalcualtorItemQueueTests: XCTestCase {
    var testQueue: CalculatorItemQueue!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        testQueue = CalculatorItemQueue()
    }
    
    func test_basicOperandQueueing() {
        testQueue.enqueue(1)
        
        let firstOperand = testQueue.firstNode?.value as? Double
        
        XCTAssertEqual(firstOperand, 1)
    }
    
    func test_operandsQueueing() {
        var poppedItems: [CalculateItem?] = []
        
        testQueue.enqueue(1)
        testQueue.enqueue(2)
        testQueue.enqueue(3)
        testQueue.enqueue(4)
        testQueue.enqueue(5)
        poppedItems.append(testQueue.dequeue())
        poppedItems.append(testQueue.dequeue())
        poppedItems.append(testQueue.dequeue())
        
        let leftOperands = testQueue.allItems().map {
            return $0 as? Double
        }
        let poppedOperands = poppedItems.map {
            return $0 as? Double
        }
        
        let isRightLeftOperands = (leftOperands == [4,5]) ? true : false
        let isRightPoppedOperands = (poppedOperands == [1,2,3]) ? true : false

        XCTAssertTrue(isRightLeftOperands && isRightPoppedOperands)
    }
    
    func test_operatorsQueueing() {
        var poppedItems: [CalculateItem?] = []
        
        testQueue.enqueue(Operator.add)
        testQueue.enqueue(Operator.subtract)
        testQueue.enqueue(Operator.divide)
        testQueue.enqueue(Operator.multiply)
        poppedItems.append(testQueue.dequeue())
        testQueue.enqueue(Operator.add)
        
        let leftOperators = testQueue.allItems().map {
            return $0 as? Operator
        }
        let poppedOperators = poppedItems.map {
            return $0 as? Operator
        }
        
        let isRightLeftOperators = (leftOperators == [.subtract,.divide,.multiply,.add]) ? true : false
        let isRightPoppedOperators = (poppedOperators == [.add]) ? true : false

        XCTAssertTrue(isRightLeftOperators && isRightPoppedOperators)
    }
}


