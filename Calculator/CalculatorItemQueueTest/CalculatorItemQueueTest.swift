import XCTest
@testable import Calculator

class CalculatorItemQueueTest: XCTestCase {
    var sut: CalculatorItemQueue<Double>!
    
    override func setUpWithError() throws {
        sut = CalculatorItemQueue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    //MARK: - enqueue
    func test_enqueue호출시_정상적으로추가가되는지() {
        //given
        let input: Double = 2
        let input2: Double = 4
        let input3: Double = 7
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        //then
        XCTAssertEqual(sut.first, input)
        XCTAssertEqual(sut.last, input3)
        XCTAssertEqual(sut.count, 3)
    }
    //MARK: - dequeue
    func test_dequeue호출시_FIFO가정상적으로진행되는지() {
        //given
        let input: Double = 5
        let input2: Double = 2
        let input3: Double = 9
        //when
        sut.enqueue(input)
        sut.enqueue(input2)
        sut.enqueue(input3)
        
        let firstOut = sut.dequeue()
        let secondOut = sut.dequeue()
        let thirdOut = sut.dequeue()
        //then
        XCTAssertEqual(firstOut, input)
        XCTAssertEqual(secondOut, input2)
        XCTAssertEqual(thirdOut, input3)
    }
    
    func test_dequeue호출시_배열이비어있을때_nil을반환하는지() {
        //when
        let result = sut.dequeue()
        //then
        XCTAssertNil(result)
    }
}
