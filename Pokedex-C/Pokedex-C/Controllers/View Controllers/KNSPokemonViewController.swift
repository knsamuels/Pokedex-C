//
//  KNSPokemonViewController.swift
//  Pokedex-C
//
//  Created by Kristin Samuels  on 6/23/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class KNSPokemonViewController: UIViewController {

    // Mark: Outlets
    @IBOutlet var pokeSearchBar: UISearchBar!
    @IBOutlet var pokeImageView: UIImageView!
    @IBOutlet var pokeNameLabel: UILabel!
    @IBOutlet var pokeIDLabel: UILabel!
    @IBOutlet var pokeAbilitiesLabel: UILabel!
    
    //Mark: Lifecycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeSearchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDefaultPokemon()
    }
    
    // Mark: - Methods
    func fetchSpriteAndUpdateViews(pokemon: KNSPokemon) {
        KNSPokemonController.fetchImage(for: pokemon) { (image) in
            DispatchQueue.main.async {
                self.pokeImageView.image = image
                self.pokeNameLabel.text = pokemon.name.capitalized
                self.pokeIDLabel.text = "ID: \(pokemon.identifier)"
                self.pokeAbilitiesLabel.text = "Abilities: \(pokemon.abilities.joined(separator: ", "))"
            }
        }
    }
    
    func fetchDefaultPokemon() {
        KNSPokemonController.fetchPokemon(forSearchTerm: "25") { (pokemon) in
            self.fetchSpriteAndUpdateViews(pokemon: pokemon)
        }
    }
}

// Mark- SearchBar Delegate Extension
extension KNSPokemonViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let searchTerm = searchBar.text, !searchTerm.isEmpty else {return}
        KNSPokemonController.fetchPokemon(forSearchTerm: searchTerm) { (pokemon) in
            self.fetchSpriteAndUpdateViews(pokemon: pokemon)
        }
    }
}
