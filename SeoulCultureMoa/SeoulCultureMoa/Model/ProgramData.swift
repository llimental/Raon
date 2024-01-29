//
//  ProgramData.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/28/24.
//

import Foundation

struct ProgramData: Decodable {
    let programEvent: ProgramEvent

    enum CodingKeys: String, CodingKey {
        case programEvent = "culturalEventInfo"
    }
}

struct ProgramEvent: Decodable {
    let totalCount: Int
    let contents: [Content]

    enum codingKeys: String, CodingKey {
        case totalCount = "list_total_count"
        case contents = "row"
    }
}

struct Content: Decodable {
    let category: String
    let region: String
    let title: String
    let place: String
    let organization: String
    let target: String
    let fees: String
    let player: String
    let description: String
    let etc: String
    let url: String
    let imageURL: String
    let registDate: String
    let startDate: String
    let endDate: String
    let longitude: String
    let latitude: String
    let isFree: String

    enum codingKeys: String, CodingKey {
        case category = "CODENAME"
        case region = "GUNAME"
        case title = "TITLE"
        case place = "PLACE"
        case organization = "ORG_NAME"
        case target = "USE_TRGT"
        case fees = "USE_FEE"
        case player = "PLAYER"
        case description = "PROGRAM"
        case etc = "ETC_DESC"
        case url = "ORG_LINK"
        case imageURL = "MAIN_IMG"
        case registDate = "RGSTDATE"
        case startDate = "STRTDATE"
        case endDate = "END_DATE"
        case longitude = "LOT"
        case latitude = "LAT"
        case isFree = "IS_FREE"
    }
}
