# iOS 커리어 스타터 캠프

## 프로젝트 저장소
> 프로젝트 기간 
> 팀원: [@Groot-94](https://github.com/Groot-94)
리뷰어: [@leejun6694](https://github.com/leejun6694)

---
# 목차
- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [키워드](#키워드)

- [그라운드 룰](#그라운드-룰)
    - [활동시간](##활동시간)
    - [참고문서](##참고문서)
    - [의사소통 방법](##의사소통-방법)
    - [코딩 컨벤션](##코딩-컨벤션)
- [핵심경험](#핵심경험)
- [기능설명](#기능설명)
- [STEP 1](#STEP-1)
    - [고민한점](#STEP-1-고민한점)
    - [배운 개념](#STEP-1-배운개념)
    - [Review](#STEP-1-Review)
    - [Update](#STEP-1-Update)
- [STEP 2](#STEP-2)
    - [고민한점](#STEP-2-고민한점)
    - [배운 개념](#STEP-2-배운개념)
    - [Review](#STEP-2-Review)
    - [Update](#STEP-2-Update)
- [STEP 3](#STEP-3)
    - [고민한점](#STEP-3-고민한점)
    - [배운 개념](#STEP-3-배운개념)
    - [Review](#STEP-3-Review)
    - [Update](#STEP-3-Update)
- [동작화면](#동작화면)
---
# 프로젝트 소개
계산기 프로젝트
---
# UML  
**[ClassDiagram]**
![](https://i.imgur.com/RODTZM8.png)
</br>
---
# 키워드
- Queue
- LinkedList
- ArrayList
- TDD
- TypeMethod
- Extionsion
- IBOutlet
- IBAction
- StackView
- ScrollView
---
# 그라운드 룰
## 시간
- 아침 9시 30분 ~ 오후 9시 30분
- 주말엔 가능하면 프로젝트보단 개념공부
## commit 단위
- 타입
- 함수
- 프로퍼티(유동적)
- naming은 refactoring 하지않도록 해보기
## commit 메세지
- feat: 기능 추가
- fix: 버그 수정
- refactor: 리팩토링 (변수 네이밍 수정 등)
- style: 스타일 (세미콜론 등, 형식적인 스타일 수정)
- docs: 문서 변경
- test: 테스트 (테스트 코드 추가, 수정, 삭제: 비즈니스 로직에 변경 없음)
- chore : 별로 중요하지 않는 것들 (빌드 스크립트 수정 등)
## 참고문서
- Swift Language Guide - Protocols
- Swift Language Guide - Extentions
- Swift Language Guide - Error Handling
- Swift Language Guide - Closures(선택사항)
- Swift Language Guide - Advanced Operators(선택사항)
- Swift Language Guide - Inheritance(선택사항)
- Swift Language Guide - Subscripts(선택사항)
## 코딩 컨벤션
- 1. Swift 코드 스타일 : [스위프트 API 가이드라인](https://gist.github.com/godrm/d07ae33973bf71c5324058406dfe42dd) 
- 2. 커밋 Title 규칙
        + add: 새로운 파일 추가
        + refactor: 코드 리팩토링
        + style: 코드 내 들여쓰기나 부가적인 수정
        + feat: 새로운 기능 추가
        + fix: 버그 수정
        + docs: 문서 수정
- 3. 커밋 body 규칙
        + 현제 시제를 사용, 이전 행동과 대조하여 변경을 한 동기를 포함하는 것을 권장 문장형으로 끝내지 않기
        + commitTitle 과 body 사이는 한 줄 띄워 구분하기
        + commitTitle line의 글자수는 50자 이내로 제한하기
        + commitTitle line의 마지작에 마침표(.) 사용하지 않기
        + commitBody는 72자마다 줄 바꾸기
        + commitBody는 어떻게 보다 무엇을,왜 에 맞춰 작성하기
---
# 핵심경험
- [x]  TDD 시작하기
- [x] 기존의 프로젝트에 Test Target 추가
- [x] Queue 자료구조의 이해와 구현
- [x] List 자료구조 직접 구현해보기(선택)
- [x] 리스트를 활용하여 Queue 구현(선택)
- [x] UML을 기반으로 한 코드구현
- [x] 숫자와 연산자 입력에 큐 활용
- [x] TDD를 기반으로 코드 작성하기(선택)
- [x] IBOutlet / IBAction의 활용
- [x] 스택뷰의 활용
- [x] 스크롤뷰의 활용
---
# 기능설명
## **LinkedList**
- Node : 링크드 리스트 구현을 위한 노드
- peek() : 리스트의 head의 데이터를 반환
- append() : 리스트의 앞에 데이터를 추가
- removeFirst() : 리스트의 첫번째 데이터를 삭제하고 반환
- isEmpty() : 리스트가 비어있으면 true 반환
- removeAll() : 리스트의 모든 원소 제거
## **CalculatorItemQueue**
- peek() : 큐의 첫번째 데이터를 반환
- enqueue() : 큐의 앞에 데이터를 추가
- dequeue() : 큐의 첫번째 데이터를 삭제하고 반환
- isEmpty() : 큐가 비어있으면 true 반환
- removeAll() : 큐의 모든 원소 제거 
## **Formula**
- result() : 연산큐에 들어있는 연산자와 피연산자를 계산
## **CalculateError**
- 계산 오류정의
## **ExpressionParser**
- parse() : 수식을 String으로 입력받아 분리하여 연산큐에 적재
- componentsByOperators() : 공백으로 String을 분리
## **Operator**
- 연산에 사용 할 연산자와 수식을 정의
- calculate() : 각 연산함수를 호출하기 위한 함수
- add() : 더하기 연산 구현
- substract() : 빼기 연산 구현
- didvide() : 나누기 연산 구현
- multiply() : 곱하기 연산 구현
## String extension
- split() : 입력받은 캐릭터형을 이용해 String을 분리해서 [String]으로 리턴
## Double extension
- parse() : 입력받은 Double형을 형식에 맞게 변경해서 String으로 반환
## **CalculateViewController**
- setToDefault() : 계산기의 모든 입력과 결과 초기화
- deleteCurrentInputed() : 현재 피연산자 입력을 지우고 0으로 설정
    - 계산이 끝나고 버튼을 누르면 모두 초기화
- changeTheSign() : 현재 피연산자가 0이 아니면 부호를 변경
- appendOperand() : 피연산자(숫자, 기호)의 입력을 화면에 출력
    - 계산이 완료 된 상황에선 입력불가
    - 0을 먼저 입력하고 숫자 입력 시 기존의 0을 지우고 입력
    - 3자리 마다 "," 로 구분
    - 숫자가 아닌경우를 입력하면 0으로 변경 ( 예시: 1.2.2. -> 0 )
- appendOperator() : 연산자의 입력을 연산 화면에 출력하고 연산큐에 적재
    - 계산이 완료 된 상황에선 입력불가
    - 입력값이 없으면 연산자의 기호만 변경 (기본 0이 아닌 어떤 입력도 없는 상태)
    - 0.100000 등 쓸모없는 숫자는 제외하고 화면에 출력
    - 연산의 길이가 화면을 넘어가면 자동으로 내려가며 스크롤을 통해 이동 가능
- calculateCurrentFormula() : 현재까지 입력 된 연산을 수행하고 결과를 뷰에 출력
    - 20자 이내의 수(그 외의 수는 반올림)
    - 3자리 마다 "," 로 구분
    - 100000000000000000000 이상의 수는 과학식으로 표현
- createLabel() : 연산자와 피연산자의 정보를 저장 할 라벨을 생성
- createStackView() : 연산자와 피연산자 라벨정보를 스택뷰로 만들어서 스크롤 안에 적재
- calculate() : 현재까지 입력 된 연산을 수행 큐를 통해서 수행
- getText() : String 옵셔널 처리를 위한 함수
- addInputtedFomula() : 입력된 수식을 String으로 추가
- downScroll() : 스크롤을 밑으로 이동
- changeFormat() : 피연산자의 표현을 처리
- checkTheSign() : 피연산자의 부호를 확인해서 변경
- checkOperand() : 피연산자의 입력을 확인해 처리
- resetCalculateOption() : 모든 옵션을 초기화
---
# 동작화면
![](https://i.imgur.com/oMpa6rx.gif) ![](https://i.imgur.com/j4rIy1p.gif)
---
![](https://i.imgur.com/3wRctdR.gif) ![](https://i.imgur.com/ZA4tDlO.gif)

---
# [STEP 1]
## STEP 1 고민한점
### 어떤 방식의 List를 사용할지 고민했습니다.
- 배열을 사용할 경우 5개의 값을 넣은 상태에서 만약 1개의 `값을 빼면 그 크기가 자동으로 줄어드는지`에 대해 의문이 생겼고, swift에서 동적 배열의 크기를 어떻게 처리하는지 찾아봤으나 명확하게 답변을 찾기가 어려웠습니다.
- 여러 가지 방법을 찾아보던 중 클래스 타입의 노드를 만들고, 그 노드를 이용해서 Linked List 타입을 만들어서 사용하는 방법을 찾았습니다. `어디에서도 참조하지 않으면 자동으로 메모리에서 사라지는 특징을 이용한 값의 제거방법이 좋다고 생각해서` 사용하게 되었습니다.

### TDD 대해 고민했습니다. 
- 1. commit 단위
    - TDD의 세가지 단계에서 `각 단계마다 commit을 해야할지` `함수의 기능 구현을 중심으로 commit을 해야할지` 고민을 했습니다.

- 2. 은닉화
    - 처음 코드를 정의하는 부분에서 은닉화를 하지 않고 TDD 이후에 은닉화를 하는 방식으로 진행했을 때 문제가 있었습니다.

    - 발생한 문제
        - TDD 과정에서 함수의 기능이 구현되지 않은 상황에서 테스트 코드를 작성하다 보니 프로퍼티에 접근이 필요한 부분이 있었습니다. 은닉화 이후에 테스트 코드에서 은닉화된 프로퍼티들은 찾지 못했기 때문에 오류가 났습니다.
    - 해결방법
        - 프로퍼티 접근을 위한 함수를 만들고 테스트 코드에서 그 함수를 호출하는 방법으로 처리했습니다.
        - 테스트 코드에서 기능 구현을 아직 하지 않은 함수 A의 호출이 필요할 때 그 테스트 코드는 A 함수 기능을 구현 후에 테스트하는 방식으로 수정했습니다.
## STEP 1 배운개념
- Queue
- LinkedList
- ArrayList
- TDD
## STEP 1 Review
### LinkedList에서 tail 을 이용하는 방법
### 가독성이 떨어지지 않다면, 삼항 연산자를 이용해서 코드를 줄이기

## STEP 1 Update
### LinkedList에서 tail 을 이용하는 방법
- LinkedList에 새로운 Node를 추가하기 위해선 Node의 끝을 찾는 연산을 해야했다. 
- 이 연산을 while을 통해 구현했었다. 이 방법은 무조건 반복문을 통해서 끝을 찾아야 하기 때문에 불필요한 연산을 줄여주기 위해서 tail이라는 새로운 노드를 만들어서 끝을 지정해줬다.

    - 변경 전
    ```swift=
    mutating func append(data: T) {
            guard head != nil else {
                head = Node(data: data)
                return
            }

            var node = head

            while node?.next != nil {
                node = head?.next
            }
            node?.next = Node(data: data)
        }
    ```
    - 변경 후
    ```swift=
    struct LinkedList<T> {
        private var head: Node<T>?
        private var tail: Node<T>?

        mutating func append(data: T) {
            guard head != nil else {
                head = Node(data: data)
                tail = head
                return
            }
            let node = Node(data: data)
            tail?.next = node
            tail = node
    ```
### 가독성이 떨어지지 않다면, 삼항 연산자를 이용해서 코드를 줄이기
- 처음에 삼항 연산자를 사용해서 구현하려고 했으나, return을 하는 부분에서 오류가 났었다.
    ```swift=
    head == nil ? return true : return false
    ```
- 그래서 단순하게 삼항연산자에서 return을 할 수 없구나 라고 생각하고 리팩토링 하지 않았다.

- 리뷰를 보고 다시 생각했을때 삼항연산자는 기본적으로 return을 하기 때문에 써주면 중복으로 return을 하게되서 오류가 났다는 생각이 들었다.

- 변경 전
    ```swift=
    func isEmpty() -> Bool {
            if head == nil {
                return true
            }
            return false
        }
    ```
- 변경 후
    ```swift=
    func isEmpty() -> Bool {
            head == nil ? true : false
    }
    ```
- 항상 왜? 라는 질문과 조금 더 탐색하는 노력이 필요하다.
---
# [STEP 2]
## STEP 2 고민한점
### result(), parse() 함수에서 optional을 처리하는 방식을 고민했습니다.
- result() 함수 큐에서 값을 꺼내와서 계산해야 했기 때문에 optional 처리를 해야 하는 부분이 많아 코드의 가독성이 많이 떨어졌습니다.
- parse() 함수에서 String 값을 각각 큐의 타입에 맞게 변환해줘야 하는 작업이 많아서 코드의 가독성이 많이 떨어졌습니다.
#### 해결방법
- result() 함수에서 optional을 처리하지 않고 dequeue 함수에서 리턴 값이 nil 이면 nil Error를 반환하도록 수정했습니다.
- parse() 함수에서는 optional을 compactMap으로 처리하는 방식을 사용했습니다.
- 혹시 더 좋은 방법이 있을지 쿠마의 의견이 궁금합니다!
### Enum 타입의 메서드들을 사용하는 방식에 대해 고민했습니다.
- 인스턴스를 생성하지 않는 Enum 타입은 case를 통해 메서드에 접근하는 방법을 사용했는데, 이번에 주어진 UML엔 case가 없는 Enum 타입을 사용하도록 요구사항에 있었습니다
- 어떻게 사용해야 할지 몰라서 몇 시간 삽질을 한 후에나 static으로 설정해주고 타입 메서드 방식으로 사용해야 함을 깨달았습니다...
- 이렇게 Enum으로 타입메서드를 사용하면 Struct와 다른 게 인스턴스 생성을 막을 수 있다는 차이점이 있다고 알고 있습니다. 단순하게 그 이유로 이런 Enum의 타입메서드를 사용하는지 아니면 다른 더 중요한 이유가 있는지 궁금합니다!
### componentsByOperators 메서드를 어떻게 사용할까를 고민했습니다.
- 가능하면 주어진 UML을 그대로 지켜서 코딩을 하고 싶다고 생각을 했기 때문에 저 메서드를 어떻게 사용할지 고민을 많이 했습니다. 하지만 지금 제가 사용한 방식은 굳이 사용해야 하나? 라는 생각을 들게 합니다. 여러 번 리팩토링을 하면서 최선의 결과를 찾았다고 생각했지만, 아직 부족하다고 느껴집니다... 쿠마라면 어떤 방식으로 사용했을지 궁금합니다..!
## STEP 2 배운개념
- TypeMethod
- Extionsion
## STEP 2 Review
- 0으로 나누는 계산이 끝나고 결과를 확인하는 방식에서 계산전에 에러를 던지도록 수정해보기

- 연산자를 큐에 저장하는 부분에서 filter를 사용해 숫자를 제거해준 부분을 filter를 사용하지 않고 Operator.init(rawValue:)으로만 숫자를 제거하기

## STEP 2 Update
- 불필요한 계산을 하지 않도록 수정
- `parse에서 0으로 나눗셈에 대한 오류를 던져준다면 어떨까 라는 생각을 하게되었다.`

    - 변경 전
    ```swift=
    while !operands.isEmpty() || !operators.isEmpty() {
                result = try operators.dequeue().calculate(lhs: result, rhs: operands.dequeue())
            }

            guard result != Double.infinity else {
                        throw CalculateError.infinityError
            }
    ```
    - 변경 후
    ```swift=
    while !operands.isEmpty() || !operators.isEmpty() {
                guard operands.peek() != 0 || operators.peek() != .divide else {
                    throw CalculateError.infinityError
                }
                result = try operators.dequeue().calculate(lhs: result, rhs: operands.dequeue())
            }
    ```
    
- filter를 사용하지 않고 Operator에서 미리 처리해주는 방식으로 수정
    - 변경 전
    ```swift=
    componentsByOperators(from: input).compactMap { Double($0) }.forEach {
                formula.operands.enqueue(data: $0)
            }

            componentsByOperators(from: input).filter { Double($0) == nil }.compactMap { Operator.init(rawValue: Character($0)) }.forEach {
                formula.operators.enqueue(data: $0)
            }
    ```
    - 변경 후
    ```swift=
    init?(rawValue: String) {
            guard Double(rawValue) == nil else {
                return nil
            }
            self.init(rawValue: Character(rawValue))
        }
    ```
---
# [STEP 3]
## STEP 3 고민한점
### scrollView의 크기를 지정해주는 부분에서 고민을 했습니다.
##### 초기 storyboard
![](https://i.imgur.com/Ier2Bby.png)
- scrollView의 ContentView(StackView)에 존재하던 StackView 2개를 지우고 앱 실행에선 문제없이 새로운 StackView가 추가되었지만, 아래와 같이 scrollView의 Y축에 대한 경고창이 보였습니다.
##### 수정 후 경고창 storyboard
![](https://i.imgur.com/HYgqPSz.png)
- 경고창을 해결하기 위해서 scrollView의 Y축을 지정해주려고 Y축의 길이를 지정하면 scrollView의 크기가 고정돼서 늘어나지 않았습니다.
- Add Missing Constrains 버튼 클릭 시 경고창은 사라졌지만, ContentView로 쓰이는 StackView 안에 새로운 StackView를 추가해도 실제로 앱에선 나타나지 않았습니다.
#### 해결방법
- 콘텐츠뷰에 빈 라벨을 하나 가진 StackView를 추가하고 앱 시작 시 ViewDidRoad에서 ContentView의 SubView를 모두 지워주는 동작을 하도록 했습니다.
    ##### 최종 storyboard
    ![](https://i.imgur.com/snKRVzV.png)
---
### scrollView에 수식이 추가될 때 최하단으로 자동 스크롤 할 수 있도록 하는 부분에서 고민했습니다.
- downScroll() : 스크롤뷰의 화면을 가장 밑으로 내려주는 기능의 함수입니다.
- operatorButtonAction() : 연산자와 피연산자를 수식으로 추가하고, 화면으로 보여주는 함수입니다.
#### 문제상황
- downScroll() 를 operatorButtonAction() 안에서 호출했을 시 1칸씩 덜 내려오는 문제가 있었습니다. 
- 브레이크 포인트로 확인 시` downScroll()는 operatorButtonAction()의 실행이 끝나기 전에 마지막에 호출이 되고`, `operatorButtonAction() 실행이 끝나고 나서 ContentView(StackView)에 새로운 수식이 추가되는 순서`였기 때문에 1칸 씩 덜 내려온다고 판단했습니다.
#### 해결을 위한 시도
- 1. didSet을 사용해서 ContentView(StackView)의 수정이 끝나면 호출하도록 했습니다.
    >왜인지 함수를 호출하지 않았습니다... 단순히 ContentView(StackView)에 새로운 StackView를 추가하는 동작은 ContentView(StackView)의 변화로 판단하지 않는다고 생각해봤습니다...
- 2. ScrollViewDelegate의 scrollViewDidChangeAdjustedContentInset(UIScrollView) 함수를 이용해서 수정하려고 해봤습니다.
    >ScrollView안에 새로운 StackView를 추가하는 방식이 아닌 ContentView(StackView)에 추가하는 방식이기 때문에 직접적인 ScrollView의 수정이 일어나지 않다고 판단해서인지 호출하지 않았습니다.
- 3. StackViewDelegate는 찾아봤지만, 없었습니다..
- 4. viewDidLayoutSubviews() 를 사용하는 방법
    >숫자패드를 눌렀을 때 operandLabel이 변경되면 viewDidLayoutSubviews()을 호출했지만, 이상하게도 
    ContentView(StackView)에 새로운 StackView를 추가하는 동작은 호출하지 않는지, 아니면 뷰에 추가되기 전에 먼저 실행되는 것인지.. 문제가 해결되지는 않았습니다.
#### 해결방법
- DispatchQueue를 사용해서 downScroll()를 0.01초 뒤에 실행하는 방법으로 해결했습니다. 하지만 아쉬움이 많이 남습니다. 제가 모르는 방법이 있을 것 같네요... 혹시 쿠마라면 어떻게 해결하셨을지 궁금합니다.
---
### CalculateItem의 쓰임새를 고민했습니다.
- 구현하면서 이 프로토콜을 어떻게 사용하면 좋을지 고민을 해봤습니다.. 하지만 실제로 사용하지는 못했습니다.. 어떤 용도로 사용해야 할지 도저히 모르겠습니다...
---
## STEP 3 배운개념
- StackView
- ScrollView
- NumberFormatter
- AutoLayout
- DispatchQueue
- IBOutlet / IBAction의 활용
## STEP 3 Review
- method 는 동작(행위)을 하는 것이므로, 네이밍에 동사 포함
- 중복제거
- 현재 코드에서 일어나지 않는 동작이지만, 코드를 보는 다른 사람의 행동을 고려해서 String 값이 없는 경우는 에러로 처리
## STEP 3 Update
### 현재 코드에서 일어나지 않는 동작이지만, 코드를 보는 다른 사람의 행동을 고려해서 String 값이 없는 경우는 에러로 처리
- 수정 전
    ```swift=
    private func getText(_ text: String) -> String {
            guard let text = text.text else {
                return ""
            }

            return text
        }
    operandLabel.text = getText(sender.currentTitle)
    ```

- 확실하게 nil이 아닌 sender.currentTitle과 같은 값을 사용해야 하는 경우 guard문을 이용해서 미리 sender.currentTitle 의 옵셔널을 벗겨주고 사용하는 방향으로 수정
- 수정 후
    ```swift=
            guard let senderTitle = sender.currentTitle else{
                return
            }
            operandLabel.text = senderTitle
    ```
### downScroll 수정
- 기존에 있던 스크롤뷰가 1칸 덜 내려가는 문제를 해결하기 위해 사용한 DispatchQueue에서 layoutIfNeeded을 사용하는 방법으로 수정
    ```swift=
     private func downScroll() {
            fomulaScrollView.layoutIfNeeded()
            fomulaScrollView.setContentOffset(CGPoint(x: 0, y: fomulaScrollView.contentSize.height - fomulaScrollView.bounds.height), animated: false)
        }
    ```


