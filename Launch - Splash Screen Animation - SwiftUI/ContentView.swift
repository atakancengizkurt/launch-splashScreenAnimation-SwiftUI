//
//  ContentView.swift
//  Launch - Splash Screen Animation - SwiftUI
//
//  Created by Atakan Cengiz KURT on 16.05.2021.
//

import SwiftUI

struct ContentView: View {
  let color : UIColor = UIColor(red: 29/255.0, green: 161/255.0, blue: 242/255.0, alpha: 1)
  
  @State var animation: Bool = false
  @State var showSplash: Bool = true
  
  var body: some View {
    VStack{
      ZStack{
        //Content
        ZStack{
          VStack{
            Text("Atakan Cengiz KURT")
              .foregroundColor(Color.init(color))
              .font(.largeTitle)
              .bold()
              .padding()
            
            Image(systemName: "house")
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
              
          }
          
        }
        //Splash
        ZStack{
          Color(color)
          
          Image("twitter")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 85, height: 85, alignment: .center)
            .scaleEffect(animation ? 50 : 1)
            .animation(Animation.easeOut(duration: 0.4))
          
          
        }
        .edgesIgnoringSafeArea(.all)
        .animation(Animation.linear(duration: 1))
        .opacity(showSplash ? 1 : 0)
      }
    }.onAppear(perform: {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
        self.animation.toggle()
      }
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
        self.showSplash.toggle()
      }
    })
    
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
