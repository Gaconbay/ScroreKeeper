//
//  SettingView.swift
//  ScroreKeeper
//
//  Created by Ty Tran on 11/6/24.
//
import SwiftUI

struct SettingView: View {
    @Binding var startingpoints: Int
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Game Rules")
                .font(.headline)
            Divider()
            Picker("Starting Points", selection: $startingpoints) {
                Text("0 starting points")
                    .tag(0)
                Text("10 starting points")
                    .tag(10)
                Text("20 starting points")
                    .tag(20)
            }
            
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10))
    }
    
}
#Preview {
    @Previewable @State var startingPoints: Int = 10
    SettingView(startingpoints: $startingPoints)
}
