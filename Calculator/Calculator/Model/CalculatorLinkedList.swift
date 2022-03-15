//
//  CalculatorLinkedList.swift
//  Calculator
//
//  Created by song on 2022/03/15.
//

import Foundation

class Node<T> {
  var data: T
  var next: Node?
  
  init(_ data: T) {
    self.data = data
    self.next = nil
  }
}

class LinkedList<T> {
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
    self.tail = newNode
  }
  
  func removeHead() {
    self.head = self.head?.next
  }
  
  func removeAll() {
    self.head = nil
    self.tail = nil
  }
}

