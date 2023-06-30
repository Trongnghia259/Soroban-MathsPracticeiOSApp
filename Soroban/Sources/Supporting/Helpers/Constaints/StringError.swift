//
//  StringError.swift
//  Soroban
//
//  Created by Tam Nguyen on 30/06/2023.
//

import Foundation

enum StringError: LocalizedError, Equatable {
    case generic

    var errorDescription: String? {
        switch self {
        case .generic: return Localization.Error.general.localized
        }
    }
}
