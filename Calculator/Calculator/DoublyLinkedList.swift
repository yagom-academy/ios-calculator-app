//
//  DoublyLinkedList.swift
//  Calculator
//
//  Created by Jaehun Lee on 2/6/24.
//

protocol DoublyLinkedListProtocol {
    associatedtype Element
    var count: Int { get }
    var isEmpty: Bool { get }
    var first: Element? { get }
    var last: Element? { get }
    mutating func addFirst(element: Element)
    mutating func addLast(element: Element)
    mutating func removeFirst() -> Element?
    mutating func removeLast() -> Element?
}

struct DoublyLinkedList<Element>: DoublyLinkedListProtocol {
    private var header: Node<Element>
    private var trailer: Node<Element>
    private(set) var count: Int = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    
    var first: Element? {
        guard !isEmpty else {
            return nil
        }
        
        return header.next?.element
    }
    
    var last: Element? {
        guard !isEmpty else {
            return nil
        }
        
        return trailer.prev?.element
    }
    
    init() {
        self.header = Node(element: nil)
        self.trailer = Node(element: nil)
        
        header.setNext(node: trailer)
        trailer.setPrev(node: header)
    }
    
    private mutating func addBetween(element: Element, predecessor: Node<Element>, successor: Node<Element>) {
        let newNode = Node(element: element)
        
        newNode.setPrev(node: predecessor)
        newNode.setNext(node: successor)
        predecessor.setNext(node: newNode)
        successor.setPrev(node: newNode)
        
        count += 1
    }
    
    private mutating func remove(node: Node<Element>) -> Element? {
        guard let predecessor = node.prev,
              let successor = node.next else {
            return nil
        }
        
        predecessor.setNext(node: successor)
        successor.setPrev(node: predecessor)
        
        count -= 1
        
        return node.element
    }
    
    mutating func addFirst(element: Element) {
        
    }
    
    mutating func addLast(element: Element) {
        
    }
    
    mutating func removeFirst() -> Element? {
        return nil
    }
    
    mutating func removeLast() -> Element? {
        return nil
    }
}
