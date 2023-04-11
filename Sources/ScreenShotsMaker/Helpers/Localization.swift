//
//  Localization.swift
//  ScreenShotsMaker
//
//  Created by Cedric Pugnaire on 11/04/2023.
//

import Foundation

public struct Localization {
    public let locale: String
    public let title: String
    
    public init(locale: String, title: String) {
        self.locale = locale
        self.title = title
    }
}
