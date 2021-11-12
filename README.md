## iOS 커리어 스타터 캠프

### 계산기 프로젝트 저장소

- 이 저장소를 자신의 저장소로 fork하여 프로젝트를 진행합니다

# 목차

* 계산기 프로젝트

1. 프로젝트 기간: 2021.11.8 ~ 11.19
2. 개인프로젝트
3. Grounds Rules 
   * 의존모듬끼리 8시에 모여서 스크럼
   * 서로 모르는것에 대하여 적극적으로 질문하기
   * 모르는 개념이 나와도 포기하지않고 공식문서를 통해 찾아보며 하기
4. Commit 규칙
   * 4-July를 Folk를 받아온 후 -> step1 브랜치를 따로 만들어서 관리
   * 카르마 스타일 
   * TDD로 구현 및 하나의 Test단위로 


# Queue를 구현하는 방식
DoubleStack 방식과 Node를 통한 List방식을 고민 
결국 Node를 통한 List 구현 

### 노드 

```swift
class Node<T> {
    var data: T
    var pointer: Node?
    
    init(data: T, pointer:Node? = nil) {
        self.data = data
        self.pointer = pointer
    }
}
```

### 리스트 

```swift
class LinkedList<T> {
    var head: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
    
    init(head: Node<T>) {
        self.head = head
    }
    
    func enqueue(in data: T) {
        var finderForLast: Node<T>?
        
        guard isEmpty == false else {
            head = Node(data: data, pointer: nil)
            return
        }
        
        finderForLast = head
        while finderForLast?.pointer != nil {
            finderForLast = finderForLast?.pointer
        }
        finderForLast?.pointer = Node(data: data, pointer: nil)
    }
    
    func dequeue() {
        guard isEmpty == false else { return }
        
        head = head?.pointer
    }
```
# 추후 step2 계획
* 먼저 입력을 받으면 타입캐스팅을 통하여, 숫자인지 아닌지를 구분하고 
* 상속받은 LinkedList를 통하여, Int타입을 모두 Double로 만들어주어 하나의 List를 만들고
* 다른 하나의 List에는 operation만 받아, 하나씩 불러와 계산하는 로직 구현을 생각중 
        
        
