//
//  PlayerStat.swift
//  NBAFantazyCompagnon
//
//  Created by Dimitri SMITH on 15/11/2021.
//

import Foundation

struct Message: Codable {
    var message: String?
}

struct Team: Codable {
    var id: Int
    var abbreviation: String
    var city: String
    var conference: String
    var division: String
    var full_name: String
    var name: String
}
