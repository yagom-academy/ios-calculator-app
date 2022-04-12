>프로젝트 기간 2022.03.28 ~ 2022.04.01
>
>팀원 : [Red](https://github.com/cherrishRed), [Tiana](https://github.com/Kim-TaeHyun-A), [Eddy](https://github.com/kimkyunghun3) / 리뷰어 : [개굴](https://github.com/yoo-kie)

## 목차

- [프로젝트 소개](#프로젝트-소개)
- [UML](#UML)
- [키워드](#키워드)
- [고민한점](#고민한점)
- [배운개념](#배운개념)

## 프로젝트 소개
각자가 구현한 계산기 코드를 합치고 리펙토링!

각자의 계산기 프로젝트 바로가기
[Red의 계산기 프로젝트 보기](https://github.com/cherrishRed/ios-calculator-app)
[Tiana의 계산기 프로젝트 보기](https://github.com/Kim-TaeHyun-A/ios-calculator-app)
[Eddy의 계산기 프로젝트 보기](https://github.com/kimkyunghun3/ios-calculator-app/tree/Calculator2_Step1)

## UML
![](https://i.imgur.com/r7K9zbE.png)
## 개발환경 및 라이브러리
[![swift](https://img.shields.io/badge/swift-5.6-orange)]()
[![xcode](https://img.shields.io/badge/Xcode-13.3-blue)]()

## 키워드
`git flow` `auto layout` `Optional Extension` `lldb` `Render Loop` `layout cycle`

## 고민한점
* 협업을 할 시 git flow 를 활용한 PR을 작성하는 방법 (PR title)
* git flow 활용 전략과 브런치 네이밍 전략
* 플래그 제거
* 옵셔널 제거하는 여러가지 방법
* 에러 핸들링 (feat. nan)
* layoutIfNeeded() 함수의 필요성
* 타입 명시와 타입 추론을 선택하는 기준과 장단점
* 연산 프로퍼티와 매서드 중 선택하는 기준
* 가독성 vs 새로운 변수 생성

자세한 고민 보기
[STEP 1 PR](https://github.com/yagom-academy/ios-calculator-app/pull/214)
[STEP 2 PR](https://github.com/yagom-academy/ios-calculator-app/pull/228)

## 배운개념
### git flow 전략 
[A successful Git branching model](https://nvie.com/posts/a-successful-git-branching-model/)
 git flow 전략은 팀마다 일부 차이가 있을 수 있다. 그러므로 프로젝트 시작 전 팀과의 협의 후 git flow 전략을 짜는 것이 좋다.
 먼저 우리가 선택한 방식은 main - develop - Calculator_Step1,2 - Feature 브런치들 방식으로 git flow 전략을 짰다.
 main는 처음 시작할 때 develop 브런치를 만들기 위한 용도로 사용했으며 최종적으로 사용을 하진 않았다. 최종 완성본은 develop 브런치에서 만들었다.
 develop에서 Calculator_Step1,2 브런치를 판 이후 각 스텝에 필요한 기능을 구현할 때 Feature/브런치명 방식으로 기능단위로 브런치를 만들었다.
 그 기능이 완성되면 Caculator_Step1,2 브런치에 merge하고 이렇게 Step이 끝나면 최종적으로 develop에 merge하는 방식이다.
 merge는 직접적으로 이루어지지않고 PR를 통해 했으며, PR명은 기능을 나타낼 수 있도록 했다. 추가적으로 PR 속 Labels, Projects를 활용해서 PR의 성격을 더 쉽게 나타냈으며 칸반을 제공하여 진행상황을 모두와 공유하도록 했다.
 실제로 프로젝트 때 기능단위로 각자 수행했다면 PR 후 리뷰한 다음 확인 후 approve 하는 방식을 해야할 것이다.
 
 그 이후 리뷰어에게 이 전략에 대한 리뷰를 받았을 때, main를 최종으로 사용하고 Calculator_Step1,2가 없이 develop에서 기능 단위로 브런치를 파서하는 방법도 조언을 받았다. 이 부분은 팀의 성격에 따라 결정할 수 있는 부분이라고 판단해서 우리의 방식대로 진행하게 되었다.
 
### 플래그 제거
메서드 밖에 있는 전역 또는 지역 변수를 생성해 플래그로 사용하는 것은 좋지 않다. 값이 언제 바뀌는지 추적하기 힘들기 때문이다. 

우리는 플래그를 삭제하기 위해 아래의 두가지 방법을 사용했다.

* 현재 숫자를 담아두던 플래그를 없애고, label.currentTitle 을 받아서 사용했다. 
* 앱 사용자가 버튼으로 입력한 0 값과 현재 입력값을 보여주는 레이블의 기본값으로 설정된 0을 구분하기 위해 앞에 공백이 붙은 0(" 0")을 사용해서 구분

### String? 의 extension 
String extension 에 새로운 기능을 구현해도 String? 에서는 사용하지 못한다. 
String? 의 extension 을 하고 싶다면 String이 아니라 Optional 에 extension 을 만들고 조건을 걸어 주어야 한다.
```swift
extension Optional where Wrapped == String {
    var unwrapped: String {
        guard let result = self else { return CalculatorConstant.blank }
        return result
    }
}
```
    
### 레이아웃 갱신
* Render Loop
[High Performance Auto Layout](https://developer.apple.com/videos/play/wwdc2018/220/)
<img src="https://i.imgur.com/dNtM5l0.png" width="600">


* Layout Cycle
[Mysteries of Auto Layout, Part 2](https://developer.apple.com/videos/play/wwdc2015/219/)
<img src="https://i.imgur.com/Q9ZeG53.png" width="400">

* layoutIfNeeded()
[Apple Developer Documentation: layoutIfNeeded()](https://developer.apple.com/documentation/uikit/uiview/1622507-layoutifneeded)
레이아웃 갱신 대기 중일 때 즉각 반영되도록 하는 메서드이다.
AutoLayout 사용하면, layout engine이 뷰 위치 변경을 위해 제약 조건 확인 필요하다.
레이아웃은 부모 뷰와 연관되므로 root view로 부터 메시지 받아야 한다. 단, 부모에 변경사항 없으면 메서드 실행되자 않는다.

### 협업 경험
 동일한 목표로 만들어진 프로젝트 코드를 팀원간 협의를 통해 각자의 코드에서 일부를 사용했다. 
 각자 구현방식이 다르기에 이를 맞추는 과정이 필요했으며 우리는 가독성을 기준으로 코드를 선정했다.
 그러나 가독성의 대한 개인의 기준이 각자 달라 많은 시간의 협의가 이루어졌다. 
같은 프로젝트 요구사항을 받고 구현한 코드였는데 모두 구현한 내용이 상이한 것을 보니, 요구 사항분석 후 애매한 경우 커뮤니케이션을 하는 것이 중요한 것 같다.
