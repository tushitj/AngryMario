//
//  ViewController.swift
//  youtubeTest
//
//  Created by Tushit Jain on 3/23/17.
//  Copyright © 2017 Tushit Jain. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    var motionManager = CMMotionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        motionManager.deviceMotionUpdateInterval = 0.1
        motionManager.startGyroUpdates(to: OperationQueue.current!, withHandler: {deviceManager, error in
            var accelerationThe : Double = 1
            var userAcceleration : CMAcceleration = deviceManager.userAcceleration
        
            if(fabs(userAcceleration.x) > accelerationThe) || (fabs(userAcceleration.y) > accelerationThe) || (fabs(userAcceleration.z) > accelerationThe){
                print("Low")
                
            }
        
        
        })
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

