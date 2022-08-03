//
//  mainView.swift
//  myLifts
//
//  Created by Cory Andreasen on 7/29/22.
//

import SwiftUI

struct MainView: View {
    let lifts: [Lift]
    
    var body: some View {
        List(){
            ForEach(lifts) { lift in
                LiftView(lift: lift)
            }
        }
        .toolbar{
            ToolbarItem(placement: .principal){
                Text("myLifts")
                    .font(.largeTitle.bold())
                    .accessibilityAddTraits(.isHeader)
            }
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                Button(action: {}){
                    Image(systemName: "plus")
                }
            }
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading){
                Button("edit"){}
            }
        }
        .navigationTitle("Choose a Lift")
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView(lifts: Lift.sampleLifts)
        }
    }
}
