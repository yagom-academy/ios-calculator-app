import XCTest

class LinkedListTTD: XCTestCase {
    // TODO: 다양한 데이터를 담을 수 있는 Linked List 만들기
    var linkedList = LinkedListTTD!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        linkedList = LinkedListTTD()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        linkedList = nil
    }
    
    // MARK: - Add values into linked list.

    func test_값을2개넣으면_count_2두개반환() throws {
        // given
        var linkedList = LinkedList<Int>()
        let inputValue1: Int = 3
        let inputValue2: Int = 3
        let expectation: Int = 2
        
        // what
        linkedList.pushBeforeHead(element: inputValue1)
        linkedList.pushBeforeHead(element: inputValue2)
        
        // then
        XCTAssertEqual(linkedList.count, expectation)
    }
    

}
