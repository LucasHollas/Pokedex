//
//  ContentView.swift
//  Pokedex
//
//  Created by Lucas Hollas on 26/11/22.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    var pokemonModel = PokemonViewModel()
    @State private var pokemon = [Pokemon]()
    
    var body: some View {
        NavigationView {
            List(pokemon) { poke in
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(poke.name.capitalized)
                            .font(.title)
                        HStack{
                            Text(poke.type.capitalized)
                                .italic()
                            Circle()
                                .foregroundColor(poke.typeColor)
                                .frame(width: 10, height: 10)
                        }
                        Text(poke.description)
                            .font(.caption)
                            .lineLimit(2)
                    }
                    
                    Spacer()
                    
                    KFImage(URL(string: poke.imageURL))
                        .interpolation(.none)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                }
                
            }
            .navigationTitle("Pokemon")
        }

        .onAppear {
            Task.init {
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
