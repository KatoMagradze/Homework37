//
//  ViewController.swift
//  Homework37
//
//  Created by Kato on 6/9/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var figureView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupFigure()
    }
    
    func setupFigure() {
        
        let viewColor = hexStringToUIColor(hex: "#59c2ad")
        let firstLayerColor = hexStringToUIColor(hex: "#5ba699")
        
        figureView.backgroundColor = viewColor
        
        let firstLayer = CALayer()
        firstLayer.backgroundColor = firstLayerColor.cgColor
        firstLayer.frame = CGRect(x: 80/2, y: 80/2, width: figureView.frame.width - 80, height: figureView.frame.height - 80)
        firstLayer.cornerRadius = firstLayer.frame.height / 2
        


        let secondLayer = CALayer()
        secondLayer.backgroundColor = UIColor.white.cgColor
        secondLayer.frame = CGRect(x: 160/2, y: 160/2, width: figureView.frame.width - 160, height: figureView.frame.height - 160)
        secondLayer.cornerRadius = secondLayer.frame.height / 2
        secondLayer.borderColor = UIColor.gray.cgColor
        secondLayer.borderWidth = 5

        
        figureView.layer.addSublayer(firstLayer)
        figureView.layer.addSublayer(secondLayer)
        
    }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}



