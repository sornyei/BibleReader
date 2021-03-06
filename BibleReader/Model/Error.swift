//
//  Error.swift
//  BibleReader
//
//  Created by Gabor Sornyei on 2020. 02. 20..
//  Copyright © 2020. Gabor Sornyei. All rights reserved.
//

import Foundation

enum BibleError: Error, CustomStringConvertible, Identifiable {
    var id: String {
        self.description
    }
    
    case network, parsing, translating(String), unknown
    
    var description: String {
        switch self {
        case .network:
            return "Kapcsolódási hiba"
        case .parsing:
            return "Konvertálási hiba"
        case .translating(let book):
            return "Ez a fordítás nem tartalmazza: \"\(book)\""
        case .unknown:
            return "Ismeretlen hiba"
        }
    }
}
