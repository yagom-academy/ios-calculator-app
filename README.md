# 🧮 Calculator

## 📚 목차
* [🧮 소개](#-소개)
* [👤 팀원](#-팀원)
* [📁 프로젝트 구조](#-프로젝트-구조)
* [🖥 실행화면](#-실행화면)
* [⏱ 타임라인](#-타임라인)
* [🔥 트러블 슈팅](#-트러블-슈팅)
* [📄 규칙](#-규칙)
* [🔍 참고 링크](#-참고-링크)

## 🧃 소개
### 프로젝트 기간: 23.01.24 ~ 23.02.03
* 간단한 계산기 프로그램입니다.
* 단, 사칙연산 우선순위를 무시합니다.

## 👤 팀원
|⭐️Vetto|
| :--------: |
|<img src="https://cdn.discordapp.com/attachments/535779947118329866/1055718870951940146/1671110054020-0.jpg" width="150" height="180">|

## 📁 프로젝트 구조

<details>
    <summary><big>UML</big></summary>

step2 진행 후 작성 예정

</details>

## 🖥 실행화면

step3 진행 후 작성 예정

## 📌 프로젝트 수행 중 핵심 경험
 
<details>
    <summary>STEP 1</summary>
    
* TDD 시작하기
    * 기존의 프로젝트에 Test Target 추가
* Queue 자료구조의 이해와 구현
* List 자료구조 직접 구현해보기(선택)
    * 리스트를 활용하여 Queue 구현(선택)
    
</details>
    
<details>
    <summary>STEP 2</summary>
    
* UML을 기반으로 한 코드구현
* 숫자와 연산자 입력에 큐 활용
* TDD를 기반으로 코드 작성하기(선택)
    
</details>

## ⏱ 타임라인

<details>
    <summary>STEP 1 [2023.01.24] ~ [2023.01.27]</summary>    

- 2023.01.24
    - node 구현, node를 이용한 queue구현
    - isEmpty, size, peek 연산 프로퍼티 구현
    - enqueue, dequeue, clear 메서드 구현
    
- 2023.01.25
    - node test코드 추가
    - calculator test코드 추가
    - calculator method test실행

- 2023.01.26
    - 불필요한 size, peek 연산 프로퍼티 삭제
    - 불필요한 node test 삭제
    - 함수명, 접근제어자 관하여 리팩토링
    
</details>

## 🔥 트러블 슈팅

<details open>
    <summary><strong><big>📍 STEP 1</big></big></strong></summary>


### 1️⃣ CalculatorItemQueue 타입에 대한 고민

#### 문제점
* CalculatorItemQueue의 타입을 struct와 class 두 개의 타입 중에서 고민을 하였습니다.  두 개의 타입에는 차이점이 많았지만 아직 프로젝트를 많이 해보지 않아서 어떤 방식을 선택해야 할지 선뜻 생각이 안났습니다.

#### 해결법
* struct로 구현을 할때에는 많은 이유가 있지만 그 중에서 `다른 타입으로부터 상속받거나, 자신을 상속할 필요가 없을때`, `캡슐화한 값을 참조하는 것보다 복사하는 것이 합당할때`라는 타당한 이유가 있었기 때문에 struct를 선택하여 구현하였습니다.
    
```swift
struct CalculatorItemQueue<Element: CalculateItem> {}
```

### 2️⃣ UnitTest 하기위해 접근제어자 설정
#### 문제점
* UnitTest를 통해 각 메서드가 잘 실행이 되는지 테스트를 하려고 했습니다. 하지만 하나의 메서드를 테스트할 때 다른 메서드를 사용하게 되면 의존성이 높아진다고 하여 다른 메서드를 사용하지 않고 테스트를 진행하기 위해 내부의 데이터들을 internal로 선언하여 접근을 허용했습니다. 

```swift
var head: Node<Element>?
var tail: Node<Element>?
```
    
#### 해결법
* 리뷰어의 조언대로 데이터의 직접 접근은 허용하지 않는 것이 좋다고 생각하여 private(set)을 붙여 외부에서는 읽기 전용인 접근제어자를 붙여 접근을 제어하였습니다.
    
```swift
private(set) var head: Node<Element>?
private(set) var tail: Node<Element>?
```
    
### 3️⃣ Node 연결 해제에 관한 고민
#### 문제점
* 계산기에는 한번에 초기화하는 버튼이 있기 때문에 이것을 clear메소드로 구현하고 test를 하고 싶었습니다. 하지만 Node를 이용한 방식으로 queue를 구현하였기 때문에 노드가 연결이 해제되어 빈 queue가 되는지 명확하게 알 방법이 없다고 생각했습니다. 

#### 해결법
* node들은 클래스로 구현을 하였기 때문에 참조에 의해서 연결되어있습니다. 따라서 어디서 어떻게 연결되어있는지 그림을 그리다 보면 참조를 알 수 있습니다. class는 ARC에 의해서 자동으로 관리 되고 있기 때문에 참조만 끊어주면 모든 노드가 할당이 해제되며 빈 queue가 된다고 생각했습니다. 이것을 리뷰어에게 질문 하였고 리뷰어는 제 생각이 맞다고 해주었습니다. 따라서 head와 tail에 nil값을 넣어주면 할당이 해제되는 것을 알 수 있고 이 것을 코드로 구현했습니다.

```swift
mutating func clear() {
    self.head = nil
    self.tail = nil
}
```
</details>

## 📄 규칙

### Commit 컨벤션
* feat : 기능 구현, 수정
* docs : 문서 추가, 수정
* refactor : Naming 수정 등
* fix : 사용자가 사용하는 부분에서 bug 수정
* chore : 별로 중요하지 않은 사항

## 🔍 참고 링크
[Kodeco - Class Diagram](https://www.kodeco.com/books/design-patterns-by-tutorials/v3.0/chapters/2-how-to-read-a-class-diagram) 
