//
//  RecordLiftView.swift
//  myLifts
//
//  Created by Cory Andreasen on 8/4/22.
//

import SwiftUI

struct RecordLiftView: View {
    @Binding var lift: Lift
    @State private var repNum: Int = 0
    @State private var weightNum: Int = 0
    @Binding var oneRepMax: Double
    @State private var visibleResult: String = ""
     
    private func OneRepMaxCalc(repNum: Int,weightNum: Int)-> Double{
        return Double(Double(weightNum) * 36.0 / Double(37 - repNum)) //Bryzycki Formula
     }
    
    var body: some View {
        Form {
            Section(header: Text("One Rep Max Calculator").font(.caption)) {
                Section {
                    VStack {
                        HStack {
                            Text("Enter Weight: ")
                            TextField("weight", value: $weightNum, formatter: NumberFormatter())
                                .keyboardType(.decimalPad)
                        }
                        HStack{
                            Text("Enter Reps:")
                            TextField("weight", value: $repNum, formatter: NumberFormatter())
                                .keyboardType(.decimalPad)
                        }
                        HStack {
                            Text("One Rep Max:")
                            Text(visibleResult)
                            }
                    }
                }
                Section{
                    HStack{
                        Button("Calculate"){
                            oneRepMax = round(OneRepMaxCalc(repNum: repNum, weightNum: weightNum)*10)/10.0
                            visibleResult = String(oneRepMax)
                        }

                    }
                }
            }
        }
    }
}

struct RecordLiftView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            RecordLiftView(lift: .constant(Lift.sampleLifts[0]), oneRepMax: .constant(0))
        }
    }
}
