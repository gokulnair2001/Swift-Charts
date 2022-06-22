//
//  ContentView.swift
//  Swift-Charts
//
//  Created by Gokul Nair on 20/06/22.
//

import SwiftUI
import Charts

struct Pizzas: Identifiable {
    let name: String
    let sales: Int
    
    var id: String {name}
}

let sales: [Pizzas] = [
    .init(name: "Nepoli", sales: 450),
    .init(name: "Pesto", sales: 100),
    .init(name: "Alfredo", sales: 250),
    .init(name: "Dip Dish", sales: 300)
]

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Chart (sales) { element in
                BarMark (
                    x: .value("Name", element.name),
                    y: .value("Sales", element.sales)
                )
            }
            
            .navigationTitle("Swift")
            
        }.frame(height: 500)
            .padding(5)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
