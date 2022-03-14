//
//  ModelTests.swift
//  ModelTests
//
//  Created by Red on 2022/03/15.
//

import XCTest
@testable import Calculator

class ModelTests: XCTestCase {
    var sut: Queue!
    override func setUpWithError() throws {
        sut = Queue()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_숫자파라미터가_잘_들어가는가() {
        // given
        let numberValue: Double = 10
        let expectResult: [Double] = [10]
        // when
        sut.enqueue(with: numberValue)
        guard let result = sut.returnAllValue() as? [Double] else { return }
        // then
        XCTAssertEqual(result, expectResult)
    }

}
