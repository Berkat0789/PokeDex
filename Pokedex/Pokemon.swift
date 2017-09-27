//
//  Pokemon.swift
//  Pokedex
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _pokemonName: String!
    private var _pokemonID: Int!
    private var _pokeDescription: String!
    private var _pokeHeight: Int!
    private var _pokeWeight: Int!
    private var _pokeAttack: Int!
    private var _pokeDefense: Int!
    private var _pokeSpeed: Int!
    private var _pokeType: String!
    private var _pokeURL: String!
    
    
    
    
    var pokemonName: String{
        if _pokemonName == nil {
            _pokemonName = ""
        }
        return _pokemonName
    }
    
    
    
    var pokemonID: Int {
        if _pokemonID == nil {
            _pokemonID = 0
        }
        return _pokemonID
    }
    
    
    var pokeDescription: String {
        if _pokeDescription == nil {
            _pokeDescription = ""
        }
        return _pokeDescription
    }
    
    var pokeHeight: Int {
        if _pokeHeight == nil {
            _pokeHeight = 0
        }
        return _pokeHeight
    }
    
    var PokeWeight: Int {
        if _pokeWeight == nil {
            _pokeWeight = 0
        }
        return _pokeWeight
    }
    
    var pokeAttack: Int {
        if _pokeAttack == nil {
            _pokeAttack = 0
        }
        return _pokeAttack
    }
    var pokeDefense: Int {
        if _pokeDefense == nil {
            _pokeDefense = 0
        }
        return _pokeDefense
    }
    
    var pokeSpeed: Int {
        if _pokeSpeed == nil {
            _pokeSpeed = 0
        }
        return _pokeSpeed
    }
    var pokeType: String {
        if _pokeType == nil {
            _pokeType = ""
        }
        return _pokeType
    }

    
    init(pokemonName: String, pokemonID: Int) {
        _pokemonID = pokemonID
        _pokemonName = pokemonName
        
        self._pokeURL = "\(pokebaseURL)\(pokeURL)\(self.pokemonID)/"
    }
    
///---Func to download APi Data---///
    func downloadPokeData(complete: @escaping downloadComplete) {
        
        Alamofire.request(_pokeURL).responseJSON{ response in
            let result = response.result
            
               print(response)
            
            if let Dict = result.value as? Dictionary<String, AnyObject> {
                
                
            }//end if let dict
            
        }//end alamorequest
    }//end func
    
    
    
    
    
}//end class
