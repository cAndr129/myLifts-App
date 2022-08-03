//
//  DetailEditView.swift
//  myLifts
//
//  Created by Cory Andreasen on 7/30/22.
//

import SwiftUI

struct DetailEditView: View {
    var body: some View {
        Form {
            Section(header: Text("Lift Info")){
                Text("Name")
                Text("Goal")
            }
            Section(){
                Text("Delete Lift")
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView()
    }
}
