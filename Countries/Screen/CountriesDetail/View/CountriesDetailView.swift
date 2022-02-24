//
//  CountriesDetailView.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 23.02.2022.
//

import UIKit

final class CountriesDetailView: UIView {
    
    private lazy var countryFlagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "Flag-Turkey")
        return imageView
    }()
    
    private lazy var countryCodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.textColor = Constants.Colors.appDark
        label.text = "Country Code: TR"
        return label
    }()
    
    private lazy var linkedView: UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Colors.appPurple
        return view
    }()
    
    private lazy var linkLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.backgroundColor = .clear
        label.textColor = Constants.Colors.whiteColor
        label.text = "For Move Information"
        return label
    }()
    
    private lazy var linkImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "arrow.right")
        imageView.tintColor = Constants.Colors.whiteColor
        return imageView
    }()
    
    lazy var navigationBarButton: UIBarButtonItem = {
        var button = UIBarButtonItem()
        button = .init(image: UIImage(systemName: "star.fill"), style: .done, target: self, action: #selector(self.favoriteButtonTapped))
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        gestureConfig()
    }
    
    func updateUI() {
        
    }
    
    private func gestureConfig() {
        let wikiDataGesture = UITapGestureRecognizer(target: self, action: #selector(wikiDataLink(tapGesture:)))
        wikiDataGesture.numberOfTapsRequired = 1
        wikiDataGesture.numberOfTouchesRequired = 1
        
        linkedView.addGestureRecognizer(wikiDataGesture)
        linkedView.isUserInteractionEnabled = true
    }
    
    @objc
    func wikiDataLink(tapGesture: UITapGestureRecognizer) {
        UIApplication.shared.open(URL(string: "https://www.wikidata.org/wiki/Q30")! as URL, options: [:], completionHandler: nil)
    }
    
    @objc func favoriteButtonTapped(sender: UIButton) {
        navigationBarButton.tintColor = navigationBarButton.tintColor == Constants.Colors.unSaved ? Constants.Colors.appDark : Constants.Colors.unSaved
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - SetupView
extension CountriesDetailView {
    private func setupView() {
        backgroundColor = Constants.Colors.appLightGray
        addSubviews(countryFlagImageView, countryCodeLabel, linkedView)
        linkedView.addSubviews(linkLabel, linkImageView)
        
        [countryFlagImageView,
         countryCodeLabel,
         linkedView,
         linkLabel,
         linkImageView].forEach { (view) in
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            countryFlagImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12.0),
            countryFlagImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countryFlagImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countryFlagImageView.heightAnchor.constraint(equalToConstant: 300.0),
            
            countryCodeLabel.topAnchor.constraint(equalTo: countryFlagImageView.bottomAnchor, constant: 18.0),
            countryCodeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18.0),
            
            linkedView.topAnchor.constraint(equalTo: countryCodeLabel.bottomAnchor, constant: 12.0),
            linkedView.leadingAnchor.constraint(equalTo: countryCodeLabel.leadingAnchor),
            linkedView.heightAnchor.constraint(equalToConstant: 30.0),
            
            linkLabel.topAnchor.constraint(equalTo: linkedView.topAnchor),
            linkLabel.leadingAnchor.constraint(equalTo: linkedView.leadingAnchor, constant: 12.0),
            linkLabel.bottomAnchor.constraint(equalTo: linkedView.bottomAnchor),
            linkLabel.trailingAnchor.constraint(equalTo: linkImageView.leadingAnchor, constant: -4.0),
            
            linkImageView.topAnchor.constraint(equalTo: linkedView.topAnchor, constant: 6.0),
            linkImageView.trailingAnchor.constraint(equalTo: linkedView.trailingAnchor, constant: -8.0),
            linkImageView.bottomAnchor.constraint(equalTo: linkedView.bottomAnchor, constant: -6.0),
            linkImageView.widthAnchor.constraint(equalTo: linkImageView.heightAnchor)
        ])
    }
}
