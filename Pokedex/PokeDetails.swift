//
//  PokeDetails.swift
//  Pokedex
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import UIKit

class PokeDetails: UIViewController {
    
    
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeimage: UIImageView!
    @IBOutlet weak var pokeDescription: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var attack: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var weight: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var defense: UILabel!
    @IBOutlet weak var pokeEvolution: UILabel!
    
    //---getter and setter to pass data 
    
    private var _pokeDetail: Pokemon!
    
    var pokeDetail: Pokemon {
        get{
            return _pokeDetail
        } set {
            _pokeDetail = newValue
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokeDetail.downloadPokeData {
            self.updateDetails()
        }
        
        pokeimage.image = UIImage(named: "\(pokeDetail.pokemonID)")
        pokeName.text = pokeDetail.pokemonName
    }//end view did load
    
    func updateDetails() {
        
        type.text = pokeDetail.pokeType
        defense.text = "\(pokeDetail.pokeDefense)"
        attack.text = "\(pokeDetail.pokeAttack)"
        weight.text = pokeDetail.PokeWeight
        height.text = pokeDetail.pokeHeight
        speed.text = "\(pokeDetail.pokeSpeed)"
        pokeEvolution.text = "\(pokeDetail.pokemonName) will evolve at Level \(pokeDetail.pokeEvo)"
        
    }
  

  

}
