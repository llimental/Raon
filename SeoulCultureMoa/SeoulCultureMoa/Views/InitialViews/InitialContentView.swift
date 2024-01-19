//
//  InitialContentView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/19/24.
//

import SwiftUI

struct InitialContentView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.pink)
                .ignoresSafeArea()

            Text("앱 제목")
        }
    }
}

#Preview {
    InitialContentView()
}
