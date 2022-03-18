
import XCTest

@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    
    var calculatorQueue = CalculatorItemQueue<Int>()
    
    func test_When_enqueue_3_element_Expect_count_is_3() {
        //when
        calculatorQueue.enqueue(1)
        calculatorQueue.enqueue(2)
        calculatorQueue.enqueue(3)
        
        //then
        XCTAssertEqual(calculatorQueue.count, 3)
    }
    
    func test_When_dequeue_element_Expect_return_firstIn() {
        //given
        calculatorQueue.enqueue(1)
        calculatorQueue.enqueue(2)
        calculatorQueue.enqueue(3)
        
        //when
        let outElement = calculatorQueue.dequeue()
        
        //then
        XCTAssertEqual(outElement, 1)
    }
    
    func test_When_dequeue_every_element_Expect_count_is_0() {
        //given
        calculatorQueue.enqueue(1)
        calculatorQueue.enqueue(2)
        calculatorQueue.enqueue(3)
        
        //when
        calculatorQueue.dequeue()
        calculatorQueue.dequeue()
        calculatorQueue.dequeue()
  
        XCTAssertEqual(calculatorQueue.count, 0)
    }
    
    func test_When_dequeue_empty_queue_Expect_return_nil() {
        //when
        calculatorQueue.allClear()
         
        //then
        XCTAssertNil(calculatorQueue.dequeue())
    }
    
    func test_When_allClear_Expect_count_is_0() {
       //when
        calculatorQueue.allClear()
        
        //then
        XCTAssertEqual(calculatorQueue.count, 0)
    }
    
}
