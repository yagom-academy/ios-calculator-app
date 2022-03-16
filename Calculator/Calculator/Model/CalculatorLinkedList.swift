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
  var capacity: Int = Int.zero

  func append(data: T) {
    let newNode = Node(data)
    
    if head == nil {
      self.head = newNode
      self.tail = newNode
      self.capacity += 1
      return
    }
    self.tail?.next = newNode
    newNode.previous = tail
    self.tail = newNode
    self.capacity += 1
  }
  
  func removeFirst() {
    if self.head == nil {
      return
    }
    self.head = self.head?.next
    capacity -= 1
  }
  
  func removeLatest() {
    if self.head == nil {
      return
    }
    tail?.previous?.next = nil
    self.tail = self.tail?.previous
    capacity -= 1
  }
  
  func removeAll() {
    if self.head == nil {
      return
    }
    self.head = nil
    self.tail = nil
    capacity = Int.zero
  }
  
  func showAll() -> [T] {
    var allNode: [T] = []
    
    for _ in 0...capacity {
      guard let data = head?.data else {
        return allNode
      }
      allNode.append(data)
      head = head?.next
    }
    return allNode
  }
}

