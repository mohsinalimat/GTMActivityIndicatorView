//
//  ViewController.swift
//  GTMActivityIndicatorViewDemo
//
//  Created by luoyang on 2016/12/6.
//  Copyright © 2016年 syncsoft. All rights reserved.
//

import UIKit
import GTMActivityIndicatorView

class ViewController: UIViewController {
    
    let animations: [NVActivityIndicatorAnimation] = [NVActivityIndicatorAnimationAudioEqualizer(),
                      NVActivityIndicatorAnimationBallBeat(),
                      NVActivityIndicatorAnimationBallClipRotate(),
                      NVActivityIndicatorAnimationBallClipRotateMultiple(),
                      NVActivityIndicatorAnimationBallClipRotatePulse(),
                      NVActivityIndicatorAnimationBallGridBeat(),
                      NVActivityIndicatorAnimationBallGridPulse(),
                      NVActivityIndicatorAnimationBallPulse(),
                      NVActivityIndicatorAnimationBallPulseRise(),
                      NVActivityIndicatorAnimationBallPulseSync(),
                      NVActivityIndicatorAnimationBallRotate(),
                      NVActivityIndicatorAnimationBallRotateChase(),
                      NVActivityIndicatorAnimationBallScale(),
                      NVActivityIndicatorAnimationBallScaleMultiple(),
                      NVActivityIndicatorAnimationBallScaleRipple(),
                      NVActivityIndicatorAnimationBallScaleRippleMultiple(),
                      NVActivityIndicatorAnimationBallSpinFadeLoader(),
                      NVActivityIndicatorAnimationBallTrianglePath(),
                      NVActivityIndicatorAnimationBallZigZag(),
                      NVActivityIndicatorAnimationBallZigZagDeflect(),
                      NVActivityIndicatorAnimationBlank(),
                      NVActivityIndicatorAnimationCubeTransition(),
                      NVActivityIndicatorAnimationLineScale(),
                      NVActivityIndicatorAnimationLineScaleParty(),
                      NVActivityIndicatorAnimationLineScalePulseOut(),
                      NVActivityIndicatorAnimationLineScalePulseOutRapid(),
                      NVActivityIndicatorAnimationLineSpinFadeLoader(),
                      NVActivityIndicatorAnimationOrbit(),
                      NVActivityIndicatorAnimationPacman(),
                      NVActivityIndicatorAnimationSemiCircleSpin(),
                      NVActivityIndicatorAnimationSquareSpin(),
                      NVActivityIndicatorAnimationTriangleSkewSpin()]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: CGFloat(237 / 255.0), green: CGFloat(85 / 255.0), blue: CGFloat(101 / 255.0), alpha: 1)
        
        let cols = 4
        let rows = 8
        let cellWidth = Int(self.view.frame.width / CGFloat(cols))
        let cellHeight = Int(self.view.frame.height / CGFloat(rows))
        
        
        
        for (index, animation) in animations.enumerated() {
            let x = index % cols * cellWidth
            let y = index / cols * cellHeight
            let frame = CGRect(x: x, y: y, width: cellWidth, height: cellHeight)
            let activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                                animation: animation)
            let animationTypeLabel = UILabel(frame: frame)
            
            animationTypeLabel.text = String(index)
            animationTypeLabel.sizeToFit()
            animationTypeLabel.textColor = UIColor.white
            animationTypeLabel.frame.origin.x += 5
            animationTypeLabel.frame.origin.y += CGFloat(cellHeight) - animationTypeLabel.frame.size.height
            
            activityIndicatorView.padding = 20
            self.view.addSubview(activityIndicatorView)
            self.view.addSubview(animationTypeLabel)
            activityIndicatorView.startAnimating()
            
            let button:UIButton = UIButton(frame: frame)
            button.tag = index
            button.addTarget(self,
                             action: #selector(buttonTapped(_:)),
                             for: UIControlEvents.touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    func buttonTapped(_ sender: UIButton) {
        let size = CGSize(width: 30, height:30)
        
        let color = UIColor.init(red: 246/255.0, green: 83/255.0, blue: 20/255.0, alpha: 1)
        showIndicator(size, message: "Loading...", animation: animations[sender.tag], color: color)
        perform(#selector(delayedStopActivity),
                with: nil,
                afterDelay: 2.5)
    }
    
    func delayedStopActivity() {
        hideIndicator()
    }

}

