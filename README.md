# 🧮 계산기➕➖➗✖️🟰
## 💬 소개
>기존 계산기와는 다르게 연산자 우선 순위를 무시하지만 Queue타입을 활용한 스택뷰와 레이블을 활용하여 계산 내역을 표시해주는 `karen`이 만든 계산기입니다.

</br>

## 🔖 목차 

1. [팀원](#1.)
2. [타임 라인](#2.)
3. [다이어그램](#3.)
4. [고민한 부분](#4.)
5. [트러블 슈팅](#5.)
6. [참고 링크](#6.)
7. [팀 회고](#7.)


---

</br>

<a id="1."></a>

## 1. 👩🏻‍💻 팀원

|        [Karen ♉️](https://github.com/karenyang835)        |
| :------------------------------------------------------: |
 | <Img src="https://i.imgur.com/auFOXpc.png" width="150"/> |


---

</br>

<a id="2."></a>

## 2. ⏰ 타임 라인

#### <`Commit` 메세지>
- ✍️[`docs`]:`README`나 문서작업
- 🆕[`feat`]:새로운 기능 구현
- 🪡[`style`]:스타일 관련 기능(코드의 구조/형태 개선)
- 🖨️[`chore`]:네이밍, 컨벤션 수정
- 🛠️[`refactor`]:전면 수정이 있을 때 사용
- 🔬[`fix`]:버그, 오류 해결
- ⌨️[`test`]:테스트 코드 수정하거나 추가
- 🔀[`merge`]:다른 브랜치를 `merge` 할 때 사용


<details><summary span style="color:black; background-color:#23ff2921; font-size:120%"><b>1주차</b></summary></span> 

|**날 짜**|**내 용**|
|:-:|-|
| 2023.05.29.(월)   |📝 프로젝트를 시작하기 위한 `git` 셋업 <br> 📝 자료구조 공부   |
| 2023.05.30.(화)   |📝 `Queue` 공부 <br>    |
| 2023.05.31.(수)   |📝 제네릭 공부 <br>    |
| 2023.06.01.(목)   |📝 `Double Stack` 공부<br>    |
| 2023.06.02.(금)   |📝 `LinkedList` 공부<br>    |

</details>

<details><summary span style="color:black; background-color:#d2ffd2; font-size:120%"><b>2주차</b></summary></span> 


|**날 짜**|**내 용**|
|:-:|-|
| 2023.06.05.(월)   |🆕 `Stack`로 `Queue` 구현 <br>    |
| 2023.06.06.(화)   |🛠️ `DoubleStack`로 `Queue` 수정<br>    |
| 2023.06.07.(수)   |🛠️ 양방향 `LinkedList`로 `Queue` 수정 <br> ⌨️ `Unit Test` 작성 <br>✍️ `Class diagram` 작성 |
| 2023.06.08.(목)   |🛠️ 단방향 `LinkedList`로 `Queue` 수정 <br>🛠️ `PR` 피드백 요청사항 반영 <br>|
| 2023.06.09.(금)   |✍️ `README` 작성 <br>    |

</details>

---

</br>

<a id="3."></a>

## 3.📊 UML
![image](https://github.com/karenyang835/pr-exercise/assets/124643896/40010fd6-2b8c-4a5f-a36c-5102c1a53ace)

---

</br>

<a id="4."></a>

## 4. 🤔 고민한 부분

### 1️⃣ 자료구조가 왜 필요할까?
>자료구조라는 것이 생소하기에 자료구조가 무엇인지부터 찾아봐야 했고 해당 프로젝트에서 왜 자료구조가 필요한지부터 고민해보았습니다.
- 자료구조는 데이터를 구성하고 조직화하여 효율적인 계산 및 데이터처리를 가능하게 해주기에 필요하다고 생각되어졌습니다. 특히나 이번에 구현해야되는 계산기의 특성상 연산을 저장하고 관리를 해줘야하고 계산 결과를 표시하기 위해 지금까지 입력해줬던 값을 저장하고 계산 결과를 출력해야되기 때문이라고 생각되어졌습니다. 그러면서 든 생각이 '`Array`로 구현하면 되는것 아닌가?'라는 생각이 들었는데 찾아보니 자주 사용하던 `Array`도 자료구조의 한 종류라는 것을 알게 되었습니다.

### 2️⃣ 왜 `Queue`타입 구현을 위해 `LinkedList`를 사용하게 되었는가?
#### 1) 처음의 선택 : `Stack`
- 처음에 미션을 잘못 이해해서 `Stack`방법으로 구현하려고 했었습니다. `CE`버튼은 뒤에서부터 지워져야 하기에 후입 선출 구조인 `Stack`이 적합하다고 생각했습니다.

#### 2) 두번째 선택 : `DoubleStack`
- 계산기에서 가장 중요한 역활이 연산인데 이번 계산기 프로젝트에서는 연산자 우선 순위를 무시하고 앞에서부터 순서대로 계산을 해야는데 그렇게 되면 후입선출방식인 `Stack`은 적합하지 않은 것 같아 '그것을 보완해서 할 수 있는 방법이없을까?' 조금 더 찾아보니 `Array` 두 개를 활용한 `DoubleStack`로 해결할 수 있을 것 같았습니다. 자료구조를 작성할 때 중요하게 생각되어질 부분인 시간 복잡도와 메모리 관리적인 측면에서도 양호했습니다.

#### 3) 세번째 선택 : 단방향 `LinkedList`
- `LinkedList`를 선택한 것은 `Queue`에서 필요한 포인터가 2가지가 있는데 그 중에 하나는 가장 앞 부분 `Front`와 가장 뒷 부분 `Rear`의 포인터가 필요한데 `LinkedList`를 작성하는데 필요한 `Node`에서 `head`와 `Tail`을 통해 관리를 하므로 각각의 포인터를 주기에 적합하다 여겨졌고 `DoubleStack`보다 `LinkedList`가 메모리 관리 측면에서 더 용이할 것 같았으며, 빈번히 일어나는 삽입 및 삭제 연산이 배열보다 빠르고 메모리 공간을 효율적으로 사용할 수 있다는 점에서 `LinkedList`를 선택했습니다.

#### 4) 최종 선택 : 양방향 `LinkedList`
- `LinkedList`형태로 구현하는 방법중에서도 단방향과 양방향 `LinkedList` 중 양방향 `LinkedList`  방법으로 결정을 했습니다. 단방향 `LinkedList` 는 값을 접근할 경우 앞에서부터 접근을 해야되기 때문에 접근속도가 느리다는 단점이 있는데 양방향으로 구현을 할 경우 앞 뒤의 주소값을 알고 있기 때문에 단방향`LinkedList` 보다 접근 속도가 빠릅니다.

### 3️⃣ 다양한 타입을 받아올 수 있는 방법이 있을까?
- 자료구조로 `Queue`를 구현했지만 막상 해당 내용을 활용할때 다양한 타입을 한 꺼번에 처리할 수 있는 방법은 없는지 고민해봤습니다. 계산기는 `Int`값도 들어오고 소수점이 표기되어져야 해서 `Double`도 들어올 수 있으며, 연산자가 `String`로 들어올거라 한 가지 타입으로만 지정할 수 없어서 이 세 가지 타입을 문제없이 가져올 수 있는 방법을 찾아보니 제네릭 타입이라는 것을 활용하면 다양한 타입을 받아올 수 있었습니다.

---
</br>


<a id="5."></a>

## 5. 🚨 트러블 슈팅

### 1️⃣ 프로토콜의 확장
#### ⛔️ 문제점
- `Step01`에서 요구하는데로 프로토콜을 비워두었더니 `unitTest`에서 제네릭 타입을 인식을 못해 테스트를 진행할 수가 없는 문제점이 발생했습니다.


#### ✅ 해결 방법
- 기본 데이터 타입 중 계산기에서 요구하는 타입들을 추가로 확장시켜주었습니다.

#### 수정 전

```swift
protocol CalculateItem {}    
```

#### 수정 후

```swift
//정수값
extension Int: CalculateItem {} 
//소수점
extension Double: CalculateItem {}
//연산자
extension String: CalculateItem {}  
```

</details>

### 2️⃣ `append`동작이 원활하지 않는 점

#### ⛔️ 문제점
#### `head`와 `tail`의 초기화 부분을 제대로 처리하지 않는 문제점이 발생 
- `head`노드가 `nil`일 경우에 `newNode`를 `head`와 `tail`로 설정한 뒤 종료를 해버리므로 `head`가 `nil`이 아닌 경우를 파악할 수 없기 때문에 새로운 노드를 `LinkedList`에 추가할 수가 없는 문제점이 생겨버립니다.

#### ✅ 해결 방법
- `if`문으로 조건을 걸어서 `head = nil`인 경우에는 `newNode`를 `head`와 `tail`로 설정해주고 `nil`이 아닌 경우에는 기존의 마지막 노드의 `next`를 새로운 노드로 설정하여 `LinkedList`에 추가해주게끔 수정하였습니다.

<details>
<summary>코드 상세</summary>

#### 수정 전

```swift
 mutating func append(data: Element) {
        let newNode = Node(data: data)
        
        guard let tailNode = head else {
            head = newNode
            tail = newNode
            return
        }
        
        tailNode.next = newNode
        tail = newNode
    }  
```

#### 수정 후

```swift
mutating func append(data: Element) {
        let newNode = Node(data: data)
        
        if head == nil {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }   
```

</details>
    

---

</br>

<a id="6."></a> 

## 6. 🔗 참고 링크

🍎 [Swift API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)<br>
<img src="https://github.com/karenyang835/ios-calculator-app/assets/124643896/ffe12065-60d0-4913-b258-53383f11d586" width = 20 /> [BLOG - 시간 복잡도](https://velog.io/@reasonz/2022.06.24-자료구조-알고리즘-개념-시간복잡도-Big-O) <br>
<img src="https://github.com/karenyang835/ios-calculator-app/assets/124643896/ffe12065-60d0-4913-b258-53383f11d586" width = 20 />[BLOG - Queue, 시간 복잡도, 시간복잡도 test](https://jeong9216.tistory.com/350)<br>
<img src="https://github.com/karenyang835/ios-calculator-app/assets/124643896/ffe12065-60d0-4913-b258-53383f11d586" width = 20 /> [BLOG - Queue, Stack, LinkedList](https://woongsios.tistory.com/222)<br>
<img src="https://github.com/karenyang835/ios-calculator-app/assets/124643896/ffe12065-60d0-4913-b258-53383f11d586" width = 20 /> [BLOG - 제네릭](https://seons-dev.tistory.com/entry/Swift-기초문법-제네릭-Generic)<br>
<img src="https://github.com/karenyang835/ios-calculator-app/assets/124643896/ffe12065-60d0-4913-b258-53383f11d586" width = 20 /> [BLOG - LinkedList](https://jeong9216.tistory.com/401)<br>

---

</br>

<a id="7."></a>

## 7. 💌 팀 회고

### 👏🏻 칭찬할 부분
- 해당 프로젝트에서 요구하는 사항에 대해 의문을 가지고 왜 필요한지를 고민하여 코드를 작성했습니다.
- 프로젝트에 필요한 부분을 심도있게 공부하고 이해한 다음 진행을 했습니다.


### 👊🏻 개선해야할 부분
- 조금 더 꼼꼼하게 코드를 확인하는 습관을 길러야 되겠습니다.
    - 중복된 코드를 캐치하지 못하는 부분을 개선해야겠습니다.
    - test로 제대로 구현되었는지 확인하는 습관을 길러야겠습니다.


</br>

    
