>프로젝트 기간 2022.05.16 ~ 2022.06.03
>
>팀원 : [unchain123](https://github.com/unchain123), [브래드](https://github.com/bradheo65) / 리뷰어 : [도미닉](https://github.com/AppleCEO)
## 목차

- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [키워드](#키워드)
- [고민한점](#고민한점)
- [배운개념](#배운개념)
- [협업경험](#협업경험)

## 프로젝트 소개
각자가 구현한 계산기 코드를 합치기(step1)
리펙토링 하기(step2)

각자의 계산기 프로젝트 바로가기
[unchain의 계산기 프로젝트 보기](https://github.com/unchain123/ios-calculator-app)
[브래드의 계산기 프로젝트 보기](https://github.com/bradheo65/ios-calculator-app)

## Preview
![](https://i.imgur.com/whEL3RC.gif)
![](https://i.imgur.com/du6He6B.gif)

## UML
![](https://i.imgur.com/gR93MtZ.jpg)

## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()

## 키워드
- `UML`
- `Queue`, `LinkedList`
- `Optional Extension`
- `고차함수`
- `ScrollView`,`StackView`
- `lldb` 
- `TDD`

## 고민한점
- Queue 생성 시 배열, 연결 리스트(단방향, 양방향) 선택 기준
- 고차함수 활용방안
- 옵셔널 바인딩 방법 선택 기준
- 에러 핸들링 (feat. nan)
- 가독성 vs 새로운 변수 생성
- 코드를 병합할 때 기준
- 이중 조건문 제거
- 모델 뷰컨트롤러 메소드 역할 분리

자세한 고민 보기
[STEP 1 PR](https://github.com/yagom-academy/ios-calculator-app/pull/296)
[STEP 2 PR](https://github.com/yagom-academy/ios-calculator-app/pull/302)

## 배운개념

### TDD
이번 프로젝트에서 각 기능 별로 TDD를 구현하고, 메인코드에 적용하는 방식으로 진행을 했다. 이 방식에 대해 장단점을 생각해보았는데, 장점으로는 기능적인 측면에서의 신뢰성을 높여주었고 해당 기능에 대한 메소드를 작성하면서 네이밍이나 컨벤션에 대해 다시 한번더 생각하면서 리팩토링에 대한 고민이 많이 줄여주었다. 단점으로는 장점에서 작업한 과정들에 대해 소요시간이 메인코드에 바로 적용하는 것보다 더 길게 느껴졌다.
결과적으로 시간이 더 소요되지만 TDD를 하면서 코드를 작성하는 방법이 해당 기능에 대한 신뢰성에 대한 테스트를 하면서 진행하는 것이기 때문에 TDD를 활용하면서 코드 작성하는 것이 중요하다고 느껴졌다.


### if문 코드정리

#### 기존 if else문
```swift
    mutating func addOperatorStorage(to buttonTitle: String) -> String {
        if userIsInTheMiddleOfTyping {
            presentOperator = buttonTitle
            
            operatorStorage.append(" \(buttonTitle) ")
            return presentOperator
        } else {
            presentOperator = buttonTitle
            operatorStorage.append(" \(buttonTitle) ")
        
            userIsInTheMiddleOfTyping = true
            userIsInTheAfterTabAnswerButton = false
            return presentOperator
        }
    }
```

#### if return문
```swift
    mutating func addOperatorStorage(to buttonTitle: String) -> String {
        if userIsInTheMiddleOfTyping {
            presentOperator = buttonTitle
            
            operatorStorage.append(" \(buttonTitle) ")
            return presentOperator
        }
        presentOperator = buttonTitle
        operatorStorage.append(" \(buttonTitle) ")
        
        userIsInTheMiddleOfTyping = true
        userIsInTheAfterTabAnswerButton = false
        return presentOperator
    }
```
제어문 관련해서 리뷰를 받은 부분인데, if else문으로 코드 정리하는 것보단 if return문을 통해 else를 제거해주는 코드 컨벤션을 주로 사용한다고 한다. 막상 if return문으로 정리해 보니 if else문보다 가독성 측면에선 더 좋은 것 같다.

### 모델과 뷰컨트롤러의 역할을 분리
- 처음에 기능구현만을 생각하고 코드를 작성했을 때 뷰컨트롤러에 모든 계산 기능에 관련된 함수와 뷰를 제어하는 함수 구분 없이 다 들어가 있었다. 그렇다 보니 뷰컨트롤러가 뚱뚱해진건 물론이고 가독성 또한 떨어졌다. 뷰컨트롤러에서 값의 저장과 계산도 하고 있기 때문에 역할에 맞지 않았다고 생각해서 분리 하는 작업을 진행했다.
- 어떤 기능을 모델로 넘기는게 맞는지에 대해서 고민을 했고 계산기의 계산 기능과 계산된 값을 저장하는 프로퍼티는 모델로 넘기고 계산된 값을 다시 뷰컨트롤러에서 받아서 뷰에 띄워주기만 하는게 제대로된 역할 분리라고 생각했습니다.
 

## 협업경험

지금까지 해왔던 프로젝트는 처음부터 짝프로그래밍을 통해 바로바로 코드에 대한 설명을 하거나 들을 수 있었습니다. 하지만 이번 프로젝트의 경우 개인 프로젝트 시작 전 동일한 UML을 작성하고 코드 병합과정을 진행함에 있어 UML을 통해 순조롭게 진행이 될 것 같았지만, 개인이 작업했던 프로젝트에 대해서 서로에게 설명을 하고 코드를 병합하는 작업이 그나마 UML덕분에 설명하는데 있어 막힘이 없었습니다. 이러한 경험으로 처음 설계단계에서 UML을 잘 짜놓아야 한다는 것을 깨닫게 되었고. 코드네이밍, 컨벤션에 대한 중요성을 다시 한번 느꼈습니다. 또한 동료에게 나의 코드와 생각을 **"어떻게 하면 잘 설명할 수 있을까?"** 라는 생각을 할 수 있게 된 계기가 되었습니다.
