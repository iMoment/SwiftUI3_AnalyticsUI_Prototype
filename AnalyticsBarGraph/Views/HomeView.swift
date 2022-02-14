//
//  HomeView.swift
//  AnalyticsBarGraph
//
//  Created by Stanley Pan on 2022/02/14.
//

import SwiftUI

struct HomeView: View {
    @State var currentTab = "house"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        // Tab View
        VStack(spacing: 0) {
            
            TabView(selection: $currentTab) {
                
                Text("Home")
                    .tag("home")
                
                Text("Graph")
                    .tag("graph")
                
                Text("Chat")
                    .tag("chat")
                
                Text("Settings")
                    .tag("settings")
            }
            
            // MARK: Custom Tab Bar...
            HStack(spacing: 40) {
                TabButton(image: "house")
                TabButton(image: "chart.xyaxis.line")
            }
        }
    }
    
    @ViewBuilder
    func TabButton(image: String) -> some View {
        Button {
            withAnimation {
                currentTab = image
            }
        } label: {
            Image(systemName: image)
                .resizable()
//                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 25, height: 25)
                .foregroundColor(
                    currentTab == image ? Color.black : Color.gray.opacity(0.8)
                )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
