//
//  FavoritesView.swift
//  Raon
//
//  Created by Lust3r on 3/12/24.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    // MARK: - SwiftData Properties
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \FavoriteProgram.content.startDate) private var favoritePrograms: [FavoriteProgram]

    // MARK: - @Binding Properties
    @Binding var themeColor: ThemeColors

    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                NavigationBarLargeTitleView(
                    titleText: "즐겨찾기",
                    themeColor: themeColor)

                List {
                    ForEach(favoritePrograms) { favoriteProgram in
                        NavigationLink {
                            ProgramDetailView(
                                themeColor: $themeColor,
                                content: favoriteProgram.content)
                        } label: {
                            SearchCardView(content: favoriteProgram.content)
                        }
                    }
                    .onDelete(perform: deleteFavoriteProgram)
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
            }
        }
    }

    // MARK: - SwiftData Functions
    private func deleteFavoriteProgram(at offsets: IndexSet) {
        for offset in offsets {
            let favoriteProgram = favoritePrograms[offset]

            withAnimation {
                modelContext.delete(favoriteProgram)

                modelContext.hasChanges ? try? modelContext.save() : ()
            }
        }
    }
}

#Preview {
    FavoritesView(themeColor: .constant(.purple))
        .modelContainer(for: FavoriteProgram.self)
}
