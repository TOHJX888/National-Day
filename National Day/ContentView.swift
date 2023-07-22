//
//  ContentView.swift
//  National Day
//
//  Created by RGS on 22/7/23.
//

import SwiftUI

struct ContentView: View {
    @State private var flagSize = 50.0
    @State private var textEntered = " "
    @State private var likesCeleb = true
    @State private var attendedParade = 1
    @State private var songRating = 5.0
    var body: some View {
       // TabView{
         //   tabItem(){
        VStack {
            Text("National Day Is Coming!")
                .foregroundColor(.red)
                .font(.largeTitle)
            Text("🇸🇬")
                .font(.system(size: flagSize))
            Text("\(flagSize)")
            Slider(value:$flagSize, in: 50...500)
            //           }
            //       }
            //      tabItem(){
            Form {
                Section("A button") {
                    Button("Press me if you like National Day!"){
                        print("I was pressed")
                    }
                }
                Section ("National Day Songs"){
                    TextField("Song", text: $textEntered)
                        .textFieldStyle(.roundedBorder)
                    Text(textEntered == " " ? " " : "Your favourite song is \(textEntered)")
                }
                Section("Other important info") {
                    Toggle("Do you like national day celebrations?", isOn: $likesCeleb)
                    Stepper("You have attended National Day Parade for \(attendedParade)", value: $attendedParade)
                    Text("Your rating for '2023 National Day Song Shine Your Light': \(songRating)")
                    Slider(value: $songRating, in: 0...10)
                }
            }
            
        }
      //      }
            
     //   }//end of tabview
        
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
