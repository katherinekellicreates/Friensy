//
//  Homescreen.swift
//  Friensy
//
//  Created by Katherine Pizzirusso on 4/20/26.
//

import SwiftUI

struct Homescreen: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Pink").ignoresSafeArea(.all)
                VStack {
                    Text("Friensy")
                        .font(Font.custom("Bodoni 72 Oldstyle", size: 45))
                    NavigationLink(destination: Choices()) {
                        Text("Play")
                            .frame(width: 100)
                            .font(Font.custom("Bodoni 72 Oldstyle", size: 45))
                            .padding()
                            .background(Color(.pink.opacity(0.3)))
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                    .simultaneousGesture(TapGesture().onEnded { withAnimation(.none) {} })
                    Spacer()
                }
                .padding()
            }
            .navigationViewStyle(.stack)
        }
    }
}
#Preview {
    Homescreen()
}
