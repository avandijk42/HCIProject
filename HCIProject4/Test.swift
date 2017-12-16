//
//  ViewController.swift
//  HCIProject4
//
//  Created by RAISE on 11/29/17.
//  Copyright © 2017 HCI. All rights reserved.
//

import UIKit

class Test: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sb = UIStoryboard(name: "Import", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        self.present(vc!, animated: true, completion: nil)
    }
}

