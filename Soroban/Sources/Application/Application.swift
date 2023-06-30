//
//  Application.swift
//  Soroban
//
//  Created by Tam Nguyen on 30/06/2023.
//

import UIKit

final class Application {
    
    private let preferredLanguage = NSLocale.preferredLanguages[0]
    
    private let factory: SceneFactoryProtocol
    
    private init(factory: SceneFactoryProtocol) {
        self.factory = factory
    }
    
    func getLanguage() -> Language {

        if preferredLanguage == "vi-US" {
            return .vietnamese
        } else {
            return .english
        }
    }
}

// MARK: - Singleton

extension Application {
    
    static let shared: Application = {
        return Application(
            factory: DIContainer(
                storage: Storage()
            )
        )
    }()
}
