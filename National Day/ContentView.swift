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
    @State private var index = 0
    @State private var showPunchline = false
    struct Joke {
        var setup: String
        var punchline: String
    }
    let jokes = [
        Joke(setup: "Why did the American flag go to school?", punchline: "Because it wanted to get more stars!"),
        Joke(setup: "What's a ghost's favorite national day?", punchline: "Independence BOO-day!"),
        Joke(setup: "Why did the cookie go to the parade?", punchline: "It wanted to crumble into patriotism!"),
        Joke(setup: "What do you call a parade of rabbits hopping down the street on National Pet Day?", punchline: "The hare-raising pet-riotic parade!"),
        Joke(setup: "Why did the Statue of Liberty always get invited to parties?", punchline: "She was the life of the celebration!"),
        Joke(setup: "Why do national days always make people hungry?", punchline: "Because they're full of 'independence' (in-dependence)!"),
        Joke(setup: "What do you get when you cross a famous musician with a national day?", punchline: "Indepen-dance Day!"),
        Joke(setup: "Why do flags always have such great manners?", punchline: "They're always flag-etiquette!"),
        Joke(setup: "Why did the comedian love National Tell a Joke Day?", punchline: "It was their time to shine and get lots of laughs!"),
        Joke(setup: "How did the bald eagle feel about the national day celebrations?", punchline: "Soaringly proud!"),
    ]
    var body: some View {
        TabView{
            ZStack{
                if flagSize > 60.0{
                    LinearGradient(
                        gradient: Gradient(colors: [Color.red, Color.white]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                }
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
       .tabItem{
            Label("Homepage", systemImage: "person")
            }
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
            Stepper("You have attended National Day Parade  \(attendedParade) times", value: $attendedParade)
            Text("Your rating for '2023 National Day Song Shine Your Light': \(songRating)")
            Slider(value: $songRating, in: 0...10)
           }
        }
        .tabItem{
            Label("Form", systemImage: "newspaper.fill")
        }
            ZStack{
                VStack{
                
                    Text(jokes[index].setup)
                        .font(.largeTitle)
                        .multilineTextAlignment(.center)
                    Button {
                        withAnimation {
                            showPunchline = true
                        }
                    } label: {
                        Text("Tell me!")
                            .font(.largeTitle)
                            .padding()
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    if showPunchline == true {
                        Text(jokes[index].punchline)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 30))
                        Text("Tap anywhere to continue")
                            .foregroundColor(.blue)
                            .padding()
                    }
                }
                .onTapGesture {
                     if showPunchline{
                        index += 1
                        showPunchline = false
                       if index == jokes.count {
                         index = 0
                         print("Restarted")
                       }
                        
                    }
                  }
                
          }
        .tabItem{
            Label("Jokes", systemImage: "scribble.variable")
        }
     }//end of tabview
        
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
