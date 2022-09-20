//
//  CalculatorItemQueue .swift
//  Calculator
//
//  Created by 유제민 on 2022/09/20.
//

struct CalculatorItemQueue {
    private var elementCount: Int = 0
    var queue:[String: [Int: Item]] = [
        "queue": [: ]
    ]
}

struct Item: Hashable {

}
