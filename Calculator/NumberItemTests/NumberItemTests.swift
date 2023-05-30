//
//  NumberItemTests.swift
//  NumberItemTests
//
//  Created by myungsun on 2023/05/30.
//

import XCTest
@testable import Calculator

final class NumberItemTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_NumberItem_인스턴스의_프로퍼티인_number_프로퍼티가_제대로_들어갔는지_확인한다() {
        let number = 7.29
        let numberDescription = "7.29"
        let numberItem = NumberItem(number: number)
        
        XCTAssertEqual(numberItem.number, number)
        XCTAssertEqual(numberItem.numberDescription, numberDescription)
    }
}
