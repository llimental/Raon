//
//  LinkToPlaceView.swift
//  Raon
//
//  Created by Lust3r on 3/4/24.
//

import SwiftUI

struct LinkToPlaceView: View {
    // MARK: - @State Properties
    @State private var isShowDialog = false

    // MARK: - Public Properties
    var latitude: String
    var longitude: String
    var place: String
    var textColor: ThemeColors

    // MARK: - Body
    var body: some View {
        HStack {
            Text("장소:")
                .bold()
                .foregroundStyle(textColor.color)
                .frame(width: 70, alignment: .trailing)

            Button(action: {
                isShowDialog.toggle()
            }, label: {
                Text(place)
            })
            .confirmationDialog("mapDialog", isPresented: $isShowDialog) {
                MapButton(
                    mapType: .naver,
                    latitude: latitude,
                    longitude: longitude,
                    place: place)

                MapButton(
                    mapType: .kakao,
                    latitude: latitude,
                    longitude: longitude,
                    place: place)
            } message: {
                Text("장소 정보를 확인할 방법을 선택해주세요")
            }

            Spacer()
        }
        .font(.subheadline)
    }
}

#Preview {
    LinkToPlaceView(
        latitude: "126.9760053",
        longitude: "37.5726241",
        place: "세종대극장",
        textColor: .pink)
}
