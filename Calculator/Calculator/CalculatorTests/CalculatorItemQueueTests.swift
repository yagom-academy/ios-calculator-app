
import XCTest
@testable import Calculator

private class CalculatorItemQueueTests: XCTestCase {

    var sut: CalculatorItemQueue!
    var testCase1: Double = Double.random(in: (0...100))
    var testCase2: Double = Double.random(in: (0...100))
    var testCase3: Double = Double.random(in: (0...100))
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue([])
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_CalculatorItemQueue생성시_빈배열전달하면_isEmpty가true리턴() {
        let deque = CalculatorItemQueue([])
        
        let result = deque.isEmpty
        
        XCTAssertTrue(result)
    }
    
    func test_CalculatorItemQueue에서_enque와deque에_아이템이_모두있을때_popLast시_마지막아이템추출() {
        sut.enqueue = [testCase1]
        sut.dequeue = [testCase2, testCase3]
        
        let result = sut.popLast()
        
        guard let result = result as? Double else{
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(testCase1, result)
    }
    
    func test_CalculatorItemQueue에서_enque에만_아이템이있을때_popLast시_마지막아이템추출() {
        sut.enqueue = [testCase1, testCase2, testCase3]
        
        let result = sut.popLast()
        
        guard let result = result as? Double else{
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(testCase3, result)
    }
    
    func test_CalculatorItemQueue에서_deque에만_아이템이있을때_popLast시_마지막아이템추출() {
        sut.dequeue = [testCase1, testCase2, testCase3]
        let result = sut.popLast()
        
        guard let result = result as? Double else{
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(testCase1, result)
    }
    
    func test_CalculatorItemQueue에서_enque와deque에_아이템이_모두있을때_popFirst시_첫번째아이템추출() {
        sut.enqueue = [testCase1, testCase3]
        sut.dequeue = [testCase2]
        
        let result = sut.popFirst()
        
        guard let result = result as? Double else{
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(testCase2, result)
    }
    
    func test_CalculatorItemQueue에서_enque에만_아이템이있을때_popFirst시_첫번째아이템추출() {
        sut.enqueue = [testCase1, testCase3]
        
        let result = sut.popFirst()
        
        guard let result = result as? Double else{
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(testCase1, result)
    }

    func test_CalculatorItemQueue에서_deque에만_아이템이있을때_popFirst시_첫번째아이템추출() {
        sut.dequeue = [testCase1, testCase3]
        
        let result = sut.popFirst()
        
        guard let result = result as? Double else{
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(testCase3, result)
    }

    func test_CalculatorItemQueue에서_pushLast시_마지막아이템할당() {
        sut.enqueue = [testCase3]
        sut.dequeue = [testCase1]

        sut.pushLast(testCase1)
        
        let result = sut.enqueue.last
        
        guard let result = result as? Double else{
            XCTAssert(false)
            return
        }
        
        XCTAssertEqual(testCase1, result)
    }
}
