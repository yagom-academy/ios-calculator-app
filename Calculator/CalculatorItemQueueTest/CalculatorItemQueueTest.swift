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
    }
}
