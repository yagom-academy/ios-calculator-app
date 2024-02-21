//
//  DoublyLinkedList.swift
//  Calculator
//
//  Created by Prism, Hamzzi on 2/6/24.
//

protocol DataAccessable {
    associatedtype Element
    var count: Int { get }
    var isEmpty: Bool { get }
    var first: Element? { get }
    var last: Element? { get }
}

protocol DoublyLinkedListProtocol: DataAccessable {
    mutating func addFirst(element: Element)
    mutating func addLast(element: Element)
    mutating func removeFirst() -> Element?
    mutating func removeLast() -> Element?
}

struct DoublyLinkedList<Element: Equatable>: DoublyLinkedListProtocol {
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
        
        header.setNextNode(as: trailer)
        trailer.setPreviousNode(as: header)
    }
    
    private mutating func addBetween(element: Element, predecessor: Node<Element>, successor: Node<Element>) {
        let newNode = Node(element: element)
        
        newNode.setPreviousNode(as: predecessor)
        newNode.setNextNode(as: successor)
        predecessor.setNextNode(as: newNode)
        successor.setPreviousNode(as: newNode)
        
        count += 1
    }
    
    private mutating func remove(node: Node<Element>) -> Element? {
        guard let predecessor = node.prev,
              let successor = node.next else {
            return nil
        }
        
        predecessor.setNextNode(as: successor)
        successor.setPreviousNode(as: predecessor)
        
        count -= 1
        
        return node.element
    }
    
    mutating func addFirst(element: Element) {
        guard let nextNodeOfHeader = header.next else {
            return
        }
        
        addBetween(element: element, predecessor: header, successor: nextNodeOfHeader)
    }
    
    mutating func addLast(element: Element) {
        guard let prevNodeOfTrailer = trailer.prev else {
            return
        }
        
        addBetween(element: element, predecessor: prevNodeOfTrailer, successor: trailer)
    }
    
    mutating func removeFirst() -> Element? {
        guard !isEmpty, let firstNode = header.next else {
            return nil
        }
        
        return remove(node: firstNode)
    }
    
    mutating func removeLast() -> Element? {
        guard !isEmpty, let lastNode = trailer.prev else {
            return nil
        }
        
        return remove(node: lastNode)
    }
}
