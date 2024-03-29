//
//  CountriesHomeViewModel.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 23.02.2022.
//

import UIKit

final class CountriesHomeViewModel {
    
    let userDefaults = UserDefaults.standard
    var countryList: [Country] = []
    var savedCountries: [String:[String]] = [:]
    
    var numberOfItems: Int {
        return countryList.count
    }
    
    func getItem(at index: Int) -> Country {
        return countryList[index]
    }
    
    func retrieveData() {
        if let savedData = userDefaults.dictionary(forKey: Constants.Keys.isFavorite) as? [String:[String]] {
            savedCountries = savedData
        }
    }
    
    func addToFavorites(savedCountry: Country) {
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
    
    func fetchData(success: @escaping() -> Void, failure: @escaping(String) -> Void) {
        ApiWorker.shared.getData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let countries):
                guard let country = countries.data else { return }
                self.countryList = country
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
