//
//  MainView.swift
//  AnalyticsBarGraph
//
//  Created by Stanley Pan on 2022/02/14.
//

import SwiftUI

struct MainView: View {
    @State var currentTab = "house"
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        // Tab View
        VStack(spacing: 0) {
            
            TabView(selection: $currentTab) {
                
                HomeView()
                    .modifier(BGModifier())
                    .tag("house")
                
                Text("Graph")
                    .modifier(BGModifier())
                    .tag("chart.xyaxis.line")
                
                Text("Chat")
                    .modifier(BGModifier())
                    .tag("message")
                
                Text("Settings")
                    .modifier(BGModifier())
                    .tag("gearshape")
            }
            
            // MARK: Custom Tab Bar...
            HStack(spacing: 40) {
                TabButton(image: "house")
                TabButton(image: "chart.xyaxis.line")
                
                // MARK: Center Add Button...
                Button {
                    
                } label: {
                    Image(systemName: "plus")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(Color.white)
                        .padding(22)
                        .background(
                            Circle()
                                .fill(Color("tabPurple"))
                                .shadow(color: Color("tabPurple").opacity(0.15), radius: 5, x: 0, y: 8)
                        )
                }
                .offset(y: -20)
                .padding(.horizontal, -15)
                
                TabButton(image: "message")
                TabButton(image: "gearshape")
            }
            .padding(.top, -10)
            .frame(maxWidth: .infinity)
            .background(
                Color("background")
                    .ignoresSafeArea()
            )
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

// MARK: Background modifier
struct BGModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("background").ignoresSafeArea())
    }
}
