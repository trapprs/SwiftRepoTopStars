//
//  UIViewController+Extension.swift
//  SwiftTopStars
//
//  Created by Renan Trapp on 16/08/19.
//  Copyright © 2019 Renan Trapp. All rights reserved.
//

import UIKit

extension UIViewController {
    private func overlayer() -> UIView {
        let viewOverlay = UIView(frame: self.view.frame)
        viewOverlay.tag = 300
        viewOverlay.isUserInteractionEnabled = false
        viewOverlay.backgroundColor = UIColor(white: 0, alpha: 0.7)
        viewOverlay.isMultipleTouchEnabled = false
        viewOverlay.isExclusiveTouch = true
        viewOverlay.layer.zPosition = 30
        self.customActivityIndicatory(viewOverlay, startAnimate: true)
        
        return viewOverlay
    }
    
    func addOverlayer() {
        let viewOverlay = overlayer()
        
        self.view.addSubview(viewOverlay)
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    func removeOverlayer() {
        DispatchQueue.main.async {
            UIApplication.shared.endIgnoringInteractionEvents()
            
            let overlayer = self.view.viewWithTag(300)
            if let overlayer = overlayer {
                overlayer.removeFromSuperview()
            }
        }
    }
    
    @discardableResult
    func customActivityIndicatory(_ viewContainer: UIView, startAnimate: Bool = true) -> UIActivityIndicatorView {
        let mainContainer: UIView = UIView(frame: viewContainer.frame)
        mainContainer.center = viewContainer.center
        
        mainContainer.alpha = 0.9
        mainContainer.tag = 789456123
        mainContainer.isUserInteractionEnabled = false
        
        let viewBackgroundLoading: UIView = UIView(frame: CGRect(x:0,y: 0,width: 60,height: 60))
        viewBackgroundLoading.center = viewContainer.center
        
        
        viewBackgroundLoading.alpha = 0.9
        viewBackgroundLoading.clipsToBounds = true
        viewBackgroundLoading.layer.cornerRadius = 15
        
        let activityIndicatorView: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.frame = CGRect(x: 0.0, y: 0.0,width: 40.0, height: 40.0)
        activityIndicatorView.style =
            UIActivityIndicatorView.Style.whiteLarge
        if startAnimate {
            viewBackgroundLoading.addSubview(activityIndicatorView)
            mainContainer.addSubview(viewBackgroundLoading)
            viewContainer.addSubview(mainContainer)
            activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
            
            viewContainer.centerXAnchor.constraint(equalTo: mainContainer.centerXAnchor).isActive = true
            viewContainer.centerYAnchor.constraint(equalTo: mainContainer.centerYAnchor).isActive = true
            activityIndicatorView.startAnimating()
        }else {
            for subview in viewContainer.subviews {
                if subview.tag == 789456123 {
                    subview.removeFromSuperview()
                }
            }
        }
        return activityIndicatorView
    }
}
