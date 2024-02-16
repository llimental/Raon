//
//  FilterView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/13/24.
//

import SwiftUI

struct FilterView: View {
    // MARK: - @Environment Properties
    @Environment(\.dismiss) private var dismiss

    // MARK: - @Binding Properties
    @Binding var categoryFilter: Categories
    @Binding var regionFilter: Regions

    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("카테고리")

                    Spacer()

                    Picker("Category", selection: $categoryFilter) {
                        ForEach(Categories.allCases) { category in
                            Text(category.rawValue)
                                .monospaced()
                        }
                    }
                }

                HStack {
                    Text("지역")

                    Spacer()

                    Picker("Region", selection: $regionFilter) {
                        ForEach(Regions.allCases) { region in
                            Text(region.rawValue)
                                .monospaced()
                        }
                    }
                }

                Spacer()

                Button(action: {
                    categoryFilter = .allCategory
                    regionFilter = .allRegion
                }, label: {
                    Text("필터 초기화")
                        .foregroundStyle(.red)
                })
            }
            .padding(20)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                    .padding()
                    .foregroundStyle(.black)
                }
            }
        }
    }
}


#Preview {
    FilterView(
        categoryFilter: .constant(.allCategory),
        regionFilter: .constant(.allRegion))
}
