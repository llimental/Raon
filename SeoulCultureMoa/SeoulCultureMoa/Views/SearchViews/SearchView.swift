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

    // MARK: - @Binding Properties
    @Binding var contents: [ProgramContent]

    var body: some View {
        NavigationStack {
            List {
                if searchText.isEmpty {
                    ForEach(contents, id: \.title) { content in
                        Text(content.title)
                    }
                } else {
                    ForEach(contents.filter { $0.title.localizedStandardContains(searchText) }, id: \.title) { content in
                        Text(content.title)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("검색")
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("", systemImage: "line.3.horizontal.decrease.circle") {

                    }
                }
            }
        }
    }
}

#Preview {
    SearchView(contents: .constant(NetworkManager().contents))
}
