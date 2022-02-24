//
//  CountriesHomeView.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 23.02.2022.
//

import UIKit

final class CountriesHomeView: UIView {
    
    private(set) lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = Constants.Colors.appLightGray
        cv.register(CountryCell.self, forCellWithReuseIdentifier: Constants.CellIdentifiers.countyCellId)
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetupView
extension CountriesHomeView {
    private func setupView() {
        backgroundColor = Constants.Colors.appLightGray
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
