//
//  HomeView.swift
//  StickyHeader
//
//  Created by Horacio Mota on 07/10/2023.
//

import SwiftUI

struct HomeView: View {
    var size: CGSize
    var safeArea: EdgeInsets
    
    //View State propr.
    @State private var  offsetY: CGFloat = 0
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                HeaderView()    
                    .zIndex(1000)
                sampleCardView()
                    .padding(.horizontal)
            }
            .background{
                ScrollDetector{ offset in
                    offsetY = -offset
                } ondragging: { offset, velocity in
                    
                }
            }
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        let headerHeight = (size.height * 0.4) + safeArea.top
        let minimunHeaderHeight = safeArea.top
        let progress = max(min(-offsetY / (headerHeight - minimunHeaderHeight), 1), 0)
        
        ZStack {
            Rectangle().fill(.black)
            
            VStack (spacing: 5) {
                GeometryReader {
                    let rect = $0.frame(in: .global)
                    let halfScaleHeight = (rect.height * 0.5) * 0.5
                    
                    Image("Profile_pic")
                        .resizable()
                        .clipShape(Circle())
                }
                .frame(width: headerHeight * 0.8 , height: headerHeight * 0.5)
                
                Text("Horacio Mota")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Text("IOS develoer")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.top, safeArea.top)
            .padding(.bottom, 15)

        }
        .frame(height: (headerHeight + offsetY) < minimunHeaderHeight ? minimunHeaderHeight: (headerHeight + offsetY), alignment: .bottom)
        .offset(y: -offsetY)
        
    }
    
    @ViewBuilder
    func sampleCardView() -> some View {
        VStack(spacing: 10) {
            ForEach(1...10, id: \.self) {_ in
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(.black.opacity(0.09))
                    .frame(height: 99)
            }
        }
    }
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
