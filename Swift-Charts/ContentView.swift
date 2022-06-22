//
//  BarView.swift
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

struct BarView: View {
    var body: some View {
        
        VStack {
            
            Text("Bar Graph")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Basic Bar Graph")
                .font(.callout)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Chart (sales) { element in
                BarMark (
                    x: .value("Name", element.name),
                    y: .value("Sales", element.sales)
                )
            }
        }.padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarView()
    }
}
