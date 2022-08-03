//
//  DetailView.swift
//  myLifts
//
//  Created by Cory Andreasen on 7/29/22.
//

import SwiftUI

struct DetailView: View {
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            VStack {
                    LiftChartView()
                        HStack {
                            VStack {
                                Text("Current Lift")
                                    .font(.caption)
                                Text("180 lbs.")
                                //replace with current lift info later
                            }
                            Spacer()
                            VStack{
                                Text("Goal Lift")
                                    .font(.caption)
                                Text("225 lbs.")
                                //replace with goal lift info later
                            }
                        }
            }
        }
        .navigationTitle("Bench")
        .toolbar{
            ToolbarItem(){
                Button("Edit"){
                    //edit button action
                }
            }
            ToolbarItem(placement: .bottomBar){
                Button("Record a Lift"){
                    //record button action
                }
            }
        }
        .sheet(isPresented: $isPresentingEditView){
            NavigationView{
                DetailEditView()
                    .toolbar{
                        ToolbarItem(placement: .cancellationAction){
                            Button("Cancel"){
                                isPresentingEditView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction){
                            Button("Done"){
                                isPresentingEditView = false
                                //create function to update data 
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
            DetailView()
        }
    }
}
