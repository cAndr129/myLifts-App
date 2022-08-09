//
//  DetailView.swift
//  myLifts
//
//  Created by Cory Andreasen on 7/29/22.
//

import SwiftUI
import SwiftUICharts

struct DetailView: View {
    @Binding var lift: Lift
    @State private var oneRepMax: Double = 0
    @State private var data = Lift.Data()
    @State private var isPresentingEditView = false
    @State private var isPresentingRecordLiftView = false
    
    
    
    var body: some View {
        List {
            LineChartView(data: lift.loggedLifts, title: "\(lift.name) data")
            Section {
                VStack {
                            HStack {
                                VStack {
                                    Text("Current Lift")
                                        .font(.caption)
                                    Text("\((Int)(lift.loggedLifts[lift.loggedLifts.count-1])) lbs.")                                }
                                Spacer()
                                VStack{
                                    Text("Goal Lift")
                                        .font(.caption)
                                    Text("\(lift.goalWeight) lbs.")
                                }
                            }
                }
            }
        }
        .navigationTitle(lift.name)
        .toolbar{
            ToolbarItem(){
                Button("Edit"){
                    isPresentingEditView = true
                    data = lift.data
                }
            }
            ToolbarItem(placement: .bottomBar){
                Button("Record a Lift"){
                    isPresentingRecordLiftView = true
                    data = lift.data
                }
            }
        }
        .sheet(isPresented: $isPresentingEditView){
            NavigationView{
                DetailEditView(data: $data)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("Cancel"){
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("Done"){
                                isPresentingEditView = false
                                lift.update(from: data)
                            }
                        }
                    }
            }
        }
        .sheet(isPresented: $isPresentingRecordLiftView){
            NavigationView{
                RecordLiftView(lift: $lift, oneRepMax: $oneRepMax)
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingRecordLiftView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("Record"){
                                isPresentingRecordLiftView = false
                                lift.loggedLifts.append(oneRepMax)
                            }
                        }
                    }
            }
        }
    }
}
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(lift: .constant(Lift.sampleLifts[0]))
        }
    }
}
