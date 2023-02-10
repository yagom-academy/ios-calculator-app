//  Calculator - Node.swift
//  created by 리지, vetto, Andrew on 2023/01/24

final class Node<Element: CalculateItem> {
    let data: Element?
    var next: Node<Element>?
    
    init(data: Element?, next: Node<Element>? = nil) {
        self.data = data
        self.next = next
    }
}
