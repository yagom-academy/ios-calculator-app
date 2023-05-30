//
//  CalculaterItemLinkedListTests.swift
//  CalculaterItemLinkedListTests
//
//  Created by 표현수 on 2023/05/30.
//

import XCTest
@testable import Calculator

final class CalculaterItemLinkedListTests: XCTestCase {
    var sut: CalculaterItemLinkedList!
    
    override func setUpWithError() throws {
        sut = CalculaterItemLinkedList()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    
}
