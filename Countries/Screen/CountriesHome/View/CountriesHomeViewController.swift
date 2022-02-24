//
//  CountriesHomeViewController.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 23.02.2022.
//

import UIKit

final class CountriesHomeViewController: UIViewController {
    
    private let countriesHomeView = CountriesHomeView()
    var viewModel = CountriesHomeViewModel()
    
    override func loadView() {
        super.loadView()
        self.view = countriesHomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationController()
        view.backgroundColor = Constants.Colors.appLightGray
    }
    
    @objc func favoriteButtonTapped(sender: UIButton) {
        sender.imageView?.tintColor = sender.imageView?.tintColor == Constants.Colors.unSaved ? Constants.Colors.appDark : Constants.Colors.unSaved
    }
    
    private func setupCollectionView() {
        countriesHomeView.collectionView.delegate = self
        countriesHomeView.collectionView.dataSource = self
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
extension CountriesHomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let countryCell: CountryCell = collectionView.dequeueCell(withReuseIdentifier: Constants.CellIdentifiers.countyCellId, for: indexPath)
        
        countryCell.favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        return countryCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = CountriesDetailViewController()
        vc.navigationItem.title = "Turkey"
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