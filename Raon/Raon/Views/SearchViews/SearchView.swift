//
//  SearchView.swift
//  Raon
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
    @Binding var contents: [ProgramContentModel]
    @Binding var themeColor: ThemeColors
    @Binding var searchPath: [DestinationPath]

    // MARK: - Body
    var body: some View {
        NavigationStack(path: $searchPath) {
            ScrollViewReader { proxy in
                List {
                    EmptyView()
                        .id("firstView")
                    ForEach(getFilteredContents(), id: \.title) { content in
                        NavigationLink(value: DestinationPath.detail(content)) {
                            SearchCardView(content: content)
                        }
                    }
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationBarSmallTitleView(
                            titleText: "검색",
                            themeColor: themeColor)
                    }

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
                .navigationDestination(for: DestinationPath.self, destination: { destination in
                    if case .detail(let content) = destination {
                        ProgramDetailView(themeColor: $themeColor, content: content)
                    }
                })
                .searchable(
                    text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "프로그램명을 입력해주세요")
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
    private func getFilteredContents() -> [ProgramContentModel] {
        if searchText.isEmpty {
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
        } else {
            contents.filter { $0.title.localizedStandardContains(searchText) }
        }
    }
}

#Preview {
    SearchView(
        contents: .constant(NetworkManager().contents),
        themeColor: .constant(.pink),
        searchPath: .constant([]))
}
