//
//  FavoriteProgram.swift
//  Raon
//
//  Created by Lust3r on 3/12/24.
//

import SwiftData

@Model
final class FavoriteProgram {
    // MARK: - @Attribute Property
    @Attribute(.unique) var title: String

    // MARK: - Public Properties
    var content: ProgramContentModel

    // MARK: - Initializer
    init(title: String, content: ProgramContentModel) {
        self.title = title
        self.content = content
    }
}
