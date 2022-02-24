//
//  CountriesDetailViewController.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 23.02.2022.
//

import UIKit

final class CountriesDetailViewController: UIViewController {
    
    private let countriesDetailView = CountriesDetailView()
    
    override func loadView() {
        super.loadView()
        self.view = countriesDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.Colors.appLightGray
        navigationItem.rightBarButtonItem = countriesDetailView.navigationBarButton
        navigationItem.rightBarButtonItem?.tintColor = Constants.Colors.unSaved
    }
    
    
}
