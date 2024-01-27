# What's in Seoul README

[1. 프로젝트 소개](#-프로젝트-소개)

[2. 구현 화면](#-구현-화면)

[3. 프로젝트 구조](#-프로젝트-구조)

[4. 프로젝트 디자인](#-프로젝트-디자인)

[4. STEP별 구현내용](#-step별-구현-내용)

[5. 트러블 슈팅](#-트러블-슈팅)

[6. 추후 계획](#-추후-계획)

<br>

## 프로젝트 소개
🏃🏻🏃🏻‍♂️💨 **프로젝트 구상:** `24. 01. 08` ~ `24. 01. 15`
🏃🏻🏃🏻‍♂️💨 **프로젝트 기간:** `24. 01. 16` ~  **(진행중)**

- **프로젝트 구성원(iOS Developer 1인)**

|<img src="https://avatars.githubusercontent.com/u/45708630?v=4" width=200>|
|:---:|
|[Lust3r](https://github.com/llimental)|

- **서비스 :** 서울시 문화 프로그램에 대한 정보 제공
    - 어떤 프로그램이 있는가?
    - 프로그램 정보는 무엇인가?
    - 프로그램 예약은 어떻게 하는가?
    - 날짜별 어떤 프로그램이 있는가?
    - 프로그램 미리 알림 푸시
- **기술 스택 :** **Swift**
    - `SwiftUI`
    - `PropertyWrapper`
        - `@AppStorage`
        - `@State`
        - `@Binding`
    - `TabView`
    - `Picker`
- **프로젝트 후기 :**
    - .

<br>

## 구현 화면


<br>

## 프로젝트 구조


<br>

## 프로젝트 디자인


<br>

## STEP별 구현 내용

### Step 1: InitialPage 구현
- Figma Flow의 Initial(1) ~ Initial(5) 구현
    - 상태를 가진 color 변수를 만들어 App 전체에서 사용
    - 상태를 가진 initial 변수를 만들어 App 첫 실행 때만 Onboarding Page를 보여주기
    - 상태를 가진 region 변수를 만들어 선택한 지역 저장 및 활용
    - Picker를 활용하여 지역을 선택할 수 있도록 구현
    - TabView를 통해 Onboarding 각 페이지를 이동

<br>

## 트러블 슈팅

### 1. 앱 데이터 구성에 대한 고민
**고민한 점 :**
Onboarding Page를 만드는 데 있어서, View는 각 컴포넌트를 만들고 레이아웃을 잡으면 되지만, 그 과정에서 사용할 데이터, 저장할 데이터는 어떻게 관리하고 어떻게 분리하면 좋을까?

**결론 :**
WWDC20 Data Essentials in SwiftUI 영상이 많이 참고가 되었다.
해당 영상에서, 데이터를 사용할 때 고려해야 할 3가지 질문을 알려줬는데, 다음과 같다.
1) View가 작업을 수행하려면 어떤 데이터가 필요한가?
2) View가 해당 데이터를 어떻게 조작하는가?
3) 데이터는 어디에서 오는가?(Source of Truth)

이외에도 property wrapper의 사용 환경에 대한 설명 덕에 고민을 해결할 수 있었다.

가령 Step 1의 상태를 가진 데이터는 다음과 같이 보았다.
1) **Color**
    - 앱의 메인 색상이 무엇인지 정보를 담고 있는 데이터가 필요
    - 설정에서 메인 색상을 변경할 수 있게 접근할 수 있어야 함. 나머지 View는 단순 데이터 읽기
    - App 내에서 글로벌하게 사용되고, 자주 바뀌지 않는 작은 설정 값이기에 AppStorage를 사용하여 저장하고 바인딩을 통해 활용

2) **Initial**
    - App을 설치한 이후 처음 실행한 것인지 정보를 담고 있는 데이터가 필요
    - ContentView에서는 OnboardingTabView를 보여주는 여부에 사용하기 위해 단순히 값을 읽는 것만 수행, OnboardingPage의 마지막인 ThirdView에서는 해당 값을 변경하기 위한 접근이 필요
    - 이 데이터는 App 최초 실행 이후에는 변경될 일이 없어 State나 Observable로 추적할 필요가 없고, 작은 Bool 데이터이기 때문에 AppStorage를 사용하고, 바인딩을 통해 활용

3) **Region**
    - 사용자가 선택한 지역에 대한 정보를 담고 있는 데이터가 필요
    - OnboardingSecondView와 설정에서 값을 바꾸기 위한 접근이 필요, 메인 로직에서는 해당 값을 단순히 참고하여 작업 수행
    - 처음에는 추적을 위해 ObservableObject를 고려했으나, 이 역시 크기가 작은 설정 값이기 때문에 AppStorage를 사용하고 상위 뷰에서 하위 뷰로 바인딩을 통해 활용

### 2. AppStorage에 저장할 타입
**고민한 점 :**
Initial은 Bool로 값을 저장하면 되는데, Color, Region은 Enum타입으로 만들었기에 String으로 저장하고 그걸 불러와서 매치하는 방법이 맞나 고민했음

**결론 :**
Enum은 rawPresentable을 준수하고, @AppStorage는 그 타입을 지원하기 때문에 가능.
Color는 각 case가 asset의 이름을 rawValue로 갖고 있고, Region도 각 케이스명을 그대로 rawValue로 갖고 있기 때문.

<br>

## 추후 계획

- 
