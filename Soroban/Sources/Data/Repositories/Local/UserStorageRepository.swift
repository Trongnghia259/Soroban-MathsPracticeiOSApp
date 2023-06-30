//
//  UserStorageRepository.swift
//  Soroban
//
//  Created by Tam Nguyen on 30/06/2023.
//

struct UserStorageRepository: UserStorageRepositoryProtocol {
    
    private let storage: StorageProtocol
    
    init(storage: StorageProtocol) {
        self.storage = storage
    }
    
    func getSettings() -> SettingsModel? {
        do {
            if let settings = try storage.getObject(SettingsModel.self, for: .settings) {
                return settings
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
}
