//
//  CountriesDetailModel.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 25.02.2022.
//

import Foundation

struct CountriesDetailModel: Codable {
    let data: CountryDetail?
}

// MARK: - CountryDetail
struct CountryDetail: Codable {
    let capital, code, callingCode: String?
    let currencyCodes: [String]?
    let flagImageURI: String?
    let name: String?
    let numRegions: Int?
    let wikiDataID: String?

    enum CodingKeys: String, CodingKey {
        case capital, code, callingCode, currencyCodes
        case flagImageURI = "flagImageUri"
        case name, numRegions
        case wikiDataID = "wikiDataId"
    }
}
