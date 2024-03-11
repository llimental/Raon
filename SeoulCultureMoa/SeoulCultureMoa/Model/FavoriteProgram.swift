//
//  FavoriteProgram.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 3/12/24.
//

import SwiftData

@Model
final class FavoriteProgram {
    @Attribute(.unique) var title: String
    var content: ProgramContentModel

    init(title: String, content: ProgramContentModel) {
        self.title = title
        self.content = content
    }
}
