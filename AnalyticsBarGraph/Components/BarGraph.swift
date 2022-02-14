//
//  BarGraph.swift
//  AnalyticsBarGraph
//
//  Created by Stanley Pan on 2022/02/14.
//

import SwiftUI

struct BarGraph: View {
    var downloads: [Download]
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Icons downloaded")
                    .fontWeight(.bold)
                
                Spacer()
                
                Menu {
                    Button("Month") {}
                    Button("Year") {}
                    Button("Day") {}
                    
                } label: {
                    HStack(spacing: 4) {
                        Text("this week")
                        
                        Image(systemName: "arrowtriangle.down.fill")
                            .scaleEffect(0.7)
                    }
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color.gray)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(18)
        .padding(.top, 25)
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
