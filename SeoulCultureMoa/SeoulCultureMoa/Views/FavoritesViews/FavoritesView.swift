//
//  FavoritesView.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 3/12/24.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    // MARK: - SwiftData Properties
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \FavoriteProgram.content.startDate) private var favoritePrograms: [FavoriteProgram]

    // MARK: - @State Properties
    @State private var isEditing: Bool = false

    // MARK: - @Binding Properties
    @Binding var themeColor: ThemeColors

    // MARK: - Body
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                NavigationBarLargeTitleView(
                    titleText: "즐겨찾기",
                    themeColor: themeColor)

                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())]) {
                        ForEach(favoritePrograms) { favoriteProgram in
                            NavigationLink {
                                ProgramDetailView(
                                    themeColor: $themeColor,
                                    content: favoriteProgram.content)
                            } label: {
                                ProgramCardView(programImageURL: favoriteProgram.content.imageURL)
                            }
                            .padding()
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        isEditing.toggle()
                    }, label: {
                        isEditing ? Text("완료") : Text("편집")
                    })
                }
            }
        }
    }

    // MARK: - SwiftData Functions
    private func deleteFavoriteProgram(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(favoritePrograms[index])
            }
        }
    }
}

#Preview {
    FavoritesView(themeColor: .constant(.purple))
        .modelContainer(for: FavoriteProgram.self)
}
