import XCTest
@testable import Calculator

class CalculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_5번_enqueue시_queue의_count가_5인가() {
        //when
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        sut.enqueue(5)
        
        //then
        XCTAssertEqual(sut.count, 5)
    }
    
    func test_enqueue_2번하고_dequeue하고_enqueue_2번하면_queue의_count는_3인가() {
        //when
        sut.enqueue(1)
        sut.enqueue(2)
        XCTAssertNotNil(sut.dequeue())
        sut.enqueue(3)
        sut.enqueue(4)
        //then
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_1_2_3의_값을_enqueue뒤_dequeue했을때_1_2_3이_순서대로_pop되는가() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        //when
        var result = sut.dequeue()
        //then
        XCTAssertEqual(result, 1)
        
        //when
        result = sut.dequeue()
        //then
        XCTAssertEqual(result, 2)
        
        //when
        result = sut.dequeue()
        //then
        XCTAssertEqual(result, 3)
    }
    
    func test_enqueue_3번_dequeue4번_했을때_반환값이_nil인가() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        //when
        var result = sut.dequeue()
        result = sut.dequeue()
        result = sut.dequeue()
        result = sut.dequeue()
        //then
        XCTAssertNil(result)
    }
    
    func test_1_2_값을_enqueue하고_clear_했을때_isEmpty가_true인가() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)

        //when
        sut.clear()
        
        //then
        XCTAssertEqual(sut.isEmpty, true)
    }
    
    func test_1_2_값을_enqueue하고_dequeue후_clear_했을때_isEmpty가_true인가() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)
        XCTAssertNotNil(sut.dequeue())
        
        //when
        sut.clear()
        
        //then
        XCTAssertEqual(sut.isEmpty, true)
    }
    
    func test_clear하고_enqueue_했을때_isEmpty가_false인가() {
        //when
        sut.clear()
        sut.enqueue(4)
        
        //then
        XCTAssertEqual(sut.isEmpty, false)
    }
}
