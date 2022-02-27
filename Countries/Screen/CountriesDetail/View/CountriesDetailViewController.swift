//
//  CountriesDetailViewController.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 23.02.2022.
//

import UIKit

final class CountriesDetailViewController: UIViewController {
    
    private let countriesDetailView = CountriesDetailView()
    var viewModel = CountryDetailViewModel()
    
    override func loadView() {
        super.loadView()
        self.view = countriesDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        fetchDetail()
        view.backgroundColor = Constants.Colors.appLightGray
        navigationItem.rightBarButtonItem = countriesDetailView.navigationBarButton
        navigationItem.rightBarButtonItem?.tintColor = Constants.Colors.unSaved
        viewModel.retrieveData()
        updateFavorite()
        countriesDetailView.updateButtonStatus(isSelected: viewModel.savedCountries.keys.contains(viewModel.countryCode))
    }
    
    func fetchDetail() {
        viewModel.fetchCountryDetails(countryCode: viewModel.countryCode) { [weak self] in
            guard let self = self else { return }
            self.countriesDetailView.updateUI(countryDetail: self.viewModel.countryDetail!)
        } failure: { error in
            self.showAlert(alertText: "Hata", alertMessage: error.description)
        }
    }
    
    func updateFavorite() {
        countriesDetailView.tappedFavorite = { [weak self] country in
            guard let self = self else { return }
            self.viewModel.addToFavorites(savedCountry: country)
            self.countriesDetailView.updateButtonStatus(isSelected: self.viewModel.savedCountries.keys.contains(self.viewModel.countryCode))
        }
    }
}
