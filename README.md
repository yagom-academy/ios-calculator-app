## **iOS 계산기 프로젝트**

- iOS 계산기 앱을 구현합니다

### **프로젝트 참여자**

@singularis7

### **리뷰어**

@AppleCEO 도미닉

### **프로젝트 기간**

2021.11.08 ~ 2021.11.19

---

## **프로젝트 개요**

### **[Step 1]**

- 연산자와 피연산자를 연산하기 전에 보관할 자료구조로 `Queue` 를 구현하였습니다.
- 삽입 / 삭제를 O(1) 시간복잡도를 갖도록 `LinkedList`를 채택하여 큐를 구현하였습니다.
- UnitTest를 활용한 `TDD` 방식을 접목하도록 시도해보았습니다

---

### **Model UML Diagram**

![https://user-images.githubusercontent.com/25794814/141100293-c390e779-b0a2-4dae-bce7-b9127f5b98db.png](https://user-images.githubusercontent.com/25794814/141100293-c390e779-b0a2-4dae-bce7-b9127f5b98db.png)

---

## [Step 1] **Queue 타입 구현**

### Keyword

- Queue
- LinkedList
- TDD
- UnitTest

### 고민 했던 부분

- `CalculatorItemQueue`에서 다루는 요소는 `CalculateItem` 프로토콜을 준수하기위한 접근법
    1. `CalculateItem` 프로토콜을 `CalculatorItemQueue`에서 다루는 요소의 타입으로 사용
        
        초기 구현 방법으로 큐 내부의 컬렉션에 `CalculateItem` 타입으로 담아주는 방법을 구현했지만 다음의 어려움이 있었습니다.
        
        - Queue에서 dequeue한 자료를 XCTAssert 를 이용해 비교할 수 없습니다. 비교 작업은 Equatable 을 채택한 타입의 인스턴스 끼리만 비교할 수 있다는 오류를 마주치게 됩니다.
        - 억지로 비교하는 작업을 수행하려면 `CalculateItem` 을 준수하는 다른 타입으로 다운 캐스팅하여 비교해야합니다. 다운캐스팅이 가능한 타입을 `as?` 를 통해 매번 구분해줘야 하기 때문에 코드가 복잡해집니다.
        
        ```swift
        // Example
        let item: CalculateItem = queue.dequeue()
        
        if let item as? String {
            XCTAssertEqual(, )
        } else if let item as Int {
           
        ```
        
    2. `CalculateItem` 프로토콜을 준수하는 Generic 을 활용한 `CalculatorItemQueue` 요소 타입 사용
    CalculateItem 프로토콜을 준수하는 어느 타입으로 Queue 를 활용하여 첫번째 문제를 해결해보았습니다. `CalculatorItemQueue`에서 다루는 요소는 `CalculateItem` 프로토콜을 준수한다는 요구조건에 부합하며 다운 캐스팅할 필요없이 자신의 타입을 명확히 알 수 있는 방식이기 때문입니다.
        
        ```swift
        struct CalculatorItemQueue<Element> where Element: CalculateItem {
        	...
        }
        ```
        
    
- Queue 를 구현할 자료구조를 선택하는 접근법
    
    컴퓨터에서 사용하는 자원을 정량화 할 때 시간복잡도와 공간복잡도 개념을 많이 사용합니다. 현재 프로젝트에서 구현하는 Queue 처럼 동작하는 연산을 구현하려면 첫번째 요소에 접근하고 제거하는 비용이 적고 마지막 요소에 자료를 삽입하는 비용이 적을 수록 유리합니다. 이 기준을 통해 다음의 자료구조를 평가해보았습니다.
    
    1. Swift Standard Array
        
        Swift에서 기본으로 제공하는 컬렉션인 배열의 경우 삽입 삭제시 다음과 같은 시간복잡도를 갖습니다.
        
        기존에 배열이 할당해둔 capacity 범위에서는 O(1) 로 `append` 연산이 이뤄지지만 할당되어있는 capacity를 초과하는 경우 새로운 공간을 할당해서 값복사가 이뤄지기 때문에 최악의 경우 O(N)의 연산이 발생될 수 있습니다.
        
        > arrays increase their allocated capacity using an exponential strategy
        - [Apple Document - Array (append 메서드 부분)](https://developer.apple.com/documentation/swift/array/3126937-append)
        > 
        
        앞쪽 데이터를 삭제하는 removeFirst() 혹은 remove 메서드를 활용할 경우에도 O(N) 의 시간복잡도가 소요되기 때문에 삽입 / 삭제가 자주 이루어지는 큐에서 사용할 자료구조로 사용하기에는 너무 많은 연산 비용을 사용합니다.
        
    2. Singly LinkedList
        
        데이터의 삽입 / 삭제의 측면에서 더 적은 비용을 사용하기 위해 단방향 연결리스트를 구현해보았습니다. 데이터를 삽입할 때 마지막 노드를 찾아야 하기 때문에 O(N)의 비용이 들지만 첫번째 요소를 삭제하는 측면에서는 head 포인터를 끊어주고 다시 연결해주는 간단한 작업을 해주면 되기 때문에 더 저렴하게 연산을 할 수 있습니다. 하지만 저는 여전히 마지막에 데이터를 삽입하는 경우 O(N)의 비용이 비싸다고 생각했습니다.
        
    3. Doublely LinkedList
        
        시작 위치와 끝 위치를 동시에 기억해둡니다. 단방향 연결리스트와는 다르게 이전 노드의 메모리 주소도 기억하고 있기 때문에 노드간의 이동이 자유롭습니다. 앞 뒤에서 삽입 / 삭제를 할 때에 O(1)의 연산 비용이 들기 때문에 저렴합니다. 따라서 큐의 구현을 위한 자료구조로 적합합니다. 더 나아가 추후 연산 기능을 구현할 때 연산자의 우선순위를 고려하는 구현이 발생할 경우 연결리스트 구현을 활용한 스택 구현에 활용하기에도 좋습니다!
        
- 연결리스트에 담긴 모든 노드가 정상적으로 heap 에서 deallocate 되도록 고민한 접근법
    - Swift의 ARC 방식은 strong 참조 횟수를 세어서 0보다 큰 경우에는 heap 에서 클래스 인스턴스를 유지시키지만 참조하는 모든 연결고리가 끊어진 경우 (즉, 카운트가 0인 경우) heap에서 할당된 메모리를 회수한다고 가벼운 개념 정도만 잡고 있습니다.
    - 노드를 삭제하거나 LinkedList 자체가 사용되지 않을 경우 모든 노드가 정상적으로 deallocate 되도록 LinkedList를 설계했습니다. 즉, 삭제 연산 등의 메모리를 반환해야 하는 경우가 있다면 노드 간의 참조하는 모든 연결고리를 완벽히 끊어주고자 노력했습니다.
    - 이 과정은 UnitTest를 통해 검증하기가 어려워서 Node 클래스에 deinit 메서드 내부에 print를 호출하여 메모리가 회수되는 과정을 콘솔창을 통해 검증하면서 구현했습니다.
        
        
- Queue 설계를 UML 다이어그램으로 표현하기위한 접근법 [[README.MD]](https://github.com/smart8612/ios-calculator-app/tree/4-smart8612)
    - CalculatorQueue 타입은 제네릭을 통해 구현되어있습니다.
        
        제네릭 타입 T 는 반드시 CalculateItem 프로토콜 타입을 충족하는 타입만 담길 수 있기 때문에 의존관계를 갖는다고 생각하였으며 이를 의미하는 점선 화살표로 표현하였습니다.
        
    - LinkedList는 node의 전체에 해당되는 부분이고 node는 LinkedList의 부분에 해당되는 구조를 갖는다고 생각하였으며 LinkedList 내부에서 Node 인스턴스를 생성하고 있기 때문에 집합관계 중 합성관계를 갖는다고 생가했습니다. 따라서 색이 채워진 다이아몬드 화살표로 표현하였습니다.
    - CalculatorQueue 타입의 items 프로퍼티는 LinkedList 구조로 데이터를 담고 있습니다. 따라서 CalculatorQueue 타입은 LinkedList 타입을 사용하고 있기 때문에 연관관계를 가지며 Queue는 LinkedList를 알고 있지만 LinkedList는 Queue를 알지 못하기 때문에 연관 관계로 정의하였습니다.

---

## 개선하고자 노력한 부분

- 테스트 케이스는 메서드의 기능을 문서화하면서 코드를 검증하고자 하는 의도를 담아 한글명으로 지정했습니다.
- 초기 구현에서는 띄어쓰기를 구분하지 않고 이어서 적었지만 가독성 향상을 위해 `_` 를 활용하여 띄어쓰기를 구분하고 테스트하려는 함수와 입력값 및 출력값을 명확하게 보여주고자 개선해나가고 있습니다.
- 테스트 케이스별 독립적인 실행을 위한 코드의 중복을 피하기 위해 비슷한 테스트들끼리 System Under Test (SUT)를 `setUpWithError` ,  `tearDownWithError` 를 통해 지정하는 방식으로 구현하고자 하였습니다.
- 이른 `return` 방식의 코딩 컨벤션을 채택하여 else 의 사용을 줄여보고자 시도해보았습니다. 전제를 줄여나가면서 코딩할 수 있는 개선점이 있었습니다.
    
    ```swift
    @discardableResult
        func removeFirst() -> Element? {
            if isEmpty { return nil }
            
            let firstItem = head?.item
            
            guard let nextPosition = head?.next else {
                tail = nil
                return firstItem
            }
            
            head = nextPosition
            head?.previous = nil
            
            return firstItem
        }
    ```
