//
//  ContentView.swift
//  Pokedex
//
//  Created by Lucas Hollas on 26/11/22.
//

import SwiftUI

struct ContentView: View {
    var pokemonModel = PokemonModel()
    @State private var pokemon = [Pokemon]()
    
    var body: some View {
        NavigationView {
            List(pokemon) { poke in

            }
        }
        .navigationTitle("Pokemon")
        .onAppear {
            async {
                pokemon = try! await pokemonModel.getPokemon()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
