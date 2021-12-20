//
//  HomeModel.swift
//  StoneChallenge
//
//  Created by Raileny Santana Lima on 17/12/21.
//

import Foundation

struct HomeModel: Codable {
    
    let results: [CharactersModel]?
    
}

struct CharactersModel: Codable {
    var id: Int?
    var name: String?
    var image: String?
    var status: String?
    var species: String?
    var gender: String?
    var type: String?
}
