//
//  HomeViewController.swift
//  ScrollableImageMask
//
//  Created by don chen on 2017/3/7.
//  Copyright © 2017年 Don Chen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var imageView2: UIImageView!
    @IBOutlet var maskView: UIView!
    
    @IBOutlet var barImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView2.mask = maskView
        
        setupGesture()
    }
    
    func setupGesture() {
        barImageView.isUserInteractionEnabled = true
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(barDidSwipe(gesture:)))
        barImageView.addGestureRecognizer(panGesture)
    }
    
    func barDidSwipe(gesture:UIGestureRecognizer) {
        if let panGesture = gesture as? UIPanGestureRecognizer {
            let point = panGesture.location(in: view)
            
            
            let halfBarWidth = CGFloat(12.5)
            barImageView.frame.origin.x = point.x - halfBarWidth
            
            let newMaskViewFrame = CGRect(x: point.x,
                                          y: maskView.frame.origin.y,
                                          width: view.frame.width - point.x,
                                          height: maskView.frame.height)
            maskView.frame = newMaskViewFrame
            
        }
        
    }


}
