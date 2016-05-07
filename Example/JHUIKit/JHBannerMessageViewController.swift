//
//  JHBannerMessageViewController.swift
//  JHUIKit
//
//  Created by Huan Jiang on 5/7/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import JHUIKit
class JHBannerMessageViewController: UIViewController {
    @IBOutlet weak var txtMessage: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func onShowMessage(sender: AnyObject) {
        JHBannerMessage.show(txtMessage.text!)
    }
}
