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

    // MARK: - @Binding Properties
    @Binding var contents: [ProgramContent]

    // MARK: - Body
    var body: some View {
        NavigationStack {
            List {
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
            .listStyle(.plain)
            .navigationTitle("검색")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("SearchFilter", systemImage: "line.3.horizontal.decrease.circle") {
                        isPresented.toggle()
                    }
                    .sheet(
                        isPresented: $isPresented) {
                            Text("필터")
                            .presentationDetents([.height(300)])
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
        }
    }
}

#Preview {
    SearchView(contents: .constant(NetworkManager().contents))
}
