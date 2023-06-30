//
//  Localization.swift
//  Soroban
//
//  Created by Tam Nguyen on 30/06/2023.
//

import Foundation

// swiftline:disable file_length
final class Localization {}

// MARK: - Title
extension Localization {
    enum Title: String {
        case mathsOperations = "title_mathoperations"
        case setting = "title_setting"
    }
}
// MARK: - Setting

extension Localization {
    enum Setting: String {
        case title = "setting_title"
        case numbera = "setting_numbera"
        case numberb = "setting numberb"
        case from = "setting_from"
        case to = "setting_to"
        case slow = "setting_speed_slow"
        case normal = "setting_speed_normal"
        case fast = "setting_speed_fast"
        case veryfast = "setting_speed_veryfast"
        case speed = "setting_speed"
        case calculations = "setting_speed_calculations"
        case langEnglish = "language_english"
        case langVietnamese = "language_vietnamese"
    }
}

// MARK: - Button

extension Localization {
    enum Button: String {
        case start = "button_start"
        case finish = "button_finish"
        case confirm = "button_confirm"
    }
}

// MARK: - Error

extension Localization {

    enum Error: String {
        case general = "msg_error_some_thing_went_wrong"
        case accountExists = "msg_error_account_exists"
        case noInternet = "msg_error_no_internet"
    }
}
