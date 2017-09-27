//
//  MainVC.swift
//  Pokedex
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UISearchBarDelegate {
    
    //---Iboutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //variables 
    
    var InSearchMode = false
    
    
    //--Arrays--//
    
    var Pokelist = [Pokemon]()
    var pokemonFiltered = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        
        ParseCSV()
        
    }//end view did load
    
    
    
///--- function to parse pokeon CSV
    
    func ParseCSV() {
        
        let csvPath = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        
        do{
            let Path = try CSV(contentsOfURL: csvPath)
            let Row = Path.rows
            
            //loop csv to parse all pokemon
            
            for pok in Row {
                let Name = pok["identifier"]!
                let pokeID = Int(pok["id"]!)!
                
                let pokemon = Pokemon(pokemonName: Name, pokemonID: pokeID)
                Pokelist.append(pokemon)
            }
            
            
            
        }catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    
 //---parse function ends
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if InSearchMode {
            return pokemonFiltered.count
        } else {
        return Pokelist.count
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var pokemon: Pokemon!
        
        if InSearchMode {
            pokemon = pokemonFiltered[indexPath.row]
        }else {
            pokemon = Pokelist[indexPath.row]
        }
         performSegue(withIdentifier: "toDetail", sender: pokemon)
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PokeDetails {
            if let poke = sender as? Pokemon {
                destination.pokeDetail = poke
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            let pokemon: Pokemon!
            if InSearchMode {
                 pokemon = pokemonFiltered[indexPath.row]
                  cell.UpdateCell(pokemon)
            } else {
                pokemon = Pokelist[indexPath.row]
                cell.UpdateCell(pokemon)
            }
            
            return cell
            
        }else {
        return UICollectionViewCell()
        }
    }
    
//--search func to close keyboard
    
    
//--- search filter function---//
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            InSearchMode = false
            collectionView.reloadData()
        }else {
            InSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            pokemonFiltered = Pokelist.filter({$0.pokemonName.range(of: lower) != nil})
            collectionView.reloadData()
        }
    }

 


}//end MainVC
