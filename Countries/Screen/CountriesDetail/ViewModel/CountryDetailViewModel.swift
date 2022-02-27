//
//  CountryDetailViewModel.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 25.02.2022.
//

import Foundation

final class CountryDetailViewModel {
    
    let userDefaults = UserDefaults.standard
    var countryDetail: CountryDetail?
    
    var savedCountries: [String:[String]] = [:]
    var countryCode: String = ""
    
    func retrieveData() {
        if let savedData = userDefaults.dictionary(forKey: Constants.Keys.isFavorite) as? [String:[String]] {
            savedCountries = savedData
        }
    }
    
    func addToFavorites(savedCountry: CountryDetail) {
        if let code = savedCountry.code {
            if savedCountries.keys.contains(code) {
                savedCountries.removeValue(forKey: code)
                userDefaults.set(savedCountries, forKey: Constants.Keys.isFavorite)
            } else {
                savedCountries[code] = [savedCountry.name ?? ""]
                userDefaults.set(savedCountries, forKey: Constants.Keys.isFavorite)
            }
        }
    }
    
    func fetchCountryDetails(countryCode: String, success: @escaping() -> Void, failure: @escaping(String) -> Void) {
        ApiWorker.shared.getDetail(countryCode: countryCode) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let details):
                guard let detail = details.data else { return }
                self.countryDetail = detail
                DispatchQueue.main.async {
                    success()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    failure(error.localizedDescription)
                }
            }
        }
    }
}
