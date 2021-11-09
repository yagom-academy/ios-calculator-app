//
//  CauculatorItemQueueTests.swift
//  CauculatorItemQueueTests
//
//  Created by Jae-hoon Sim on 2021/11/08.
//

import XCTest

class CauculatorItemQueueTests: XCTestCase {
    var sut: CalculatorItemQueue<Int>!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = CalculatorItemQueue<Int>()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_enqueue호출시_4를전달하면_list에4가추가되는지() {
        //given
        let input = 4
        
        //when
        sut.enqueue(input)
        let result = sut.list
        
        //then
        XCTAssertEqual(result, [4])
    }

}
