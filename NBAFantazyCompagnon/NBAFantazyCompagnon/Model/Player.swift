//
//  Player.swift
//  NBAFantazyCompagnon
//
//  Created by Dimitri SMITH on 16/11/2021.
//

import Foundation

struct Player: Codable {
    var id: Int
    var first_name: String
    var height_feet: Int?
    var height_inches: Int?
    var last_name: String
    var position: String
    var team: Team
    var weight_pounds: Int?
}
