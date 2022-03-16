//
//  CalculatorLinkedList.swift
//  Calculator
//
//  Created by song on 2022/03/15.
//

import Foundation

final class Node<T> {
  private(set) var data: T
  var next: Node?
  var previous: Node?
  
  init(_ data: T) {
    self.data = data
    self.next = nil
    self.previous = nil
  }
}

final class LinkedList<T> {
  var head: Node<T>?
  var tail: Node<T>?
  
  func append(data: T) {
    let newNode = Node(data)
    
    if head == nil {
      self.head = newNode
      self.tail = newNode
      return
    }
    self.tail?.next = newNode
    newNode.previous = tail
    self.tail = newNode
  }
  
  func removeFirst() {
    self.head = self.head?.next
  }
  
  func removeLatest() {
    tail?.previous?.next = tail?.next
    self.tail = self.tail?.previous
  }
  
  func removeAll() {
    self.head = nil
    self.tail = nil
  }
  
  func showAll() -> [T] {
    var allNode: [T] = []
    var headDate = self.head
    
    while tail?.next == nil {
      guard let date = headDate?.data  else {
        return allNode
      }
      allNode.append(date)
      headDate = headDate?.next
    }
    return allNode
  }
}

