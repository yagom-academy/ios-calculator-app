## iOS 커리어 스타터 캠프

### 계산기1
> 프로젝트 기간 2022/05/16 ~ 2022/05/27  
> 팀원: [@bard](https://github.com/bar-d) / 리뷰어: [@Green](https://github.com/GREENOVER)


# 목차
- [프로젝트 소개](#프로젝트-소개)
- [키워드](#키워드)

- [그라운드 룰](#그라운드-룰)
    - [활동시간](###시간)
    - [예외사항](##예외사항)
    - [의사소통 방법](##의사소통-방법)
    - [코딩 컨벤션](##코딩-컨벤션)

- [STEP 0](#STEP-0)
    - [고민한점](#고민한점)
    - [배운 개념](#배운개념)
- [STEP 1](#STEP-1)
    - [고민한점](#고민한점)
    - [배운개념](#배운개념)
	- [보완할부분](###보완할부분)
- [STEP 2](#STEP-2)
    - [고민한점](#고민한점)
    - [배운개념](##배운개념)
- [STEP 3](#STEP-3)
    - [고민한점](#고민한점)
    - [배운개념](##배운개념)

## `UML`
![Screen Shot 2022-05-21 at 3 38 59 AM](https://user-images.githubusercontent.com/92622931/169591921-3fdbfa72-1031-4410-986e-3c6f6d192090.png)  
# 프로젝트 소개
- STEP1: 계산기의 동작 원리를 이해하고 UML과 TDD, Queue 자료구조에 대한 이해와 구현
- STEP2: UML을 기반으로 한 코드구현
- STEP3: UI에 대한 이해 및 활용

# 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3.1-blue)]()


# 키워드  
- `UML`, `TDD`
- `Queue`, `Stack`
- `Array Queue`, `DoubliyLinkedList Queue`, `DoubleStack Queue, RingBuffer Queue`
- `시간복잡도`
- `로직에 대한 이해`, `고차함수 활용`
- `forEach`, `CaseIterable`
# 그라운드 룰

### 시간

[프로젝트에 집중하는 시간]

- 09:30 ~ 21:00

[식사 시간]

- 점심 12:30 ~ 13:30
- 저녁 19:00 ~ 20:00



[휴일]

- 휴일따위..


### 규칙

[커밋]

- 최소기능 단위 commit
- 카르마 스타일 따르기 ( 한글로 작성 )
- `feat` = 주로 사용자에게 새로운 기능이 추가되는 경우
- `fix` = 사용자가 사용하는 부분에서 bug가 수정되는 경우
- `docs` = 문서에 변경 사항이 있는 경우
- `style` = 세미콜론을 까먹어서 추가하는 것 같이 형식적인 부분을 다루는 경우 (코드의 변화가 생산적인 것이 아닌 경우)
- `refactor` = production code를 수정하는 경우 (변수의 네이밍을 수정하는 경우)
- `test` = 테스트 코드를 수정하거나, 추가하는 경우 (코드의 변화가 생산적인 것이 아닌 경우)

[컨벤션]

- Swift API Design Guidelines
- Swift Language Guide
- ios - Human Interface Guidelines

[커뮤니케이션]

- 디스코드 회의실
- 디스코드 다이렉트 메시지



# 핵심경험
STEP1
- [x] TDD 시작하기
	- [x] 기존의 프로젝트에 Test Target 추가
- [x] Queue 자료구조의 이해와 구현
- [x] List 자료구조 직접 구현해보기(선택)
	- [x] 리스트를 활용하여 Queue 구현(선택)  

STEP2
- [x] UML을 기반으로 한 코드구현
- [x] 숫자와 연산자 입력에 큐 활용
- [x] TDD를 기반으로 코드 작성하기(선택)

STEP3
- [ ] IBOutlet / IBAction의 활용
- [ ] 스택뷰의 활용
- [ ] 스크롤뷰의 활용

# [STEP 0]

## 고민한점 
- 계산기의 동작하는 로직을 어떻게 집어넣어야 하나

## 배운개념


# [STEP 1]
## 고민한점 

### `Queue`
- 1. 스위프트에는 `Queue`라는 타입이 없어서 여러 방식으로 구현을 하여 사용을 하는데, `DispatchQueue`같은 클래스는 왜 존재하는지, 특정 케이스에서만 `Queue`가 쓰이도록 구현을 해논것인가?
아니면 구현을 어떻게 하느냐에 따라 쓰이는 용도가 달라서?
	- 그린의 답변  
>학습해보셨다시피 Queue 타입이 딱 지정되어 사용할 수 있게 swift에서는 제공하지 않고 있고 여러 방법으로 구현하고 있습니다.   
  이에 DispatchQueue도 아마 까보시면 해당 용도로 Queue를 구현한것이고 지금 CalculatorItemQueue와 같이 큐의 역할을 한다~ 라고 이름을 붙여준 클래스일것입니다.  
 이를 생각해보면 해당 클래스의 존재여부와는 다를것 같고 큐의 구현이라고 보시면 될것 같아요!
- 여러 종류의 `Queue`구현 타입중에 어떠한 것을 써야 하나?
- 시간 복잡도면에서 어느 것이 성능이 좋은가?

### `TDD`
- `TDD`를 수행하기 전 먼저 `UML`을 작성해놓은 상태
```swift
struct CalculatorItemQueue<Double>: Queue, CalculateItem {  
    var leftStack: Array<Double> = []
    var rightStack: Array<Double> = []
    
    var isEmpty: Bool
    
    var peek: Double?
    
    
    mutating func enQueue(_ double: Double) -> Bool {
        return true
    }
    
    mutating func deQueue() -> Double? {
        return Double?.self as? Double
    }
}
```
- `TDD`는 말 그대로 테스트를 기반으로 하는 코드인데, `UML`을 이미 작성을 해서 `UML`을 토대로 코드의 틀만 짠 상태로 테스트 코드를 진행하는게 맞는 방법인가?
	- 그린의 답변  
> TDD에 대해서 현재 구현해주신 스텝이 맞다고 생각합니다.  
 즉 UML로 모델타입에 대해 정의해주고 이를 테스트 코드를 구현하면서 지금처럼 값을 넣어 정상적으로 구현된 기능 정의인지 확인부터 해보는것이 TDD의 기초 개념이라 생각합니다!  
 이에 지금 전체적인 맥락에서 어긋나는 부분은 없다고 생각합니다😁

## 보완할부분
1. 전체적으로 리뷰 코멘트로도 많이 단 부분이 TDD 쪽인데 전체 흐름 및 개념에 대해서는 어긋나지 않았지만 그 검증을 위한 구현부가 조금 다듬어 지면 좋겠다는 생각이 있어 다시 한번 코멘트를 드립니다🙌  
2. CalculatorItemQueue에 대해 조금 더 확장성 있는 방법을 생각해보면 좋을것 같습니다!  
 더불어 전체적으로 정의된 기능과 프로퍼티들의 실제 사용여부와 메서드 시그니쳐를 한번 더 고민해보면 어떨까해요🤔
3. 리드미를 매 스텝별 작성해보면 분명 분명 큰 도움이 되실거에요😀
4. 브랜치명이 조금 모호한것 같습니다.  
 혼자 작업할때는 문제가 되지 않지만 협업을 고려한다면 ic_6_barrd보다는 step1, step2와 같이 명확한 브랜치를 생성해 관리하는것은 어떨까요?


## 배운개념
- `브랜치 분리`
- `UML`, `TDD`
- `Queue`, `Stack`
- `Array Queue`, `DoubliyLinkedList Queue`, `DoubleStack Queue, RingBuffer Queue`
- `시간복잡도`
- `popLast`, `Generic Type`

# [STEP 2]

## 고민한점

### `initializer`
- 처음 아래와 같은 오류가 나왔을 때 왜 오류가 나는지 이해가 안됬는데 생각해보니 class 내 프로퍼티가 저장이 되어있지 않아서 이니셜라이저를 해줘야 되었는데, 안해줘서 오류가 남
![Screen Shot 2022-05-21 at 3 49 51 AM](https://user-images.githubusercontent.com/92622931/169593682-51cd7d27-c2e0-462d-b1db-adc8ed0f2233.png)  
- 아래와 같이 프로퍼티에 기본값을 넣어주어 해결
- ![Screen Shot 2022-05-21 at 3 49 58 AM](https://user-images.githubusercontent.com/92622931/169594537-4ebf6353-f427-467c-bf29-6c0f26df32be.png)

### `Generic`
- 제네릭타입으로 반환 값을 주면 아래와 같이 에러가 나기에  강제로 다운캐스팅
![mutating func deQueue() throws](https://user-images.githubusercontent.com/92622931/169594839-2e12f8aa-29e4-4660-9e30-07401dcfae54.png)
- 그린의 조언을 듣고 만들어놓은 에러를 이용해서 처리
 강제 언래핑은 앱크래쉬의 주 원인이 될 수 있기에 지양하도록 노력하겠습니다.
![mutating func deQueue() throws - T {](https://user-images.githubusercontent.com/92622931/169595391-1cefa5a4-e49f-4f6d-afde-40d12336dc0d.png)


### `componentsByOperators `
- 처음 componentsByOperators 함수를 구현할 때 `input`값을 받아 숫자가 포함이 안되어있는지 확인(`filter()`)하고 확인한 숫자들을 다시 `String`값으로 새로운 컨테이너를 생성  
![static func componentsByOperators(from input String) -  String](https://user-images.githubusercontent.com/92622931/169598542-7b4144d2-7eb4-46b8-a47a-2d07e36b0e25.png)  
- 로직에 문제가 없을 줄 알았지만 해당 함수에서 음수가 들어가게 된다면 함수는 음수를 연산자와 양수로 분리하게 될 것이란 걸 깨닫고 다시 한번 리팩토링

- 결국 다시 `componentsByOperators`함수를 리팩토링을 해주게 되었고, 입력받을 때 공백을 기준으로 나누어준 다음 `parse` 함수 내부에서 두개의 프로퍼티를 만들어 연산자와 피연산자를 분리
![static func parse(from input String) throws - Formula](https://user-images.githubusercontent.com/92622931/169598995-ce266e46-0876-4079-b28d-01e289a21237.png)  
- TDD를 꼼꼼하게 하였다면 이러한 문제가 발생하지 않았을 텐데, 다음에는 좀 더 꼼꼼하게 테스트 해보도록 노력해볼 것

### `연산자 처리`
- 연산자 처리를 위해 여러가지 방법들을 시도
![Screen Shot 2022-05-21 at 4 52 29 AM](https://user-images.githubusercontent.com/92622931/169602803-0df49dc5-48d6-4830-81cf-f67d290e0e8f.png)
![Screen Shot 2022-05-21 at 4 55 45 AM](https://user-images.githubusercontent.com/92622931/169602832-5ade82a6-e82e-41d7-a55b-575017e74da4.png)
- 여러 방법을 시도한 결과 제일 아래에 있는 방법으로 채택하였고, 채택한 이유 중 가장 큰 이유는 연산자는 `Character`는 하나의 문자로 이루어져 있기 때문에 하나로 카운트 되는지가 제일 중요하다고 생각



## 배운개념
- `forEach`
- `로직에 대한 이해`, `고차함수 활용`
- `forEach`, `CaseIterable`
- `UML을 통한 코드 구현`


## 보완할부분
* 우선 전체 리뷰를 조금 많이 남기긴 했지만..😭 UML 명세와 조금 다른 부분들 혹은 놓친 부분들이 있어 한번 UML 명세와 다시 비교해보면 좋을것 같습니다..!
* 테스트 코드가 너무너무 상세하고 디테일한데 실패 케이스도 있으면 어떨까해요..!🙋🏻 성공과 실패에 대한 케이스 모두 고려되어 작성되는게 TDD에서 지향하는 방향이라고 생각듭니다😁
* 리드미도 이번 스텝에서 작성되면 좋겠네요👍 시간이 좀 걸리겠지만.. 나중에 하려면 분명 힘드실거에요😭
- [기존에 존재하는 타입 extension네이밍 관련](https://stackoverflow.com/questions/26319660/whats-the-best-practice-for-naming-swift-files-that-add-extensions-to-existing)

# [STEP 3]

## 고민한점
### 연산자
- 코드의 연산기호와 연산자 버튼의 기호가 다르다는 것을 알게 됨
- 처음 설정할 때 애먹음
### 스택뷰를 쌓는 법

  exampleStackView1.removeArrangedSubview(<#T##view: UIView##UIView#>) -> 포지션과 사이즈만 없애주지 뷰에서 제거해주는 것이 아님  
대체 방법
1. isHidden -> 해당 스택을 뷰에서 내려줌
2. removeFromSuperView() -> 해당 스택을 아에 없애줌

- 스크롤뷰 최하단으로 이동하는 방법  
처음 `setContentOffset`를 사용하여 아래와 같이 설정을 해주었음
```swift
scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height), animated: false)
```
마지막 숫자가 스크롤뷰 하단에 있음

```swift
scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentSize.height - scrollView.bounds.height + 22), animated: false)
```
아래와 같이 설정해 주었더니 숫자가 잘 보임


## 배운개념
- `scrollView`, `stackView`, `autoLayout`
- `계산기 로직 구현`
- `NumberFormatter`




