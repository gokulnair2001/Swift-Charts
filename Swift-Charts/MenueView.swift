//
//  MenueView.swift
//  Swift-Charts
//
//  Created by Gokul Nair on 22/06/22.
//

import SwiftUI

struct chartViews: Hashable, Identifiable {
    var id = UUID()
    let name: String
}

struct MenueView: View {
    
    let presentableCharts:[chartViews] = [
        .init(name: "Basic Bar Graph"),
        .init(name: "Multiple Bar Graph"),
        .init(name: "Line + Point Graph")
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                List(presentableCharts) { chart in
                    NavigationLink(chart.name, value: chart)
                }
            }
            .navigationTitle("Swift Charts")
            .navigationDestination(for: chartViews.self) { chart in
                nextView(with: chart)
            }
        }
    }
    
    @ViewBuilder
    func nextView(with chart: chartViews) -> some View {
        switch chart.name {
        case "Basic Bar Graph":
            BarView()
        case "Multiple Bar Graph":
            BarChartTwo()
        case "Line + Point Graph":
            LineChart()
        default:
            BarView()
        }
    }
}

struct MenueView_Previews: PreviewProvider {
    static var previews: some View {
        MenueView()
    }
}
