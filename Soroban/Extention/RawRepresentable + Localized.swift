//
//  RawRepresentable + Localized.swift
//  Soroban
//
//  Created by Tam Nguyen on 30/06/2023.
//

import Foundation
//
extension RawRepresentable where RawValue == String {

    var localized: String {
        let currentLanguage = Application.shared.getLanguage()
        guard let path = currentLanguage.path, let bundle = Bundle(path: path) else {
                    var result = Bundle.main.localizedString(forKey: rawValue, value: nil, table: nil)
                    if result == rawValue {
                        result = Bundle.main.localizedString(forKey: rawValue, value: nil, table: "Default")
                    }
                    return result
                }
            return bundle.localizedString(forKey: rawValue, value: rawValue, table: "")
    }

    func localized(with arguments: CVarArg...) -> String {
        return String(format: localized, locale: .current, arguments: arguments)
    }
}
