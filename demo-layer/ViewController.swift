//
//  ViewController.swift
//  demo-layer
//
//  Created by jeanwei on 2019/12/8.
//  Copyright © 2019 jeanwei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func flag(moveX: CGFloat, moveY: CGFloat, spin: CGFloat, scale: CGFloat){
        var rect = CGRect(x: 0, y: 0, width: 150, height: 100)
        let UnderlyingView = UIView(frame: rect)


        //設定底層的顏色是白色
        UnderlyingView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        rect = CGRect(x: (UnderlyingView.frame.width - 0)/2, y: 0, width: 75, height: 50)
        let redView = UIView(frame: rect)
        redView.backgroundColor = UIColor(red: 210/255, green: 16/255, blue: 52/255, alpha: 1)
        UnderlyingView.addSubview(redView)



        rect = CGRect ( x:0, y: (UnderlyingView.frame.height - 0) / 2,width:75,height:50)
        let blueView = UIView(frame: rect)
        blueView.backgroundColor = UIColor(red: 0, green: 82/255, blue: 147/255, alpha: 1)
        UnderlyingView.addSubview(blueView)




        let blueStarView = UIView(frame: UnderlyingView.frame)
        blueStarView.backgroundColor = UIColor(red: 0, green: 82/255, blue: 147/255, alpha: 1)
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 26, y: 21))
        path.addLine(to: CGPoint(x: 34, y: 21))
        path.addLine(to: CGPoint(x: 37, y: 13))
        path.addLine(to: CGPoint(x: 40, y: 21))
        path.addLine(to: CGPoint(x: 48, y: 21))
        path.addLine(to: CGPoint(x: 41, y: 26))
        path.addLine(to: CGPoint(x: 44, y: 34))
        path.addLine(to: CGPoint(x: 37, y: 30))
        path.addLine(to: CGPoint(x: 30, y: 34))
        path.addLine(to: CGPoint(x: 32, y: 26))
        path.close()
        let starShapeLayer = CAShapeLayer()
        starShapeLayer.path = path.cgPath
        blueStarView.layer.mask = starShapeLayer
        UnderlyingView.addSubview(blueStarView)



        let redStarView = UIView(frame: blueStarView.frame)
        redStarView.backgroundColor = UIColor(red: 210/255, green: 16/255, blue: 52/255, alpha: 1)
        let starShapeLayer2 = CAShapeLayer()
        starShapeLayer2.path = path.cgPath
        redStarView.layer.mask = starShapeLayer2
        redStarView.frame = blueStarView.frame.offsetBy(dx:75,dy:51)
        UnderlyingView.addSubview(redStarView)
        
        let oneSpin = CGFloat.pi / 180
        UnderlyingView.transform = CGAffineTransform.identity.translatedBy(x: moveX, y: moveY).scaledBy(x: scale, y: scale).rotated(by: oneSpin * spin)
       
        view.addSubview(UnderlyingView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        flag(moveX: 80, moveY: 300, spin: 60, scale: 2)
        flag(moveX: 100, moveY: 20, spin: 120, scale: 1.5)
        flag(moveX: 200, moveY: 100, spin: 30, scale: 0.75)
        flag(moveX: 50, moveY: 250, spin: 170, scale: 0.2)
        flag(moveX: 150, moveY: 600, spin: 5, scale: 3)
        
       
    }

}

