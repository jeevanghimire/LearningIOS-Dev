//
//  Stacks.swift
//  Weather
//
//  Created by Jeevan Ghimire on 03/06/2024.
//

import SwiftUI

struct Stacks: View {
    var body: some View {
        
            VStack(alignment:.leading,spacing: 10){
                ScrollView (showsIndicators: false) {
            //cell 1
                ScrollView (showsIndicators: false){ ForEach(0...5,id: \.self){ index in
                    Divider()
                    HStack{
                        //profile Image
                        Image("ImageNo1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 64, height: 70)
                            .clipShape(Circle())
                        
                        //Name Of User
                        VStack(alignment:.leading){
                            Text("jeevanghimire")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("Jeevan Ghimire")
                                .font(.subheadline)
                        }
                        Spacer()
                        //follow button
                        Button(action: {
                            print("Follow")
                        } )
                        {
                            Text("Follow")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.blue)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 9)
                                        .stroke(Color.blue, lineWidth: 1)
                                    
                                )
                            
                        }.padding(.leading)
                        
                    }.padding(.leading)
                }
                }
            Divider()
        }.padding()
      }
    }
}

#Preview {
    Stacks()
}
