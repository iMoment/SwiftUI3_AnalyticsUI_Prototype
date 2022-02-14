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
            
            HStack(spacing: 10) {
                Capsule()
                    .fill(Color("lightBlue"))
                    .frame(width: 20, height: 8)
                
                Text("Downloads")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color.gray)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // MARK: Graph View
            GraphView()
                .padding(.top, 20)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.top, 25)
    }
    
    @ViewBuilder
    func GraphView() -> some View {
        GeometryReader { proxy in
            
            ZStack {
                VStack(spacing: 0) {
                    
                    ForEach(getGraphLines(), id: \.self) { line in
                        
                        HStack(spacing: 8) {
                             
                            Text("\(Int(line))")
                                .font(.caption)
                                .foregroundColor(Color.gray)
                                .frame(height: 20)
                            
                            Rectangle()
                                .fill(Color.gray.opacity(0.2))
                                .frame(height: 1)
                        }
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .offset(y: -15)
                    }
                }
                
                HStack {
                    
                    ForEach(downloads) { download in
                        
                        VStack(spacing: 0) {
                            
                            VStack(spacing: 5) {
                                Capsule()
                                    .fill(Color("lightBlue"))
                                
                                Capsule()
                                    .fill(Color("darkOrange"))
                            }
                            .frame(width: 8)
                            .frame(height: getBarHeight(point: download.downloads, size: proxy.size))
                            
                            Text(download.weekDay)
                                .font(.caption)
                                .frame(height: 25, alignment: .bottom)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                    }
                    
                }
                .padding(.leading, 30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
        .frame(height: 190)
    }
    
    func getBarHeight(point: CGFloat, size: CGSize) -> CGFloat {
        let max = getMax()
        // 25 text height, 5 spacing
        let height = (point / max) * (size.height - 37)
        
        return height
    }
    
    // MARK: Sample graph lines based on max value
    func getGraphLines() -> [CGFloat] {
        let max = getMax()
        var lines: [CGFloat] = []
        
        lines.append(max)
        
        for index in 1...4 {
            let progress = max / 4
            lines.append(max - (progress * CGFloat(index)))
        }
        
        return lines
    }
    
    func getMax() -> CGFloat {
        let max = downloads.max { first, second in
            return second.downloads > first.downloads
        }?.downloads ?? 0
        
        return max
    }
}

struct BarGraph_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
