//
//  SettingsUseCase.swift
//  Soroban
//
//  Created by Tam Nguyen on 30/06/2023.
//

protocol SettingsUseCaseProtocol {
    
    func getSettings() -> SettingsModel?

}

struct SettingsUseCase: SettingsUseCaseProtocol {
    
    private let userStorageRepository: UserStorageRepositoryProtocol
    
    init(userStorageRepository: UserStorageRepositoryProtocol) {
        self.userStorageRepository = userStorageRepository
    }
    
    func getSettings() -> SettingsModel? {
        userStorageRepository.getSettings()
    }
    
}
