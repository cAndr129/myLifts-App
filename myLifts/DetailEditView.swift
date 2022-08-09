//
//  DetailEditView.swift
//  myLifts
//
//  Created by Cory Andreasen on 7/30/22.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var data: Lift.Data
    @State private var isShowingAlert = false
    
    var body: some View {
        Form {
            Section(header: Text("Lift Info")){
                TextField("Name", text: $data.name)
                TextField("Goal", value: $data.goalWeight, formatter: NumberFormatter())
                ThemePicker(selection: $data.theme)
            }
        }
    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(Lift.sampleLifts[0].data))
    }
}
