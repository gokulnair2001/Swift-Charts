//
//  BarChartTwo.swift
//  Swift-Charts
//
//  Created by Gokul Nair on 21/06/22.
//

import SwiftUI
import Charts

struct SalesSummary: Identifiable {
    let weekday: Date
    let sales: Int
    
    var id: Date {weekday}
}

let newDelhiData: [SalesSummary] = [
    .init(weekday: Date().date(2022,2,2), sales: 23),
    .init(weekday: Date().date(2022,2,3), sales: 34),
    .init(weekday: Date().date(2022,2,4), sales: 22),
    .init(weekday: Date().date(2022,2,5), sales: 45),
    .init(weekday: Date().date(2022,2,6), sales: 89),
    .init(weekday: Date().date(2022,2,7), sales: 120),
    .init(weekday: Date().date(2022,2,8), sales: 78)
]

let mumbaiData: [SalesSummary] = [
    .init(weekday: Date().date(2022,2,2), sales: 27),
    .init(weekday: Date().date(2022,2,3), sales: 46),
    .init(weekday: Date().date(2022,2,4), sales: 30),
    .init(weekday: Date().date(2022,2,5), sales: 21),
    .init(weekday: Date().date(2022,2,6), sales: 99),
    .init(weekday: Date().date(2022,2,7), sales: 140),
    .init(weekday: Date().date(2022,2,8), sales: 120)
]

let chennaiData: [SalesSummary] = [
    .init(weekday: Date().date(2022,2,2), sales: 45),
    .init(weekday: Date().date(2022,2,3), sales: 23),
    .init(weekday: Date().date(2022,2,4), sales: 67),
    .init(weekday: Date().date(2022,2,5), sales: 43),
    .init(weekday: Date().date(2022,2,6), sales: 56),
    .init(weekday: Date().date(2022,2,7), sales: 170),
    .init(weekday: Date().date(2022,2,8), sales: 100)
]

let kolkataData: [SalesSummary] = [
    .init(weekday: Date().date(2022,2,2), sales: 75),
    .init(weekday: Date().date(2022,2,3), sales: 67),
    .init(weekday: Date().date(2022,2,4), sales: 70),
    .init(weekday: Date().date(2022,2,5), sales: 28),
    .init(weekday: Date().date(2022,2,6), sales: 78),
    .init(weekday: Date().date(2022,2,7), sales: 110),
    .init(weekday: Date().date(2022,2,8), sales: 140)
]

enum city: String {
    case newDelhi = "New Delhi"
    case mumbai = "Mumbai"
    case chennai = "Chennai"
    case kolkata = "Kolkata"
}

enum chartColor: String, Identifiable, CaseIterable {
    case orange = "Orange"
    case blue = "Blue"
    case green = "Green"
    
    var id: String {UUID().uuidString}
    
    func color() -> Color {
        switch self {
        case .orange:
            return .orange
        case .blue:
            return .blue
        case .green:
            return .green
        }
    }
}

struct BarChartTwo: View {
    
    @State var cityName: city = .newDelhi
    
    var data:[SalesSummary] {
        switch cityName {
        case .newDelhi:
            return newDelhiData
        case .mumbai:
            return mumbaiData
        case .chennai:
            return chennaiData
        case .kolkata:
            return kolkataData
        }
    }
    @State var selectedColor: Color = .blue
    
    var body: some View {
     
        VStack {
            
            HStack {
                VStack {
                    Text(cityName.rawValue)
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text("Food Sales")
                        .font(.callout)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                
                Menu("Color") {
                    ForEach(chartColor.allCases) {element in
                        Button {
                            selectedColor = element.color()
                        }label: {
                            HStack {
                                Text("\(element.rawValue)")
                                if element.color() == selectedColor {
                                 Image(systemName: "checkmark")
                                }
                            }
                        }
                    }
                }.foregroundColor(selectedColor)
            }
            
            Picker("City", selection: $cityName.animation(.easeInOut)) {
                Text("Delhi").tag(city.newDelhi)
                Text("Mumbai").tag(city.mumbai)
                Text("Chennai").tag(city.chennai)
                Text("Kolkata").tag(city.kolkata)
            }.pickerStyle(.segmented)
            
            Chart(data) { element in
                BarMark(
                    x: .value("Days", element.weekday, unit: .day),
                    y: .value("Sales", element.sales)
                ).foregroundStyle(selectedColor)
            }
            
            Spacer()
        }.padding(10)
    }
}

struct BarChartTwo_Previews: PreviewProvider {
    static var previews: some View {
        BarChartTwo()
    }
}

extension Date {
    func date(_ year: Int, _ month: Int, _ day: Int) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy mm dd"
        let string = "\(year) \(month) \(day)"
        let finalDate = dateFormatter.date(from: string)
        return finalDate!
    }
}
