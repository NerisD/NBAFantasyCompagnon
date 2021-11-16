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

/*struct Teams: Codable {
    
    var data: [Team]
}

struct Stats: Codable {
    
    var id: String?
    var ast: String?
    var blk: String?
    var dreb: String?
    var fg3_pct: String?
    var fg3a: String?
    var fg3m: String?
    var fg_pct: String?
    var fga: String?
    var fgm: String?
    var ft_pct: String?
    var fta: String?
    var ftm: String?
    var game: [Game]
    var min: String?
    var oreb: String?
    var pf: String?
    var player: [Player]
    var pts: String?
    var reb: String?
    var stl: String?
    var team: [Team]
    var turnover: String?
}

struct Game: Codable {
    var id: String?
    var date: String?
    var home_team_id: String?
    var home_team_score: String?
    var periode: String?
    var postseason: String?
    var season: String?
    var status: String?
    var time: String?
    var visitor_team_id: String?
    var visitor_team_score: String?
}

struct Player: Codable {
    var id: String?
    var first_name: String?
    var height_feet: String?
    var height_inches: String?
    var last_name: String?
    var position: String?
    //var team: String?
    var weight_pounds: String?
    
    
}*/
