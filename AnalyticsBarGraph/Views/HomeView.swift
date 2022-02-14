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
                
                // MARK: Users View
                HStack(spacing: 0) {
                    // Progress View
                    UserProgress(title: "Male Users", color: Color("lightBlue"), image: "person", progress: 68)
                    
                    UserProgress(title: "Female Users", color: Color("customPink"), image: "person", progress: 72)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(18)
                
                // Most Downloads
                VStack {
                    
                    HStack {
                        Text("Most Downloaded Icons")
                            .font(.callout.bold())
                        
                        Spacer()
                        
                        Menu {
                            Button("More") {}
                            Button("Extra") {}
                        } label: {
                            Image("menu")
                                .resizable()
                                .renderingMode(.template)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 18, height: 18)
                                .foregroundColor(.primary)
                        }
                    }
                    
                    HStack(spacing: 15) {
                        Image(systemName: "flame.fill")
                            .font(.title2)
                            .foregroundColor(Color.red)
                            .padding(12)
                            .background(
                                Color.gray
                                    .opacity(0.25)
                                    .clipShape(Circle())
                            )
                        
                        VStack(alignment: .leading, spacing: 8) {
                            
                            Text("Fire Flame")
                                .fontWeight(.bold)
                            
                            Text("1289 Downloads")
                                .font(.caption2.bold())
                                .foregroundColor(Color.gray)
                        }
                        
                        Spacer(minLength: 10)
                        
                        Image(systemName: "square.and.arrow.down.on.square.fill")
                            .font(.title2)
                            .foregroundColor(Color.green)
                    }
                    .padding(.top, 20)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(18)
            }
            .padding()
        }
    }
    
    @ViewBuilder
    func UserProgress(title: String, color: Color, image: String, progress: CGFloat) -> some View {
        HStack {
            Image(systemName: image)
                .font(.title2)
                .foregroundColor(color)
                .padding(10)
                .background(
                    ZStack {
                        Circle()
                            .stroke(Color.gray.opacity(0.3), lineWidth: 2)
                        
                        Circle()
                            .trim(from: 0, to: progress / 100)
                            .stroke(color, lineWidth: 2)
                    }
                )
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(Int(progress))%")
                    .fontWeight(.bold)
                
                Text(title)
                    .font(.caption2.bold())
                    .foregroundColor(Color.gray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
