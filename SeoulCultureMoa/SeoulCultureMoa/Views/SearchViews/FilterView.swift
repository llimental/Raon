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

    // MARK: - @State Properties
    @State private var selectedCategory: Categories = .allCategory
    @State private var selectedRegion: Regions = .allRegion

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

                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Categories.allCases) { category in
                            Text(category.rawValue)
                                .monospaced()
                        }
                    }
                }

                HStack {
                    Text("지역")

                    Spacer()

                    Picker("Region", selection: $selectedRegion) {
                        ForEach(Regions.allCases) { region in
                            Text(region.rawValue)
                                .monospaced()
                        }
                    }
                }

                Spacer()

                VStack {
                    Button(action: {
                        selectedCategory = .allCategory
                        selectedRegion = .allRegion
                    }, label: {
                        Text("필터 초기화")
                            .foregroundStyle(.red)
                    })
                    .padding()

                    ColoredButton(
                        buttonAction: {
                            categoryFilter = selectedCategory
                            regionFilter = selectedRegion
                            dismiss()
                        },
                        buttonText: "적용",
                        buttonColor: .blue,
                        buttonWidth: 200)
                }
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("취소")
                            .foregroundStyle(.red)
                    })
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
