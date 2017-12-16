//
//  ViewController.swift
//  HCIProject4
//
//  Created by RAISE on 11/29/17.
//  Copyright © 2017 HCI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let x = ImportViewController()
        self.view = x.view
    }

    @IBOutlet weak var select: UISegmentedControl!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func selectIndex(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 1){
            image.image = #imageLiteral(resourceName: "ps4")
        } else {
            image.image = #imageLiteral(resourceName: "xbox")
        }
    }
}

