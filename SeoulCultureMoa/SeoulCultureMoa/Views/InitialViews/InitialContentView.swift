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

            GeometryReader { geometry in
                VStack(alignment: .center) {
                    Spacer()

                    VStack(alignment: .leading) {
                        Text("""
                             Seoul
                             Culture
                             Moa
                             """)
                        .font(.system(size: 50))

                        Rectangle()
                            .frame(height: 0)

                        Text("서울시 문화프로그램 정보를 한눈에")
                        .font(.body)
                    }
                    .foregroundStyle(.white)
                    .padding()
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
            .padding()
        }
    }
}

#Preview {
    InitialContentView()
}
