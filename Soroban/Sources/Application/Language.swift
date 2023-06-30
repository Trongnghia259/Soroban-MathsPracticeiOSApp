//
//  Language.swift
//  Soroban
//
//  Created by Tam Nguyen on 30/06/2023.
//

import Foundation

enum Language: String, Codable, CaseIterable {
    case english
    case vietnamese
}

extension Language {
    
    var name: String {
        switch self {
        case .english:
            return Localization.Setting.langEnglish.localized
        case .vietnamese:
            return Localization.Setting.langVietnamese.localized
        }
    }

    var resource: String {
        switch self {
        case .vietnamese:
            return "vi"
        case .english:
            return "en"
        }
    }

    var path: String? { Bundle.main.path(forResource: resource, ofType: "lproj") }

    static func viewModels(current: Language) -> [SelectionItemViewModel] {
        Language.allCases.map {
            SelectionItemViewModel(
                title: $0.name, isSelected: $0 == current
            )
        }
    }

}
