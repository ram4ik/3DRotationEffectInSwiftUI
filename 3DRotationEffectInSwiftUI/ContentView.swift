//
//  ContentView.swift
//  3DRotationEffectInSwiftUI
//
//  Created by ramil on 20.12.2019.
//  Copyright © 2019 com.ri. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var open = false
    @State private var offset: CGFloat = -UIScreen.main.bounds.height
    
    var body: some View {
        ZStack {
            Button(action: {
                self.offset = 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    self.open.toggle()
                }
            }) {
                Text("Open")
            }
            ZStack {
                LinearGradient(gradient: .init(colors: [.orange, .red]), startPoint: .top, endPoint: .bottom)
                VStack {
                    HStack {
                        Spacer()
                        Button(action: {
                            self.open.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                self.offset = -UIScreen.main.bounds.height
                            }
                        }) {
                            Image(systemName: "xmark.circle").font(.title)
                        }.foregroundColor(.white)
                    }.padding()
                    Spacer()
                }
            }.cornerRadius(25)
            .padding()
            .offset(y: self.offset)
            .rotation3DEffect(.init(degrees: self.open ? 0 : 55), axis: (x: self.open ? 0 : 1.0, y: 0, z: 0))
            .opacity(self.offset == -UIScreen.main.bounds.height ? 0 : 1.0)
        }.animation(Animation.easeOut(duration: 0.5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
