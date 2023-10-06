//
//  LinkedList.swift
//  Calculator
//
//  Created by Toy on 10/6/23.
//

import Foundation

final class Node<T> {
  var value: T
  var next: Node?
  weak var previous: Node?

  public init(value: T) {
    self.value = value
  }
}
