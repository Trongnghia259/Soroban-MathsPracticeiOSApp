//
//  Ext +.swift
//  Soroban
//
//  Created by Tam Nguyen on 29/06/2023.
//

import Foundation

extension String {
    func localized() -> String {
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: .main,
                                 value: self,
                                 comment: self
        )
    }
}
