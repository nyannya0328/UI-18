//
//  ContentView.swift
//  UI-18
//
//  Created by にゃんにゃん丸 on 2020/10/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct Home : View {
    
    
    @State var animations : [Bool] = [false,false,false,false]
    @State var duration : Double = 0

    var body: some View{
        
        ZStack{
            
        Image("bg")
            .resizable()
         
            
            HStack{
                
                
                ZStack{
                    
                    Image("image")
                        .resizable()
                    
                    
                }
                
                
                    .frame(width: 250, height: UIScreen.main.bounds.height / 2)
                .offset(x: self.animations[0] ? 0 : -1000)
                
                Spacer()
                
                ZStack{
                    
                    Image("image1")
                        .resizable()
                    
                }
                
                
                    .frame(width: 250, height: UIScreen.main.bounds.height / 2)
                
                .offset(x: self.animations[1] ? -60 : -1500)
                
                
                
            }
            
        }
        .onAppear(perform: {
            withAnimation(Animation.easeIn.speed(0.1)){
                
                self.animations[1].toggle()
                
                self.duration += 0.8
                
                
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + self.duration){
                
                withAnimation(Animation.easeIn.speed(0.08)){
                    
                    self.animations[0].toggle()
                    
                    self.duration += 0.4
                    
                    
                }
                
            }
            
            
        })
        .edgesIgnoringSafeArea(.all)
    }
    
}
