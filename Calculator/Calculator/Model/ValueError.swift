//
//  ValueError.swift
//  Calculator
//
//  Created by 정선아 on 2022/09/30.
//

import Foundation

enum ValueError: Error {
    case divideByZero
    case emptyOperandsQueue
    case emptyOperatorsQueue
}
