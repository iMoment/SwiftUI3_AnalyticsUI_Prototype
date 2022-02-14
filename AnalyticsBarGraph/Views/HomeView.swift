//
//  HomeView.swift
//  AnalyticsBarGraph
//
//  Created by Stanley Pan on 2022/02/14.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 18) {
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Weekly icons")
                            .font(.title.bold())
                        
                        Text("Reports are available!")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.gray)
                    }
                    
                    Spacer(minLength: 10)
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "bell")
                            .font(.title2)
                            .foregroundColor(Color.gray)
                            .overlay(
                                Text("2")
                                    .font(.caption2.bold())
                                    .foregroundColor(Color.white)
                                    .padding(8)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 11, y: -12),
                                alignment: .topTrailing
                            )
                            .offset(x: -2)
                            .padding(15)
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                }
                // MARK: Graph View
                BarGraph(downloads: downloads)
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
