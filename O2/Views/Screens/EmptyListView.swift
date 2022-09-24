//
//  EmptyListView.swift
//  O2
//
//  Created by Joseph Wil;liam DeWeese on 9/23/22.
//

import SwiftUI

struct EmptyListView: View {
    @State var isPresented = false
    
    
    var body: some View {
        
        
        ZStack {
            VStack{
              
                Image("tribelogotransparent")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
//                    .frame(maxWidth: 200, maxHeight: 110, alignment: .center)
                Text("Developm3nts")
                    .font(.system(size: 30, design: .serif))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .opacity(0.7)
                    .foregroundColor(.primary)
                
            }
           
            ButtonView()
        }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(white: 0.9))
        .edgesIgnoringSafeArea(.all)
     
        }
//        Group {
//            
//            Circle()
//                .fill(Color("blue"))
//                .frame(width: 60, height: 60, alignment: .center)
//                .padding(.trailing, 30)
//            
//            Button(action: {
//                isPresented=true
//            }) {
//                Image(systemName: "plus")
//                    .resizable()
//                    .scaledToFit()
//                    .foregroundColor(Color("white"))
//                    .frame(width: 28, height: 28, alignment: .center)
//                    .padding(.trailing, 46)
//                    .padding(.bottom, 15)
//                
//            }
//        }
    }

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView()
    }
}
