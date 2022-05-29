#  계산기 프로젝트
> 프로젝트 기간 2022.05. 16~2022.05. 
> 팀원: @yeton(https://github.com/yeeton37)
> 리뷰어: @Cory(https://github.com/corykim0829)

## uml
![calculator_UML](https://user-images.githubusercontent.com/98514397/168799116-c6036001-9b0f-4851-969a-3ce5628bb456.jpg)

## 계산기 프로젝트 step1 고민한 점

1. 실패가능한 테스트를 먼저 작성하는 것에 대한 어려움이 있었습니다.

- 이번 프로젝트에서 처음으로 TDD 주도 개발을 해보았습니다.
실패 가능한 코드를 작성하고, 최소한으로 성공할 수 있는 코드를 작성하고 효율적인 코드로 고치는 방식으로 진행했습니다.
하나의 함수를 작성하는 데에도 시간이 많이 들어 처음에는 이렇게까지 해야하는 게 맞을까?라고 생각했습니다. 하지만 계속 작성할수록 익숙해지니 속도도 붙고, 메서드 간의 분리도 잘 되는 것 같았습니다..!

- 문제는.. TDD 작성하면서 변수들을 `private`으로 설정해주고 나니 테스트 코드를 작성할 때 직접 접근하지 못하는 오류가 발생했습니다. 그래서 테스트 코드를 진행할 때에는 잠시동안 접근 제어를 풀어준 뒤 진행해서 성공적으로 마칠 수 있었습니다.
**그래서 이렇게 진행해도 되는지, 혹은 다른 방법이 있는지가 궁금합니다!**

2. 연산정보들을 담을 큐를 배열/연결리스트/더블스택큐 중 선택하는 것에 대한 고민

배열과 연결리스트는 서로 장단점을 보완할 수 있어 같이 엮어서 자주 나온다고 하여 둘의 장단점에 대해 찾아보았습니다.

- 제가 찾아본 바로는 `배열`은 한 공간에 나란히 있고, index가 있어 검색속도가 빠른 대신, 값의 삭제나 삽입이 일어날 시 요소들을 재배치 하는 과정때문에 비효율적입니다.
- 이런 배열의 단점을 보완한` 연결리스트`는 나란히 값을 저장하는 것이 아니라 원하는 때에 메모리에 공간을 할당해서 아무곳에나 저장해두고, 삽입삭제가 일어날 시 연결선만 바꿔주면 돼서 삽입삭제가 빈번하게 일어날 때 자주 사용할 수 있지만, index가 없기 때문에 검색 속도는 느려질 것으로 예측됩니다.

- 또한 `연결리스트`는 다음 데이터에 대한 연결 정보를 저장하는 별도의 데이터 공간이 필요해서 저장 공간의 효율이 높지 않다는 점에서 비효율적입니다.

- `배열`의 시간복잡도는 O(n)이고, `더블스택큐`와 `연결리스트`의 시간복잡도는 모두 O(1)로 동일하지만 공간복잡도 측면에서 더블스택큐가 더 효율적일 수 있다는 의견도 들었는데, 아직 공간복잡도라는 개념에 대해 크게 와닿지 않는 것 같습니다..
 다른 캠퍼분들이 사용한 사례를 들어만 보았는데, 이번 프로젝트에서는 더블스택큐를 모른채로 시작해서 일단 끝까지 연결리스트로 구현해주었습니다! 추후에 공부를 하면 좋을 것 같습니다 ㅎㅎ

3. 단방향 연결리스트를 선택한 이유

- 배열과 연결리스트 중 연결리스트, 그 중에서도 단방향연결리스트를 선택해 코드를 작성했습니다.
- 배열과 연결리스트 중 연결리스트를 선택한 이유는 이번 프로젝트에서는 검색 속도 보다는 연산 정보를 삽입하고 삭제하는 것이 빠른 것이 더 유리할 것이라고 생각했기 때문입니다. 
- 또 단방향 연결리스트와 양방향 연결리스트 중에 고민을 했습니다. 처음에는 양방향 연결리스트로 구현을 해주었는데, 생각해보니 계산기 프로젝트에서는 가장 마지막에 있는 값을 제거할만한 일이나 중간에 삽입을 할 일이 없을 것 같다고 생각해서 단방향 연결리스트로 수정해주었습니다.
`하지만 제가 현재 step1까지의 기능요구서만 보고 생각한 점이라 추후에 프로젝트가 확장된다고 했을 때 양방향 연결리스트로 구현하는 것이 더 효과적인 방법이었을지 고민이 됩니다.... `

4. 제너릭 타입 공부

## 계산기 프로젝트 step2 고민한 점 및 PR 피드백

1. UML 분석 후 클래스 분리하는 것에 어려움을 느낌
ExpressionParser 열거형에서 메서드 parse의 반환값으로 또다른 Struct인 Formula가 반환되도록 한 것입니다.
어떤 함수에서 구조체나 클래스 타입을 반환한다는 개념도 아직은 생소한 것같습니다. 

2. struct(Formula) 의 result 메서드 내부 구현 오류

테스트 코드:
```swift
 func test_Formula의operands에_3과4가담겨있고_operators에_add가담겨있을때_반환값이7이다() { // 에러 작렬 ^^
        // give
        sut.operands.enqueue(data: 3.0)
        sut.operators.enqueue(data: .add)
        sut.operands.enqueue(data: 4.0)
        
        //when
        let result = try? sut.result()
        
        //then
        XCTAssertEqual(result, 7.0)
    }
```
오류 코드:
```swift
while operators.dequeue() != nil { // while 선언부만 수정해줌
            if let operand = operands.dequeue(),
                let `operator` = operators.dequeue() {
                previousResult = try `operator`.calculate(lhs: previousResult, rhs: operand)
            }
        }
```
정상 코드:
```swift
while operators.queue.count != 0 { // while 선언부만 수정해줌
            if let operand = operands.dequeue(),
                let `operator` = operators.dequeue() {
                previousResult = try `operator`.calculate(lhs: previousResult, rhs: operand)
            }
        }
```
while 선언부를 operators.dequeue() != nil에서 operators.queue.count != 0로 고쳐주니 정상적으로 7.0이 출력되는 것을 볼 수 있었습니다. 정상 작동한 코드는 이해가 가는데, 오류가 났던 코드는 왜 오류가 나는지 궁금합니다😭 


 코리의 피드백 ➡️ Formular에서 operators가 프로퍼티로 선언되어있기 때문에 while문에서 조건문을 검사할 때마다 dequeue()가 되어서 계산되어야할 값이 dequeue되어버렸네요!
 
 
 3. struct(ExpressionParser) 의 parse 메서드 내부 구현 오류
 
 ExpressionParser의 테스트 코드에서 input을 계산한 값이 정상적으로 출력되지 않는 오류가 발생했습니다.

작성한 코드
```swift
enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        let separatedInputValue = componentsByOperators(from: input)
        var operandQueue = CalculatorItemQueue<Double>()
        var operatorQueue = CalculatorItemQueue<Operator>()
        
        separatedInputValue.forEach {
     1.       if let doubleTypeValue = Double($0) {
                operandQueue.enqueue(data: doubleTypeValue)
                return
            }
            
     2.       if let operaterTypeValue = Operator(rawValue: Character($0)) {
                operatorQueue.enqueue(data: operaterTypeValue)
            }
        }
        return Formula(operands: operandQueue, operators: operatorQueue)
    }
```
위에서 작성한 코드에서 1.에서 숫자가 들어와서 검증을 하고 return을 입력해주지 않으면 2.에서 불필요하게 Operator의 rawValue에서 string-> character로 변환해주는 과정이 생긴다는 것을 알게되었습니다.
그 이유는 숫자가 34처럼 character가 아닌 경우에는 2.에 숫자가 들어왔을 때 검증할 수 있는 로직 자체가 애초에 틀렸기 때문이라고 결론이 났습니다.
그래서 1.의 if let 구문에서 return을 입력해 이 오류를 해결할 수 있었습니다.

4. 구조체나 클래스 내부 프로퍼티를 구현할 때 바로 인스턴스화해서 초기화를 해주는 방식과 타입만 지정해놓는 방식의 차이점이 궁금합니다.

```swift
struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
```
```swift
struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
```

저는 항상 코드를 작성하다보면 이 둘을 섞어서 쓰게 되는데 둘의 차이점이 뭔지 잘 모르겠습니다,, 첫 번째 방식은 프로퍼티 초기화를 바로 구조체를 생성할 때 내부에서 해주는 것이고, 두 번째 방식은 프로퍼티 타입만 선언해놓고 다른 곳에서 초기화를 해주는 방식으로 알고 있는데 두 방식중 이런 상황에는 어떤 것을 쓰면 좋다! 하는 경우가 있을까요?

 코리의 피드백 ➡️ 직접 찾아보세요! 
 
 예톤의 답변 ➡️
구조체 내부 프로퍼티를 구현할 때 타입만 지정해놓는다는 것은 다른 곳에서 이 프로퍼티를 호출할 때 그때서야 초기화를 시켜준다는 뜻으로 이해했습니다.
하지만 미리 구조체 안에서 프로퍼티 초기화를 해도 결국 구조체를 인스턴스화해줄 때 그 내부의 프로퍼티도 같이 초기화가 되는 것이라 초기화를 안하는 것과 무슨 차이가 있지? 라는 생각이 들었습니다.
그래서 다른 팀원분들과도 이야기를 나눈 결과, 타입 내부에서만 사용하는 프로퍼티는 최대한 private화 하는 것이 좋기 때문에 미리 타입 내부에서 초기화를 시켜버리면 빈 큐가 생성되는 것이니까 큐 안에 값을 넣으려면 구조체 밖에서 구조체 내부의 프로퍼티 값을 건드려야하는 상황이 오기때문에 좋지 않다라는 결론이 나왔습니다!

또한 Formula 같은 구조체는 재사용하는 것이 아니라 계산이 필요할 때마다 그때그때 새로 만들어 사용하는 것이니 타입만 설정해두고, 필요할 때마다 값을 초기화해주는 것이 좋지 않을까? 라는 것이 저의 결론입니다.
제가 생각한 논리가 맞는 지 코리에게 여쭙고 싶습니다!!
 
 코리의 피드백2 ➡️ 고민하신 부분은 **'의존성 주입'** 이라는 키워드로 공부해보시면 도움이 많이 될 것 같습니다! 맞다 틀리다는 없지만 고민한 내용은 근접합니다!
미리 타입 내부에서 초기화를 시켜버리면 빈 큐가 생성되는 것이니까 큐 안에 값을 넣으려면 구조체 밖에서 구조체 내부의 프로퍼티 값을 건드려야하는 상황이 오기때문에 좋지 않다라는 결론이 나왔습니다!
private으로 하고, 특정 함수로만 private 변수에 접근하게 되면 되기 때문에, 무조건 좋지 않은건 아닙니다!

제가 생각했을 때에는 Formula의 내부 Queue는 빈큐 외의 값으로 초기화 될 경우가 아직까지는 없기 때문에, 외부에서 큐를 생성해서 넣어주는 작업을 굳이 하지 않아도 되지 않을까 라는 생각이 듭니다!


## 계산기 프로젝트 step3 고민한 점 및 PR 피드백

1. 함수 실행 결과를 프로퍼티에 담아주는 것과 안 담고 바로 사용하는 것의 차이점이 궁금합니다.

 ```swift
@IBAction func operatorButtonDidTapped(_ sender: UIButton) {
        
        if displayNumber.text != zeroString {
            let stackView = generateStackView()
            recentInputStackView.addArrangedSubview(stackView)
            stackView.isHidden = false
```
generateStackView()을 프로퍼티에 담아준 뒤 실행하면 되고,

```swift
@IBAction func operatorButtonDidTapped(_ sender: UIButton) {
        
        if displayNumber.text != zeroString {
            recentInputStackView.addArrangedSubview(generateStackView())
            generateStackView().isHidden = false
```
프로퍼티에 담아주지 않고 바로 generateStackView().isHidden = false 를 사용하면 오류가 나는 것을 볼 수 있었습니다.

코리의 피드백 ➡️ 함수는 실행할 때마다 stackView 인스턴스를 만들어서 반환하고 있습니다. 매번 실행될 때마다 만들어지기 때문에 발생하는 이슈입니다!
클래스, 구조체가 어떤식으로 메모리에 저장되고 관리되는지도 공부해보면 답을 찾으실 것 같아요!

예톤의 수정 ➡️ 추후 수정


## 공부한 것들

### 1. if와 guard의 차이?
- if-else와 guard-else를 쓸 때의 차이점 (같은 로직일 때도 이렇게 다르다.)
```swift
if sender.currentTitle == ".", displayNumber.text?.contains(".") == true {
                return
            }
```
```swift
guard sender.currentTitle != "." || displayNumber.text?.contains(".") == false else {
                return
            }
```
- 이번 프로젝트에서 오류 처리하는 부분을 거의 다 이런식으로 써주었다. 그때마다 guard문과 if문 중 어떤 것을 쓰는 것이 더 효과적이고 가독성이 좋은 지에 대해 고민이었다. 

- 그래서 공식 문서 상에서의 둘의 차이를 알아보았다. 

1. if와 달리 guard는 항상 else문을 가진다.
2. guard의 else문에서는 return(혹은 break, continue, throw)로 즉시 종료시킨다.
리턴을 하지 않는 fatalError(_:file:line:)를 이용해 종료시킬 수도 있다. 
따라서 예외 처리 시에는 보통 guard문을 사용한다.
3. 따라서 guard가 코드의 가독성을 높인다.

- 나는 아무리 봐도 가독성은 if문이 좋아보이는데... guard문으로 쓰면 or로 생각해야하니까 오히려 내가 짠 로직인데도 헷갈리게 느껴졌다..!!

### 2. 스택 뷰란?
- 스택 뷰는 Arranged SubViews 프로퍼티에 들어있는 모든 뷰의 레이아웃을 관리한다. 
- 이 뷰들은 StackView의 arrangedSubViews 배열의 순서에 따라 Stackview의 축을 따라 배치된다.
- 지금까지 horizontal이 수직인줄 알았던 나..................충격
- 스택 뷰 안의 규칙을 정해주는 옵션들
        - Axis : 수직, 수평을 정하는 옵션
        - Alignment : StackView안에 view들의 Y축을 정렬하는 옵션
            - Fill, Leading(오른쪽 정렬), Center, Trailing(왼쪽 정렬)이 있다.
        - Distribution : StackView안에 view들의 X축을 정렬하는 옵션
            - Fill, Fill Equally, Fill Proportionally, Equal Spacing, Equal Centering이 있다.
            - Distribution 넘나 어려움..
        - Spacing : subview들 간의 간격을 설정하는 옵션


### 3. removeArrangedSubview / removeFromSuperview / isHidden
- removeArrangedSubview 메서드를 호출한다고 해서 뷰가 화면에서 사라지는 것이 아니다.
- 이 메서드의 호출은 더이상 뷰의 위치와 크기를 스택 뷰에서 관리하지 않는다는 것을 의미하고, 뷰가 화면에 나타나지 않도록 하려면 뷰의 removeFromSuperview() 메서드를 호출하거나 뷰의 isHidden 속성을 true로 설정해야 한다.


### 4. 스크롤 뷰란?
- UIScrollView는 UITableView, UITextView, UICollecctionView을 포함하여 몇가지 UIKit 클래스들의 superclass이다.
- 스크롤 뷰는 스크롤되는 뷰들을 담고 있는 Content Layout과 화면에 보여지는 Frame Layout으로 나뉘어진다. Content layout에는 스크롤 되는 전체 content를 가지고 있고, Frame layout은 잘려서 보여지기 때문에 스크롤 해야 content layout의 다른 contents를 볼 수 있다. 이 두개의 키워드를 알고 보면이해하기 쉽다.
