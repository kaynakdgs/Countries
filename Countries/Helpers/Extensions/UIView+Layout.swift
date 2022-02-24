//
//  UIView+Layout.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 23.02.2022.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...){
        views.forEach({
            self.addSubview($0)
        })
    }
}
