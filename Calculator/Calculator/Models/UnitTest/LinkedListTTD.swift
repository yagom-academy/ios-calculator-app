import XCTest

class LinkedListTTD: XCTestCase {
    // TODO: 다양한 데이터를 담을 수 있는 Linked List 만들기
    var linkedList: LinkedList<Int>!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        linkedList = LinkedList<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        linkedList = nil
    }
    
    // MARK: - Add values into linked list.

    func test_값을2개넣으면_count는_2를반환() throws {
        // given
        let inputValue1: Int = 3
        let inputValue2: Int = 3
        let expectation: Int = 2
        
        // what
        linkedList.pushBeforeHead(element: inputValue1)
        linkedList.pushBeforeHead(element: inputValue2)
        
        // then
        XCTAssertEqual(linkedList.count, expectation)
    }
    
    func test_head_쪽에_추가하면_popHead는_추가한값을반환() throws {
        // given
        let inputValue: Int = 7
        let expectation: Int = inputValue
        
        // what
        linkedList.pushBeforeHead(element: inputValue)
        
        // then
        XCTAssertEqual(linkedList.popHead(), expectation)
    }
    
    func test_popHead하면_count가_줄어든다() throws {
        // given
        let inputValue: Int = 7
        let expectation1: Int = 1
        let expectation2: Int = 0
        
        // what
        linkedList.pushBeforeHead(element: inputValue)
        
        // then
        XCTAssertEqual(linkedList.count, expectation1)
        
        // what
        linkedList.popHead()
        
        // then
        XCTAssertEqual(linkedList.count, expectation2)
    }
    
    func test_peekHead할경우_head의데이터를보여준다() throws {
        // given
        let inputValue: Int = 8
        let expectation: Int = inputValue
        
        // what
        linkedList.pushBeforeHead(element: inputValue)
        
        // then
        XCTAssertEqual(linkedList.peekHead(), expectation)
    }
    
    func test_값이없을경우_true를반환() throws {
        // given
        // what
        // then
        XCTAssertTrue(linkedList.isEmpty())
    }
    
    func test_값이있을경우_false를반환() throws {
        // given
        // what
        // then
        XCTAssertTrue(linkedList.isEmpty())
    }

    func test_tail_쪽에_추가하면_popTail는_추가한값을반환() throws {
        // given
        let inputValue: Int = 7
        let expectation: Int = inputValue
        
        // what
        linkedList.pushAfterTail(element: inputValue)
        
        // then
        XCTAssertEqual(linkedList.popTail(), expectation)
    }
    
    func test_popTail하면_count가_줄어든다() throws {
        // given
        let inputValue: Int = 7
        let expectation1: Int = 1
        let expectation2: Int = 0
        
        // what
        linkedList.pushAfterTail(element: inputValue)
        
        // then
        XCTAssertEqual(linkedList.count, expectation1)
        
        // what
        linkedList.popTail()
        
        // then
        XCTAssertEqual(linkedList.count, expectation2)
    }
    
    func test_peekTail할경우_Tail의데이터를보여준다() throws {
        // given
        let inputValue: Int = 8
        let expectation: Int = inputValue
        
        // what
        linkedList.pushAfterTail(element: inputValue)
        
        // then
        XCTAssertEqual(linkedList.peekTail(), expectation)
    }
    
    func test_1번인덱스의값을제거하면_count의값이1줄어든다() throws {
        // given
        let index: Int = 1
        let inputValue1: Int = 1
        let inputValue2: Int = 2
        let inputValue3: Int = 3
        let expectation1: Int = 3
        let expectation2: Int = 2
        
        // what
        linkedList.pushAfterTail(element: inputValue1)
        linkedList.pushAfterTail(element: inputValue2)
        linkedList.pushAfterTail(element: inputValue3)
        
        // then
        XCTAssertEqual(linkedList.count, expectation1)
        
        // what
        linkedList.remove(ofIndex: index)
        
        // then
        XCTAssertEqual(linkedList.count, expectation2)
    }
    
    func test_서브스크립트로_해당값에_접근() throws {
        // given
        let index: Int = 1
        let inputValue1: Int = 1
        let inputValue2: Int = 2
        let inputValue3: Int = 3
        let expectation: Int = 2
        
        // what
        linkedList.pushAfterTail(element: inputValue1)
        linkedList.pushAfterTail(element: inputValue2)
        linkedList.pushAfterTail(element: inputValue3)
        
        // then
        XCTAssertEqual(linkedList[index], expectation)
    }
    
    func test_반복문사용() throws {
        // given
        let inputValue1: Int = 1
        let inputValue2: Int = 2
        let inputValue3: Int = 3
        let expectation: [Int] = [1, 2, 3]
        
        // what
        linkedList.pushAfterTail(element: inputValue1)
        linkedList.pushAfterTail(element: inputValue2)
        linkedList.pushAfterTail(element: inputValue3)
        
        // then
        for (i, j) in zip(linkedList, expectation) {
            XCTAssertEqual(i, j)
        }
    }
    
}
