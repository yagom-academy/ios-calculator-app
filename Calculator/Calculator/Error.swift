//
//  Error.swift
//  Calculator
//
//  Created by 강경 on 2021/04/01.
//

import Foundation

enum StackError: Error, CustomStringConvertible {
  case exceedRangeOfStack
  
  var description: String {
    switch self {
    case .exceedRangeOfStack:
      return "Stack의 범위를 초과하였습니다."
    }
  }
}
