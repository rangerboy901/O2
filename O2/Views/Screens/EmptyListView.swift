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
                
                Image("frog")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 256, idealWidth: 280, maxWidth: 360, minHeight: 256, idealHeight: 280, maxHeight: 360, alignment: .center)
                
               
                
            }
           
             
        }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(white: 0.5))
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
