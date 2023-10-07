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
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                HeaderView()
            }
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View {
        let headerHeight = (size.height * 0.4) + safeArea.top
        
        ZStack {
            Rectangle().fill(.black)
            
            VStack {
                GeometryReader {
                    var rect = $0.frame(in: .global)
                    
                    Image("Profile_pic")
                        .resizable()
                        .clipShape(Circle())
                }
            }
        }
        .frame(height: headerHeight)
        
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
