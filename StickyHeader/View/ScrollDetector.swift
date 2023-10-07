//
//  ScrollDetector.swift
//  StickyHeader
//
//  Created by Horacio Mota on 07/10/2023.
//

import SwiftUI

// Extracting Scroll Movement from HomeView Header.
struct ScrollDetector: UIViewRepresentable {
    var onScroll: (CGFloat) -> ()
        
        //offset + velocity
    var ondragging: (CGFloat, CGFloat) -> ()
    
    func makeCoordinator() -> cordinator {
        return Coordinator(parent: self)
    }
        
    func makeUIView(context: Context) -> some UIView {
        return UIView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        DispatchQueue.main.async {
            if let scrollview = uiView.superview?.superview?.superview as? UIScrollView {
                scrollview.delegate = context.coordinator
                context.coordinator.isdelagateadded = true

            }
        }
    }
   
    class cordinator: NSObject, UIScrollViewDelegate {
        var parent: ScrollDetector
        
        init(parent: ScrollDetector) {
            self.parent = parent
        }
        
        //One time delegate init.
        
        var isdelagateadded:  Bool = false
        
        func scrollViewDidZoom(_ scrollView: UIScrollView) {
            parent.onScroll(scrollView.contentOffset.y)
        }
        
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            parent.ondragging(targetContentOffset.pointee.y, velocity.y)
        }
        
    }
}
