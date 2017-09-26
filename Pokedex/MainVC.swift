//
//  MainVC.swift
//  Pokedex
//
//  Created by berkat bhatti on 9/26/17.
//  Copyright © 2017 The knight Market. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //--Arrays--//
    
    var Pokelist = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        ParseCSV()
        
    }//end view did load
    
    
    
///--- function to parse pokeon CSV
    
    func ParseCSV() {
        
        let csvPath = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        
        do{
            let Path = try CSV(contentsOfURL: csvPath)
            let Row = Path.rows
            print(Row)
            
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
        return Pokelist.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell {
            
            let pokemon = Pokelist[indexPath.row]
            cell.UpdateCell(pokemon)
            
            return cell
            
        }else {
        return UICollectionViewCell()
        }
    }

 


}//end MainVC
