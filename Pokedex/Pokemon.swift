//
//  Pokemon.swift
//  Pokedex
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import Foundation

class Pokemon {
    
    fileprivate var _pokemonName: String!
    fileprivate var _pokemonID: Int!
    
    
    
    
    var pokemonName: String{
        return _pokemonName
    }
    
    
    
    var pokemonID: Int {
        return _pokemonID
    }
    
    
    init(pokemonName: String, pokemonID: Int) {
        _pokemonID = pokemonID
        _pokemonName = pokemonName
    }
    
    
}//end class
