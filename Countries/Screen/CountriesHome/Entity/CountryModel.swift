//
//  CountryModel.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 25.02.2022.
//

import Foundation

struct Country: Codable {
    let code: String?
    let currencyCodes: [String]?
    let name, wikiDataID: String?

    enum CodingKeys: String, CodingKey {
        case code, currencyCodes, name
        case wikiDataID = "wikiDataId"
    }
}
