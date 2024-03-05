# What's in Seoul README

[1. 프로젝트 소개](#프로젝트-소개)

[2. 구현 화면](#구현-화면)

[3. 프로젝트 구조](#프로젝트-구조)

[4. 프로젝트 디자인](#프로젝트-디자인)

[5. STEP별 구현 내용](#STEP별-구현-내용)

[6. 트러블 슈팅](#트러블-슈팅)

[7. 추후 계획](#추후-계획)

<br>

## 프로젝트 소개
- 🏃🏻🏃🏻‍♂️💨 **프로젝트 구상:** `24. 01. 08.` ~ `24. 01. 15.`
- 🏃🏻🏃🏻‍♂️💨 **프로젝트 기간:** `24. 01. 16.` ~  **(진행중)**
    - **[Step 1]** `24. 01. 19.` ~ `24. 01. 26.`
    - **[Step 2]** `24. 01. 27.` ~ `24. 02. 02.`
    - **[Step 3]** `24. 02. 03.` ~ `24. 02. 16.`
    - **[Step 4]** `24. 02. 22.` ~ `24. 03. 04.`
    - **[Step 5]** `24. 03. 05.` ~ `24. 03. 05.`
    - **[Step 6]** `24. 03.` ~

<br>

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
    - `Model-View Architecture`
    - `Observer Design Pattern(Swift Combine)`
    - `Combine`
    - `PropertyWrapper`
        - `@AppStorage`
        - `@State`
        - `@Binding`
        - `@StateObject`
        - `@ObservableObject`
        - `@Published`
        - `@Environment`
    - `ShareLink`
    - `AnyCancellable`
    - `TabView`
    - `WKWebView(UIViewRepresentable)`
    - `AsyncImage`
    - `GeometryReader`
    - `Picker`
    - `Navigation`
        - `NavigationStack`
        - `NavigationLink`
        - `ToolBarItem`
    - `NWPathMonitor`
    - `ScrollViewReader`
    - `custom sheet`
    - `searchable`
    - `onTapGesture`
    - `onChange`
    - `External App API Use`
        - `Naver Map`
        - `Kakao Map`
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

### Step 1: Onboarding View 구현
- **Onboarding View 구현**
    - `상태를 가진 color 변수`를 만들어 App 전체에서 사용
    - `상태를 가진 initial 변수`를 만들어 App 첫 실행 때만 `Onboarding Page`를 보여주기
    - `상태를 가진 region 변수`를 만들어 선택한 지역 저장 및 활용
    - `Picker`를 활용하여 지역을 선택할 수 있도록 구현
    - `TabView`를 통해 `Onboarding` 각 페이지를 이동

### Step 2: Program View 구현
- **Program View 구현**
    - 가운데 보이는 컨텐츠 강조(-> `TabView`로 변경되어 자동 강조)
    - 양쪽 컨텐츠 투명도 조절(-> `TabView`로 변경되어 조절 필요 없음)
    - `NavigationBar` 구성
    - `TabView` 사용
- **API Model 구성**
    - 네트워크 분리
    - 오프라인 환경 감지 및 안내
    - 목업, 실 데이터 테스트

### Step 3: Search View 구현
- **Search View 구현**
    - `ProgramView`에서 `Search Icon`을 터치하면 `SearchView`로 이동(`NavigationLink` 활용)
    - 프로그램 제목은 검색하여 필터링
    - 필터링이 되면 첫 결과로 위치 이동

- **Filter View 구현**
    - 카테고리, 지역은 `FilterView`를 사용하여 적용
    - 아래쪽에 sheet로 작게 띄워 현재 context 유지
    - 필터 초기화, 닫기 버튼 기능 제공
    - `@State`, `@Binding`을 통한 필터 선택값 반영

### Step 4: Program Detail View 구현
- **Program Detail View 구현**
    - 포스터를 배경으로 자세한 정보를 스크롤하며 볼 수 있도록 구현
    - 프로그램명 우측에 즐겨찾기와 알림 버튼 추가
    - 관련 링크로 이동하는 버튼 추가
    - 프로그램 진행 장소를 지도로 제공

- **부가 기능 구현**
    - 즐겨찾기 버튼 체크 여부에 따른 fill 상태 변경
    - 알림 받기 버튼 체크 여부에 따른 fill 상태 변경
    - 공유시트 기능 구현

### Step 5: Project Maintenance
- **DTO**
    - 사용하지 않는 항목 제거

- **ContentView**
    - fullScreenCover 대신 isFirstLaunching 기준으로 분기 처리
    - @AppStorage 등의 프로퍼티 위치 고려

- **ProgramView**
    - 설정, 검색 위치 고려
    - networkManager 위치 고려

- **ProgramCardView**
    - shadow, opacity 값 조정
    - 사용하지 않는 프로퍼티 제거

- **SearchView**
    - List 보일러 플레이트 코드 제거하여 로직 간결화

- **SearchCardView**
    - 이미지와 텍스트 위치 조정
    - content를 전달해서 내부에서 동작하는 것 고려
        - 내부 동작에 대한 캡슐화 목적 + 메모리 Allocations상 10MiB 차이 나는 것 확인

- **ProgramDetailView**
    - 홈페이지 이동 시 ToolBar 제공
        - .toolbar 관련 코드가 중복되어 WebView 내에 CustomWebView를 구현
        - 보일러 플레이트 코드 제거 및 사용하는 View 코드 간결화
        - 필요한 WebView는 외부에서 주입

<br>

## 트러블 슈팅

### 1. 앱 데이터 구성에 대한 고민
**고민한 점 :**
- Onboarding Page를 만드는 데 있어서, View는 각 컴포넌트를 만들고 레이아웃을 잡으면 되지만, 그 과정에서 사용할 데이터, 저장할 데이터는 어떻게 관리하고 어떻게 분리하면 좋을지 고민함

**과정 및 해결 :**
- `WWDC20 Data Essentials in SwiftUI` 영상이 많이 참고가 되었다.
해당 영상에서, 데이터를 사용할 때 고려해야 할 3가지 질문을 알려줬는데, 다음과 같다.

    **1) View가 작업을 수행하려면 어떤 데이터가 필요한가?
    2) View가 해당 데이터를 어떻게 조작하는가?
    3) 데이터는 어디에서 오는가?(Source of Truth)**

- 이외에도 `property wrapper`의 사용 환경에 대한 설명 덕에 고민을 해결할 수 있었다.
가령 Step 1의 상태를 가진 데이터는 다음과 같이 보았다.

    1) **Color**
    - 앱의 메인 색상이 무엇인지 정보를 담고 있는 데이터가 필요
    - 설정에서 메인 색상을 변경할 수 있게 접근할 수 있어야 함. 나머지 View는 단순 데이터 읽기
    - App 내에서 글로벌하게 사용되고, 자주 바뀌지 않는 작은 설정 값이기에 `AppStorage`를 사용하여 저장하고 `binding`을 통해 활용
    <br>
    2) **Initial**
    - App을 설치한 이후 처음 실행한 것인지 정보를 담고 있는 데이터가 필요
    - ContentView에서는 OnboardingTabView를 보여주는 여부에 사용하기 위해 단순히 값을 읽는 것만 수행, OnboardingPage의 마지막인 ThirdView에서는 해당 값을 변경하기 위한 접근이 필요
    - 이 데이터는 App 최초 실행 이후에는 변경될 일이 없어 `State`나 `Observable`로 추적할 필요가 없고, 작은 Bool 데이터이기 때문에 `AppStorage`를 사용하고, `binding`을 통해 활용
    <br>
    3) **Region**
    - 사용자가 선택한 지역에 대한 정보를 담고 있는 데이터가 필요
    - OnboardingSecondView와 설정에서 값을 바꾸기 위한 접근이 필요, 메인 로직에서는 해당 값을 단순히 참고하여 작업 수행
    - 처음에는 추적을 위해 `ObservableObject`를 고려했으나, 이 역시 크기가 작은 설정 값이기 때문에 `AppStorage`를 사용하고 상위 뷰에서 하위 뷰로 `binding`을 통해 활용

### 2. AppStorage에 저장할 타입
**고민한 점 :**
- Initial은 Bool로 값을 저장하면 되는데, Color, Region은 Enum타입으로 만들었기에 String으로 저장하고 그걸 불러와서 매치하는 방법이 맞나 고민함

**과정 및 해결 :**
- Enum은 `rawPresentable`을 준수하고, `@AppStorage`는 그 타입을 지원하기 때문에 가능하다.
Color는 각 case가 asset의 이름을 rawValue로 갖고 있고, Region도 각 케이스명을 그대로 rawValue로 갖고 있기 때문이다.

### 3. ATS policy 문제
**고민한 점 :**
- API 요청이 http로 제한되어 있는데 보안의 문제로 https를 써야 하는 상황(since it does not conform to ATS policy 오류 발생)

**과정 및 해결 :**
- `Info.plist` 파일 조정을 통해 해결이 가능
    - `App Transport Security Settings Key` 사용
    - `Exception Domains`에 사용할 도메인 기입
    - 만약 http인 전체 도메인을 허용하는 경우에는
`NSExceptionDomains` 대신 `NSAllowsArbitraryLoads` 사용

### 4. CodingKeys 오류
**고민한 점 :**
- DTO를 API 데이터 타입에 맞게 구성했는데 디코딩 오류 발생

**과정 및 해결 :**
- `CodingKeys` 매칭의 문제였음. 일부 CodingKeys가 Codingkeys로 오기입 되어있었다.

### 5. dataTaskPublisher의 중복 실행 방지
**고민한 점 :**
- URLSession의 `dataTaskPublisher`를 사용하여 API 호출을 하는데, 처음 한 번만 부르면 상관이 없으나 새로고침 혹은 오류로 인해 중복으로 호출이 되면 리소스 낭비가 있을 것으로 판단되어 방법을 고민

**과정 및 해결 :**
- 해당 Publisher는 `AnyCancellable` 타입이기에 해당 비동기 작업을 수행할 때 NetworkManager의 programCancellable 변수에 저장
- API 요청 메서드가 호출되면 programCancellable을 `cancel()`하고 새로 `dataTaskPublisher`를 만들어 비동기 작업 수행
- 중복 호출이 아니라면 작업 완료 후 할당 해제

### 6. AsyncImage 오프라인 대응
**고민한 점 :**
- `AsyncImage`에서 이미지를 불러오는 동안 네트워크가 끊기게 되면 placeholder로 지정한 ProgressView만 보이게 됨
- 네트워크가 다시 연결되면 보이도록 하고 싶은데 다른 TabView로 페이징하면 해당 객체는 다시 그려지기 때문에 이미지가 보이나 이미 로딩오류가 난 `AsyncImage`는 이미지가 보이지 않음

**과정 및 해결 :**
- API 요청 메서드를 호출했으나 URL이 동일하기 때문에 새로 그려지지 않음을 확인
- NetworkManager에서 해당 메서드를 호출할 때 기존 contents를 비우는 작업을 추가하여 변화를 줌으로써 해결할 수 있었음

### 7. TabView 처음으로 이동하기
**고민한 점 :**
- `ProgramView`에서 새로고침 버튼을 통해 아이템을 새로 받아왔을 때, `TabView Page`의 맨 처음으로 돌아가게 하고 싶으나 다양한 방법을 시도해도 적용되지 않음

**과정 및 해결 :**
- `@State`프로퍼티를 사용하여 해결하였다. `TabView`의 `selection` 파라미터는 `@State`프로퍼티와 각 `TabViewItem`의 `tag` 조합으로만 써야하는 줄 알았는데, 이는 각 페이지간 버튼을 통해 움직이거나 할 때 사용할 수 있고, 이 문제의 경우에는 단순히 첫 페이지로만 이동하면 되는 것이다.
- `@State` 프로퍼티로 임의의 문자열 혹은 정수를 생성하고, `selection` 파라미터에 해당 프로퍼티를 전달한 후, 새로고침을 할 때 `@State` 프로퍼티의 값을 처음에 지정한 값으로 변경해주는 코드를 수행하도록 했다.
- `TabView`에서 `selection`을 사용하면 첫 아이템을 `selection`에 들어온 `@State`의 값으로 삼기 때문에 이 방법을 통해 돌아갈 수 있었다.

### 8. SearchView에서 키보드 내리기
**고민한 점 :**
- `searchable`로 검색기능을 구현했는데, 일반적으로 앱을 사용할 때처럼 화면을 터치했을 때 키보드를 내리고자 했음

**과정 및 해결 :**
- `View+Extension`에 `hideKeyboard()` 메서드를 구현하여 해결
- `UIApplication` 인스턴스는 `싱글톤` 객체인데, `사용자 이벤트의 라우팅 처리`, `제어 객체가 전달한 동작 메시지를 적절하게 전송`하는 등의 역할을 하는데, 이를 활용할 수 있었다.
- `UIApplication.shared`로 싱글톤 객체에 접근하고, `sendAction` 메서드를 사용하여 `UIResponder`의 `resignFirstResponder`를 수행하도록 했다.

### 9. List에서 맨 위로 이동하기
**고민한 점 :**
- `SearchView`에서 스크롤을 내린 상태로 필터를 적용하면 그 위치에서 항목이 변경되기 때문에 맨 위로 다시 올려야 하는 불편함이 있어 이를 해결하고자 했다.

**과정 및 해결 :**
- `TabView`때처럼 첫 항목을 지정할 수 없기에 `ScrollViewReader`로 `View`를 `embed`하고, `proxy`를 사용하여 `scrollTo` 메서드를 사용하였다.
- 다만 변경되는 항목 속에서 어떻게 맨 위의 값을 얻느냐가 관건이었는데, 필터 결과에 상관없이 고정적으로 상단에 존재하는 `EmptyView`를 만들고 해당 `View`에 `id`를 부여하는 방식으로 해결할 수 있었다.

### 10. WebView 사용하기
**고민한 점 :**
- UIKit에서는 WebView 혹은 SFSafariViewController를 그냥 사용하면 되었지만 SwiftUI에서 웹뷰 기능을 네이티브로 제공하지 않아 UIKit의 방식을 써야 했다.

**과정 및 해결 :**
- UIKit의 기능을 사용할 수 있게 해주는 UIViewRepresentable 프로토콜을 사용하여 해결할 수 있었다.
- makeUIView, updateUIView 두 개의 필수 메서드를 구현해야 하는데, 전자는 View를 만들고 초기 설정을 진행하는 메서드이고 후자는 새로운 정보로 View를 업데이트 해주는 메서드이다.
- makeUIView에서 어떤 View 타입을 반환할 것인지 명시해주고, updateUIView에서의 파라미터 타입도 이에 맞춰서 변경해줘야 한다.
- makeUIView에서 빈 WKWebView를 반환하고, updateUIView에서 주어진 url을 Request로 만들어 WKWebView에서 불러오도록 했다.

```swift=
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    // MARK: - Public Properties
    let urlToConnect: String

    // MARK: - Private Properties
    private var webView: WKWebView

    // MARK: - Initializer
    init(urlToConnect: String) {
        self.urlToConnect = urlToConnect
        self.webView = WKWebView()
    }

    // MARK: - UIViewRepresentable
    func makeUIView(context: Context) -> WKWebView {
        return webView
    }

    func updateUIView(_ webView: WKWebView, context: Context) {
        guard let url = URL(string: urlToConnect) else { return }

        let urlRequest = URLRequest(url: url)

        webView.load(urlRequest)
    }

    // MARK: - Public Functions
    func goBack() {
        webView.goBack()
    }

    func goForward() {
        webView.goForward()
    }

    func reload() {
        webView.reload()
    }
}
```

### 11. TabBar 배경색 변경하기
**고민한 점 :**
- 상세 페이지에 들어갔을 때 TabBar의 색상이 페이지 배경 색상과 일치했으면 좋겠으나 색상 변경 코드가 적용되지 않았다.

**과정 및 해결 :**
- init()에서 UITabBar.appearance().backgroundColor 속성을 통해 변경할 수 있었다.

```swift=
init() {
    UITabBar.appearance().backgroundColor = UIColor.systemBackground
}
```

### 12. 위치 정보를 지도로 보여주기
**고민한 점 :**
- 프로그램이 진행되는 장소를 지도를 통해 보여주고 싶으나 MapKit을 사용하면 앱의 UI가 깨지는 현상이 발생했다(내비게이션 바, 탭바 색상 변경 및 내비게이션 타이틀 색 초기화).

**과정 및 해결 :**
- ProgramDetailView에서 DescriptionView에 Map을 담아보는 방법, MapView를 따로 구현하고 인스턴스로 불러와 사용하는 방법, 내비게이션 바와 탭바 색상을 강제하는 방법 등 다방면으로 시도하였으나 원하는대로 이뤄지지 않았다.
- 애플 기본 지도 앱으로 연결시키고자 했으나 기본 지도 앱에서 요구하는 정보와 데이터에서 제공하는 정보가 맞지 않아 위치 정보를 표시할 수 없는 데이터가 있었다.
- 사람들이 보통 많이 사용하는 외부 지도 앱(네이버, 카카오)을 사용하여 위치 정보를 제공하고자 했다.
- 그러나 앱 내에서 조작을 하기보다 실제 앱에서 경로를 보여주는 것이 더 효율적이라 판단하여 각 앱의 API를 사용하여 프로그램이 진행되는 장소의 위, 경도를 전달하고 현재 위치에서 가는 경로를 대중교통으로 보여주었다.
- 앱이 설치되어 있으면 실행하여 경로를 보여주고, 없다면 앱스토어에 연결했지만 외부 앱을 사용하고 싶지 않은 이용자도 있을 것이기에 WebView를 통해 포털사이트 쿼리에 해당 장소명을 집어넣어 앱 내에서도 장소 정보를 확인할 수 있게 했다.

```swift=
struct MapButton: View {
    // MARK: - Public Properties
    var mapType: MapType
    var latitude: String
    var longitude: String

    // MARK: - Body
    var body: some View {
        switch mapType {
            case .naver:
                Button(action: {
                    LinkToNaverMap(
                        latitude: Double(latitude) ?? 0,
                        longitude: Double(longitude) ?? 0)
                }, label: {
                    Image("Naver_map_Icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                })

            case .kakao:
                Button(action: {
                    LinkToKakaoMap(
                        latitude: Double(latitude) ?? 0,
                        longitude: Double(longitude) ?? 0)
                }, label: {
                    Image("Kakao_map_Icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                })
        }
    }
}
```

<br>

## 추후 계획

- 
