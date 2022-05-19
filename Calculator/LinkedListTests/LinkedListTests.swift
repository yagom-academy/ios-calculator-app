import XCTest
@testable import Calculator

class LinkedListTests: XCTestCase {
    // MARK: Setting
    var sut: LinkedList<Double>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = LinkedList<Double>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    // MARK: Test_insert(data: T)
    func testLinkedList에_값이_data에_저장_되는지() {
        // given
        sut.insert(data: 1)
        // when
        let result = sut.head?.data
        // then
        XCTAssertEqual(result, 1)
    }
    
    func testLinkedList에_값을_추가했을_때_다음_데이터를_가리키는지() {
        // given
        sut.insert(data: 1)
        sut.insert(data: 2)
        sut.insert(data: 3)
        // when
        let result = sut.tail?.data
        // then
        XCTAssertEqual(result, 3)
    }
    
    // MARK: Test_delets()
    func testLinkedList의_마지막_값이_삭제_되는지() {
        // given
        sut.insert(data: 1)
        sut.insert(data: 2)
        sut.insert(data: 3)
        _ = sut.delete()
        // when
        let result = sut.tail?.data
        // then
        XCTAssertEqual(result, 2)
    }
}
