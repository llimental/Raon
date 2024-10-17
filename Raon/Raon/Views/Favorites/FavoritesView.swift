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
    @Binding var favoritesPath: [DestinationPath]

    // MARK: - Body
    var body: some View {
        NavigationStack(path: $favoritesPath) {
            VStack(alignment: .leading) {
                NavigationBarLargeTitleView(
                    titleText: "즐겨찾기",
                    themeColor: themeColor)

                List {
                    ForEach(favoritePrograms) { favoriteProgram in
                        NavigationLink(value: DestinationPath.detail(favoriteProgram.content)) {
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
            .navigationDestination(for: DestinationPath.self, destination: { destination in
                if case .detail(let content) = destination {
                    ProgramDetailView(themeColor: $themeColor, content: content)
                }
            })
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
    FavoritesView(
        themeColor: .constant(.purple),
        favoritesPath: .constant([]))
        .modelContainer(for: FavoriteProgram.self)
}
