//
//  Utah.swift
//  NBAFantazyCompagnon
//
//  Created by Dimitri SMITH on 04/12/2021.
//

import Foundation

struct Utah: Codable {
    var firstName: String?
    var lastName: String?
    var temporaryDisplayName: String?
    var personId: String?
    var teamId: String?
    var jersey: String?
    var isActive: Bool?
    var pos: String?
    var heightFeet: String?
    var heightInches: String?
    var heightMeters: String?
    var weightPounds: String?
    var weightKilograms: String?
    var dateOfBirthUTC: String?
    var teamSitesOnly: TeamSitesOnly?
    var teams: [TeamDataAPI]?
    var draft: DraftDataAPI?
    var nbaDebutYear: String?
    var yearsPro: String?
    var collegeName: String?
    var lastAffiliation: String?
    var country: String?
    
    
    
}
