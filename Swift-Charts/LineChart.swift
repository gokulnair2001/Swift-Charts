//
//  LineChart.swift
//  Swift-Charts
//
//  Created by Gokul Nair on 22/06/22.
//

import SwiftUI
import Charts

struct Series: Identifiable {
    let city: String
    let sales: [SalesSummary]
    
    var id: String {city}
}

let seriesData: [Series] = [
    .init(city: "New Delhi", sales: newDelhiData),
    .init(city: "Mumbai", sales: mumbaiData),
    .init(city: "Chennai", sales: chennaiData),
    .init(city: "Kolkata", sales: kolkataData)
]

struct LineChart: View {
    
    @State var isOnlyLineChart: Bool = false
    
    var body: some View {
        VStack {
            
            HStack {
                VStack {
                    Text(isOnlyLineChart ? "Line + Point Chart" : "Line Chart")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Sales graph")
                        .font(.callout)
                        .foregroundColor(.black).opacity(0.5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                Toggle(isOn: $isOnlyLineChart.animation()) {
                    Text("")
                }
            }
            
            Chart(seriesData) {series in
                ForEach(series.sales) { element in
                    
                    LineMark(
                        x: .value("Day", element.weekday, unit: .day), y: .value("City", element.sales)
                    ).foregroundStyle(by: .value("City", series.city))
                    
                    
                    if isOnlyLineChart {
                        PointMark(
                            x: .value("Day", element.weekday, unit: .day), y: .value("City", element.sales)
                        )
                        .foregroundStyle(by: .value("City", series.city))
                        .symbol(by: .value("City", series.city))
                    }
                    
                    
                }
            }.frame(height: 350)
            
            Spacer()
            
        }.padding(30)
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        LineChart()
    }
}
