//
//  ViewController.swift
//  PushDemo
//
//  Created by little2s on 16/5/19.
//  Copyright © 2016年 little2s. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}

