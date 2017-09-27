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
    private var _pokeHeight: String!
    private var _pokeWeight: String!
    private var _pokeAttack: Int!
    private var _pokeDefense: Int!
    private var _pokeSpeed: Int!
    private var _pokeType: String!
    private var _pokeURL: String!
    private var _pokeEvo: Int!
    
    
    
    
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
    
    var pokeHeight: String {
        if _pokeHeight == nil {
            _pokeHeight = ""
        }
        return _pokeHeight
    }
    
    var PokeWeight: String {
        if _pokeWeight == nil {
            _pokeWeight = ""
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
    var pokeEvo: Int {
        if _pokeEvo == nil {
            _pokeEvo = 0
        }
        return _pokeEvo
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
                
                if let attack = Dict["attack"] as? Int {
                    self._pokeAttack = attack
                    print(self._pokeAttack)
                }
                
                if let defense = Dict["defense"] as? Int {
                    self._pokeDefense = defense
                    print(self._pokeDefense)
                }
                
                
                if let height  = Dict["height"] as? String {
                    self._pokeHeight = height
                    print(self._pokeHeight)
                }
                
                if let Weight = Dict["weight"] as? String {
                    self._pokeWeight = Weight
                    print(self._pokeWeight)
                }
                
                if let speed = Dict["speed"] as? Int {
                    self._pokeSpeed = speed
                    print(self._pokeSpeed)
                }
                if let type = Dict["types"] as? [Dictionary<String, AnyObject>] {
                    if let name = type[0]["name"] as? String {
                        self._pokeType = name
                        print(self._pokeType)
                    }
                }
                
                if let evolutions = Dict["evolutions"] as? [Dictionary<String, AnyObject>] {
                    
                    if let level = evolutions[0]["level"] as? Int {
                        self._pokeEvo = level
                        print(self._pokeEvo)
                        
                    }
                
                
                }
                
                
                
                
                
                
            }//end if let dict
            complete()
            
        }//end alamorequest
    }//end func
    
    
    
    
    
}//end class
