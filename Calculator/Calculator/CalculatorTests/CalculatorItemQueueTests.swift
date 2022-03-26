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
    
    func test_enqueue_n번_했을때_count가_올바른가() {
        //when
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        sut.enqueue(4)
        sut.enqueue(5)
        
        //then
        XCTAssertEqual(sut.count, 5)
    }
    
    func test_enqueue_dequeue하고_enqueue했을때_count는_올바른가() {
        //when
        sut.enqueue(1)
        sut.enqueue(2)
        XCTAssertNotNil(sut.dequeue())
        sut.enqueue(3)
        sut.enqueue(4)
        //then
        XCTAssertEqual(sut.count, 3)
    }
    
    func test_dequeue_1_2_3_enqueue일때_순서대로_pop되는가() {
        //given
        var result: [Double] = []
        sut.enqueue(1)
        sut.enqueue(2)
        sut.enqueue(3)
        
        //when
        result.append(sut.dequeue()!)
        result.append(sut.dequeue()!)
        result.append(sut.dequeue()!)
        //then
        XCTAssertEqual(result, [1,2,3])
    }
    
    func test_dequeue_enqueue보다_dequeue를_많이했을때_반환값이_올바른가() {
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
    
    func test_isEmpty_enqueue하고_clear_했을때_반환값이_올바른가() {
        //given
        sut.enqueue(1)
        sut.enqueue(2)

        //when
        sut.clear()
        
        //then
        XCTAssertEqual(sut.isEmpty, true)
    }
}
