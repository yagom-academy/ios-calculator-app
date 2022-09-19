
//  Created by hy on 2022/09/19.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    var sut: CalculatorItemQueue<Any>!
    //var sup: CalculatorItemQueue<String>! 예시처럼 하려고 했으나!
    //처음에 몽땅 스트링으로 받아와서, 인트 필요시 인트로 변환해서 비교
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
        
    }
    
    func test_enqueue호출시값이잘들어가는지() {
        //given
        let input = 2
        //when
        sut.enqueue(element: input)
        //then
        XCTAssertEqual(sut.queue, [2])
    }
    
    func test_enqueue호출시여러개를넣었을때처음입력값과첫번째인덱스가일치하는지() {
        //given
        let inputArray:[Any] = [2,4,5,"+"]
        //when
        var result:[Int] = []
        for input in inputArray {
            sut.enqueue(element: input)
        }
        result = sut.queue
        //then
        XCTAssertEqual(result[0], 2)
    }
}
