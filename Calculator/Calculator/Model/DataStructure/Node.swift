final class Node<Element: CalculateItem> {
    var next: Node?
    var value: Element
    
    init(next: Node? = nil, value: Element) {
        self.next = next
        self.value = value
    }
}
