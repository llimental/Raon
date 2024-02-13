//
//  Categories.swift
//  SeoulCultureMoa
//
//  Created by Lust3r on 2/13/24.
//

import Foundation

enum Categories: String, CaseIterable, Identifiable {
    case allCategory = "전체보기"
    case education = "교육/체험"
    case traditionalMusic = "국악"
    case etc = "기타"
    case solo = "독주/독창회"
    case dancing = "무용"
    case musical = "뮤지컬/오페라"
    case play = "연극"
    case movie = "영화"
    case art = "전시/미술"
    case concert = "콘서트"
    case classic = "클래식"
    case festivalEtc = "축제-기타"
    case festivalArt = "축제-문화/예술"
    case festivalHarmony = "축제-시민화합"
    case festivalNatural = "축제-자연/경관"
    case festivalTradition = "축제-전통/역사"

    var id: Self { self }
}
