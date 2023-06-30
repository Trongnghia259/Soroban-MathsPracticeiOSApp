//
//  UiView.swift
//  Soroban
//
//  Created by Tam Nguyen on 30/06/2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach(addSubview)
    }
}
