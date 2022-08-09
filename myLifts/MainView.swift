//
//  mainView.swift
//  myLifts
//
//  Created by Cory Andreasen on 7/29/22.
//

import SwiftUI

struct MainView: View {
    @Binding var lifts: [Lift]
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewLiftView = false
    @State private var newLiftData = Lift.Data()
    let saveAction: ()->Void
    
    func delete(at offsets: IndexSet){
        lifts.remove(atOffsets: offsets)
    }
    
    var body: some View {
        List {
            ForEach($lifts) { $lift in
                NavigationLink(destination: DetailView(lift: $lift)){
                    LiftView(lift: lift)
                }
                .listRowBackground(lift.theme.mainColor)
            }
            .onDelete(perform: delete)
        }
        .toolbar{
            ToolbarItem(placement: .principal){
                Text("myLifts")
                    .font(.largeTitle.bold())
                    .accessibilityAddTraits(.isHeader)
            }
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing){
                Button(action: { isPresentingNewLiftView = true}){
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isPresentingNewLiftView){
            NavigationView{
                DetailEditView(data: $newLiftData)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewLiftView = false
                                newLiftData = Lift.Data()
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                let newLift = Lift(data: newLiftData)
                                lifts.append(newLift)
                                isPresentingNewLiftView = false
                                newLiftData = Lift.Data()
                            }
                        }
                    }
            }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {saveAction() }
        }
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MainView(lifts: .constant(Lift.sampleLifts), saveAction: {})
        }
    }
}
