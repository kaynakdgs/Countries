//
//  CountryCell.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 24.02.2022.
//

import UIKit

final class CountryCell: UICollectionViewCell {
    
    private lazy var countryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.textColor = Constants.Colors.appDark
        label.text = "Turkey"
        return label
    }()
    
    let favoriteButton = UIButton(frame: CGRect(x: 0,
                                                y: 0,
                                                width: 30,
                                                height: 30))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupButton()
    }
    
    func updateUI() {
        
    }
    
    private func setupButton() {
        favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        favoriteButton.imageView?.tintColor = Constants.Colors.unSaved
        favoriteButton.backgroundColor = Constants.Colors.appLightGray
    }
    
    private func setupUI() {
        contentView.layer.cornerRadius = 9.1
        contentView.layer.borderWidth = 2.0
        contentView.layer.borderColor = Constants.Colors.appDark.cgColor
        contentView.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetupView
extension CountryCell {
    private func setupView() {
        backgroundColor = Constants.Colors.appLightGray
        contentView.addSubviews(countryNameLabel, favoriteButton)
        
        [countryNameLabel, favoriteButton].forEach { (view) in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setupUI()
        
        NSLayoutConstraint.activate([
            countryNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            countryNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12.0),
            countryNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            favoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12.0),
            favoriteButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
