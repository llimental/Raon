//
//  ProgramData.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 1/28/24.
//

import Foundation

struct ProgramData: Decodable {
    let programInfo: ProgramInfo

    enum CodingKeys: String, CodingKey {
        case programInfo = "culturalEventInfo"
    }
}

struct ProgramInfo: Decodable {
    let totalCount: Int
    let programContents: [ProgramContent]

    enum CodingKeys: String, CodingKey {
        case totalCount = "list_total_count"
        case programContents = "row"
    }
}

struct ProgramContent: Decodable {
    let category: String
    let region: String
    let title: String
    let place: String
    let organization: String
    let target: String
    let fees: String
    let url: String
    let imageURL: String
    let startDate: String
    let endDate: String
    let longitude: String
    let latitude: String
    let isFree: String

    enum CodingKeys: String, CodingKey {
        case category = "CODENAME"
        case region = "GUNAME"
        case title = "TITLE"
        case place = "PLACE"
        case organization = "ORG_NAME"
        case target = "USE_TRGT"
        case fees = "USE_FEE"
        case url = "ORG_LINK"
        case imageURL = "MAIN_IMG"
        case startDate = "STRTDATE"
        case endDate = "END_DATE"
        case longitude = "LAT"
        case latitude = "LOT"
        case isFree = "IS_FREE"
    }
}

/// SwiftData 모델에서는 CodingKey 요소가 오류를 유발하여 별도의 매칭 구조체 사용
struct ProgramContentModel: Codable {
    let category: String
    let region: String
    let title: String
    let place: String
    let organization: String
    let target: String
    let fees: String
    let url: String
    let imageURL: String
    let startDate: String
    let endDate: String
    let longitude: String
    let latitude: String
    let isFree: String
}
