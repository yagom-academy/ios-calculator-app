//  Created by Aejong on 2022/09/23.

class LinkedListNode<T> {
    let value: T
    weak var previous: LinkedListNode?
    var next: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}
