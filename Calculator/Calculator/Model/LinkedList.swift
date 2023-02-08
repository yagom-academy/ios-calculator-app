//  Calculator - LinkedList.swift
//  created by vetto on 2023/01/27

struct LinkedList<Element: CalculateItem> {
    private(set) var head: Node<Element>?
    private(set) var tail: Node<Element>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func append(_ data: Element) {
        let node = Node(data: data)
        if head == nil {
            head = node
            tail = node
        } else {
            tail?.next = node
            tail = node
        }
    }
    
    mutating func removeFirst() -> Element? {
        guard let node = head else {
            return nil
        }
        self.head = head?.next
        return node.data
    }
}
