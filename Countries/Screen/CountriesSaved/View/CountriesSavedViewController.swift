//
//  CountriesSavedViewController.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 23.02.2022.
//

import UIKit

final class CountriesSavedViewController: UIViewController {
    
    private let savedCountriesHomeView = CountriesHomeView()
    var viewModel = CountriesSavedViewModel()
    
    override func loadView() {
        super.loadView()
        self.view = savedCountriesHomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        fetchData()
        setupNavigationController()
        setupCollectionView()
        view.backgroundColor = Constants.Colors.appLightGray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.retrieveData()
        viewModel.getSaved()
        savedCountriesHomeView.collectionView.reloadData()
    }
    
    private func fetchData() {
        viewModel.fetchData { [weak self] in
            guard let self = self else { return }
            self.viewModel.getSaved()
            self.savedCountriesHomeView.collectionView.reloadData()
        } failure: { error in
            self.showAlert(alertText: "Hata", alertMessage: error.description)
        }
    }
    
    private func setupCollectionView() {
        savedCountriesHomeView.collectionView.delegate = self
        savedCountriesHomeView.collectionView.dataSource = self
        savedCountriesHomeView.collectionView.reloadData()
    }
    
    private func setupNavigationController() {
        navigationController?.navigationBar.barTintColor = Constants.Colors.whiteColor
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "arrow.backward")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "arrow.backward")
        navigationController?.navigationBar.tintColor = Constants.Colors.appDark
    }
}

//MARK: - CollectionView Delegate & DataSource & DelegateFlowLayout
extension CountriesSavedViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let countryCell: CountryCell = collectionView.dequeueCell(withReuseIdentifier: Constants.CellIdentifiers.countyCellId, for: indexPath)
        let item = viewModel.getItem(at: indexPath.item)
        countryCell.updateUI(with: item)
        countryCell.updateButtonStatus(isSelected: viewModel.savedCountries.keys.contains(item.code ?? ""))
        countryCell.tappedFavorite = { [weak self] country in
            guard let self = self else { return }
            self.viewModel.removeFromFavorites(savedCountry: country)
            self.viewModel.getSaved()
            self.savedCountriesHomeView.collectionView.reloadData()
        }
        
        return countryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CountriesDetailViewController()
        vc.navigationItem.title = viewModel.savedCountryList[indexPath.item].name
        vc.viewModel.countryCode = viewModel.savedCountryList[indexPath.item].code ?? ""
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width-64
        let height = Constants.CellHeights.countryCellHeight
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 18, left: 0, bottom: 12, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
