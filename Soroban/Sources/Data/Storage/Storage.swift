//
//  Storage.swift
//  Soroban
//
//  Created by Tam Nguyen on 30/06/2023.
//

import Foundation

protocol StorageProtocol {
    func getObject<T: Decodable>(_ value: T.Type, for key: StorageKey) throws -> T?
    func setStringValue(_ value: String, for key: StorageKey)
    func getStringValue(for key: StorageKey) -> String?
}

struct Storage: StorageProtocol {
    
    private let userDefaults = UserDefaults.standard
    
    func getObject<T: Decodable>(_ value: T.Type, for key: StorageKey) throws -> T? {
        guard let data = userDefaults.data(forKey: key.rawValue) else { throw StringError.generic }
        let decoder = JSONDecoder()
        do {
            let object = try decoder.decode(value, from: data)
            return object
        } catch {
            throw StringError.generic
        }
    }
    
    func setStringValue(_ value: String, for key: StorageKey) {
        userDefaults.set(value, forKey: key.rawValue)
    }

    func getStringValue(for key: StorageKey) -> String? {
        return userDefaults.string(forKey: key.rawValue)
    }
}
