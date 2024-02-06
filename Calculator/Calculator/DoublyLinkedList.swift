//
//  DoublyLinkedList.swift
//  Calculator
//
//  Created by Jaehun Lee on 2/6/24.
//

protocol DoublyLinkedListProtocol {
    associatedtype Element
    var count: Int { get set }
    var isEmpty: Bool { get }
    mutating func addFirst(element: Element)
    mutating func addLast(element: Element)
    mutating func removeFirst() -> Element?
    mutating func removeLast() -> Element?
}

struct DoublyLinkedList<Element>: DoublyLinkedListProtocol {
    private var header: Node<Element>
    private var trailer: Node<Element>
    private var _count: Int = 0
    
    var count: Int {
        get {
            return 0
        }
        set {
            
        }
    }
    
    var isEmpty: Bool {
        return true
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
        
        _count += 1
    }
    
    private mutating func remove(node: Node<Element>) -> Element? {
        guard let predecessor = node.prev,
              let successor = node.next else {
            return nil
        }
        
        predecessor.setNext(node: successor)
        successor.setPrev(node: predecessor)
        
        _count -= 1
        
        return node.element
    }
    
    func addFirst(element: Element) {
        
    }
    
    func addLast(element: Element) {
        
    }
    
    func removeFirst() -> Element? {
        return nil
    }
    
    func removeLast() -> Element? {
        return nil
    }
}
