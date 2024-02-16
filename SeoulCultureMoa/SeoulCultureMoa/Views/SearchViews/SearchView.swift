//
//  SearchView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/5/24.
//

import SwiftUI

struct SearchView: View {
    // MARK: - @State Properties
    @State private var searchText = String()
    @State private var isPresented = false
    @State private var categoryFilter: Categories = .allCategory
    @State private var regionFilter: Regions = .allRegion

    // MARK: - @Binding Properties
    @Binding var contents: [ProgramContent]

    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                List {
                    if searchText.isEmpty {
                        EmptyView()
                            .id("firstView")
                        ForEach(getFilteredContents(), id: \.title) { content in
                            SearchCardView(
                                title: content.title,
                                imageURL: content.imageURL,
                                category: content.category,
                                region: content.region,
                                startDate: content.startDate,
                                isFree: content.isFree)
                        }
                    } else {
                        ForEach(contents.filter { $0.title.localizedStandardContains(searchText) }, id: \.title) { content in
                            SearchCardView(
                                title: content.title,
                                imageURL: content.imageURL,
                                category: content.category,
                                region: content.region,
                                startDate: content.startDate,
                                isFree: content.isFree)
                        }
                    }
                }
                .listStyle(.plain)
                .navigationTitle("검색")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("SearchFilter", systemImage: "slider.horizontal.3") {
                            isPresented.toggle()
                        }
                        .sheet(isPresented: $isPresented) {
                            FilterView(
                                categoryFilter: $categoryFilter,
                                regionFilter: $regionFilter)
                            .presentationDetents([.height(250)])
                            .presentationDragIndicator(.visible)
                            .presentationCornerRadius(30)
                        }
                    }
                }
                .searchable(
                    text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "프로그램명을 입력해주세요")
                .onTapGesture {
                    hideKeyboard()
                }
                .onChange(of: categoryFilter) {
                    proxy.scrollTo("firstView", anchor: .bottom)
                }
                .onChange(of: regionFilter) {
                    proxy.scrollTo("firstView", anchor: .bottom)
                }
            }
        }
    }

    // MARK: - Private Functions
    private func getFilteredContents() -> [ProgramContent] {
        contents.filter {
            if categoryFilter != .allCategory && regionFilter != .allRegion {
                return $0.category == categoryFilter.rawValue && $0.region == regionFilter.rawValue
            } else if categoryFilter != .allCategory {
                return $0.category == categoryFilter.rawValue
            } else if regionFilter != .allRegion {
                return $0.region == regionFilter.rawValue
            } else {
                return true
            }
        }
    }
}

#Preview {
    SearchView(contents: .constant(NetworkManager().contents))
}
