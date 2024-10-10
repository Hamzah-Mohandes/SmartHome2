//
//  TemperatureChartView.swift
//  SmartHome
//
//  Created by Hamzah on 10.10.24.
//


import Charts
import SwiftUICore

struct TemperatureChartView: View {
    let dayTemperature: Int
    let nightTemperature: Int

    var body: some View {
        Chart {
            LineMark(x: .value("Tag", "Tag"), y: .value("Temperatur", dayTemperature))
            LineMark(x: .value("Nacht", "Nacht"), y: .value("Temperatur", nightTemperature))
        }
        .frame(height: 200)
        .padding()
    }
}
