//
//  UICollectionView+Extension.swift
//  Countries
//
//  Created by Doğuş  Kaynak on 23.02.2022.
//

import UIKit

extension UICollectionView {
    
    /// Dequeues and checks UICollectionViewCell with given type and throw errors on type mismatch
    /// - Returns: Dequeued cell
    func dequeueCell<T>(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> T where T: UICollectionViewCell {
        let dequeuedCell = dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        guard let cell = dequeuedCell as? T else {
            fatalError("Wrong cell type")
        }
        
        return cell
    }
}
