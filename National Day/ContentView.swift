//
//  ContentView.swift
//  National Day
//
//  Created by RGS on 22/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var flagSize = 50.0
    var body: some View {
        VStack {
            Text("National Day Is Coming!")
                .foregroundColor(.red)
                .font(.largeTitle)
            Text("🇸🇬")
                .font(.system(size: flagSize))
            Text("\(flagSize)")
            Slider(value:$flagSize, in: 50...500)
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
