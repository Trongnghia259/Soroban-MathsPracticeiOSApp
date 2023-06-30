//
//  DIContainer.swift
//  Soroban
//
//  Created by Tam Nguyen on 30/06/2023.
//
protocol UseCaseFactoryProtocol {
}

protocol SceneFactoryProtocol: UseCaseFactoryProtocol {}

struct DIContainer {
    
    private let storage: StorageProtocol

    init(
        storage: StorageProtocol
    ) {
        self.storage = storage
    }
    
    func userStorageRepository() -> UserStorageRepositoryProtocol {
        UserStorageRepository(storage: storage)
    }
    
}
extension DIContainer: SceneFactoryProtocol {
    func settingsUseCase() -> SettingsUseCaseProtocol {
        SettingsUseCase(userStorageRepository: userStorageRepository())

    }
}
