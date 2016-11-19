//
//  PieView.swift
//  liverendering
//
//  Created by G on 18/11/2016.
//  Copyright © 2016 erdgabios. All rights reserved.
//

import UIKit

@IBDesignable
class PieView: UIView {
    
    var backgroundLayer: CAShapeLayer!
    @IBInspectable var backgroundLayerColor: UIColor = UIColor.darkGray { didSet {updateLayerProperties()}
    }
    var backgroundImageLayer: CALayer!
    @IBInspectable var backgroundImage: UIImage? {
        didSet {updateLayerProperties()}
    }
    var ringLayer: CAShapeLayer!
    @IBInspectable var ringThickness: CGFloat = 2
    @IBInspectable var ringColor: UIColor = UIColor.blue
    @IBInspectable var ringPercent: CGFloat = 0.75 {
        didSet {updateLayerProperties()}
    }
    
    var percentageLayer: CATextLayer!
    @IBInspectable var showPercentage: Bool = true {
        didSet {
            updateLayerProperties()
        }
    }
    @IBInspectable var percentagePosition = 100 {
        didSet {
            updateLayerProperties()
        }
    }
    @IBInspectable var percentageColor: UIColor = UIColor.white {
        didSet {
            updateLayerProperties()
        }
    }
    
    var lineWidth:CGFloat = 1
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createChart()
    }
    
    func createChart() {
        
        layoutBackgroundLayer()
        layoutBackgroundImageLayer()
        
    }
    
    func layoutBackgroundLayer() {
        
        if backgroundLayer == nil {
            backgroundLayer = CAShapeLayer()
            layer.addSublayer(backgroundLayer)
            
            let rectangle = bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
            let path = UIBezierPath(ovalIn: rectangle)
            
            backgroundLayer.path = path.cgPath
            backgroundLayer.fillColor = backgroundLayerColor.cgColor
            backgroundLayer.lineWidth = lineWidth
            backgroundLayer.frame = layer.bounds
            
        }
    }
    
    func layoutBackgroundImageLayer() {
        
        if backgroundImageLayer == nil {
            let imageMask = CAShapeLayer()
            
            let inset = lineWidth + 3
            let insetBounds = self.bounds.insetBy(dx: inset, dy: inset)
            let maskPath = UIBezierPath(ovalIn: insetBounds)
            imageMask.path = maskPath.cgPath
            imageMask.fillColor = UIColor.black.cgColor
            imageMask.frame = self.bounds
            
            backgroundImageLayer = CAShapeLayer()
            backgroundImageLayer.mask = imageMask
            backgroundImageLayer.frame = self.bounds
            backgroundImageLayer.contentsGravity = kCAGravityResizeAspectFill
            layer.addSublayer(backgroundImageLayer)
            
            
            
        }
    }
    
    
    
    
    
    
    
    
    func updateLayerProperties() {
        
        if backgroundImageLayer != nil {
            if let image = backgroundImage {
                backgroundImageLayer.contents = image.cgImage
            }
        }
        
    }

    
}
