//
//  CountriesSavedViewModel.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 27.02.2022.
//

import Foundation

final class CountriesSavedViewModel {
    
    let userDefaults = UserDefaults.standard
    var countryList: [Country] = []
    var savedCountries: [String:[String]] = [:]
    var savedCountryList: [Country] = []
    
    var numberOfItems: Int {
        return savedCountryList.count
    }
    
    func getItem(at index: Int) -> Country {
        return savedCountryList[index]
    }
    
    func getSaved() {
        savedCountryList = []
        for savedCountry in countryList {
            if savedCountries.keys.contains(savedCountry.code ?? "") {
                savedCountryList.append(savedCountry)
            }
        }
    }
    
    func retrieveData() {
        if let savedData = userDefaults.dictionary(forKey: Constants.Keys.isFavorite) as? [String:[String]] {
            savedCountries = savedData
        }
    }
    
    func removeFromFavorites(savedCountry: Country) {
        if let code = savedCountry.code {
            savedCountries.removeValue(forKey: code)
            userDefaults.set(savedCountries, forKey: Constants.Keys.isFavorite)
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
