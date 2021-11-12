# ios-calculator-app

# 목차
* [Description](#-Description)
* [구현 기능 및 코드](#-구현-기능-및-코드)

---

# Description
1. 프로젝트 기간: 2021.11.08 ~
2. 그라운드 룰
  * 오전 10시 스크럼 진행
  * 필요성을 설명할 수 없는 기능을 사용하지 않을 것.
  * 정해둔 휴식시간을 침범하여 프로젝트를 진행하지 말 것.
  * 이후 유지보수 혹은 이슈 파악을 위해서 커밋 단위를 일정하게 유지할 것.
  * 스탭 별로 리드미를 작성하여 정보가 휘발되지 않도록 할 것.

# 구현 기능 및 코드
[1. TDD](#-1.-TDD) <br/>
[2. Linked List](#-2.-Linked-List) <br/>
[3. Queue](#-3.-Queue) <br/>

<details>
<summary>세부</summary>
<div markdown="0">

### 1. TDD
테스트 주도 개발(Test Driven Development)로, 설계 이후 테스트 케이스를 작성하는 프로세스가 아닌 테스트 케이스를 작성한 이후 코드가 작성되는 프로세스를 의미한다.
```swift
func test_insert후test_Elements에값을그대로반환되는지() {
    let value = "5"
        
    sut.insert(value)
        
    XCTAssertEqual(sut.test_Elements(), [value])
}
```
  
### 2. Linked List
value와 next로 이루어진 노드가 연결되어 있는 자료구조이며, 자료의 추가나 삭제에 유리하다는 장점을 가지고 있다.
  
![](https://i.esdrop.com/d/ib27zr706hw4/nkLEcjayke.png)
  
```swift
class Node {
    let value: String
    var next: Node?
    
    init(value: String, next: Node?) {
        self.value = value
        self.next = next
    }
}
```
  
### 3. Queue
FIFO(First In First Out) 구조로 데이터를 저장하는 자료구조이다.

![](https://i.esdrop.com/d/ib27zr706hw4/rLhqox7jJJ.png)

</div>
</details>
