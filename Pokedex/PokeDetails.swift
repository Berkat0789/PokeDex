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
            //
        }
        
        pokeimage.image = UIImage(named: "\(pokeDetail.pokemonID)")
        pokeName.text = pokeDetail.pokemonName
        

    }

  

  

}
