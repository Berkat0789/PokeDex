//
//  PokeCell.swift
//  Pokedex
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    
    @IBOutlet weak var pokeimage: UIImageView!
    @IBOutlet weak var pokeID: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 4.0
    }
    
    
    
    //funct toupdate cell 
    
    func UpdateCell(_ pokemon: Pokemon) {
        pokeimage.image = UIImage(named: "\(pokemon.pokemonID)")
        pokeID.text = pokemon.pokemonName
    }
    
}
