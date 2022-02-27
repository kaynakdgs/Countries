//
//  Request.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 25.02.2022.
//

import Foundation

class ApiWorker {
    
    static let shared: ApiWorker = {
        let instance = ApiWorker()
        return instance
    }()
    
    func getData(completionHandler: @escaping (Results<CountriesHomeList>) -> ()) {
        NetworkManager.shared.request(Router.getCountries, decodeToType: CountriesHomeList.self, completionHandler: completionHandler)
    }
    
    func getDetail(countryCode:String, completionHandler: @escaping (Results<CountriesDetailModel>) -> ()) {
        NetworkManager.shared.request(Router.getDetail(countryCode: countryCode), decodeToType: CountriesDetailModel.self, completionHandler: completionHandler)
    }
}
