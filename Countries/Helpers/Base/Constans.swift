//
//  Constans.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 23.02.2022.
//

import UIKit

struct Constants {
    
    struct Colors {
        static let whiteColor = #colorLiteral(red: 0.9999160171, green: 1, blue: 0.9998720288, alpha: 1)
        static let appGray = #colorLiteral(red: 0.5019164681, green: 0.5019901991, blue: 0.5018932819, alpha: 1)
        static let appLightGray = #colorLiteral(red: 0.9489404559, green: 0.9412292838, blue: 0.9410556555, alpha: 1)
        static let appDark = #colorLiteral(red: 0.1019482985, green: 0.1019690707, blue: 0.1019417569, alpha: 1)
        static let unSaved = #colorLiteral(red: 0.8630226844, green: 0.8630226844, blue: 0.8630226844, alpha: 1)
        static let appPurple = #colorLiteral(red: 0.2117708623, green: 0.2510009408, blue: 0.584243536, alpha: 1)
    }
    
    struct CellIdentifiers {
        static let countyCellId: String = "countyCellId"
    }
    
    struct CellHeights {
        static let countryCellHeight: CGFloat = 42.0
    }
    
    struct Keys {
        static let isFavorite: String = "isFavorite"
    }
}
