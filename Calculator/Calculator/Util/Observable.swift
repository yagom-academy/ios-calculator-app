//
//  Observable.swift
//  Calculator
//
//  Created by Lingo on 2022/03/23.
//

import Foundation

final class Observable<T> {
  private var subscriber: ((T) -> Void)?
  private(set) var value: T {
    didSet {
      subscriber?(value)
    }
  }
  
  init(_ value: T) {
    self.value = value
  }
  
  func bind(_ subscriber: @escaping (T) -> Void) {
    subscriber(self.value)
    self.subscriber = subscriber
  }
  
  func next(_ value: T) {
    self.value = value
  }
}
