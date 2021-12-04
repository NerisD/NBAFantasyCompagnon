//
//  DraftDataAPI.swift
//  NBAFantazyCompagnon
//
//  Created by Dimitri SMITH on 04/12/2021.
//

import Foundation

struct DraftDataAPI: Codable {
    var teamId: String
    var pickNum: String
    var roundNum: String
    var seasonYear: String 
}
