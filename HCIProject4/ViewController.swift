//
//  ViewController.swift
//  HCIProject4
//
//  Created by RAISE on 11/29/17.
//  Copyright © 2017 HCI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var menuView: UIView!
    var isMenuOpen = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.layer.shadowOpacity = 1
    }
    
    @IBAction func presentHome(_ sender: Any) {
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
        
        self.present(homeViewController!, animated: true, completion: nil)
    }
    
    @IBAction func presentWishList(_ sender: Any) {
        let wishListViewController = self.storyboard?.instantiateViewController(withIdentifier: "WishListViewController")
        
        self.present(wishListViewController!, animated: true, completion: nil)
    }
    
    @IBAction func openMenu(_ sender: Any) {
        if (isMenuOpen) {
            leadingConstraint.constant = -250
        } else {
            leadingConstraint.constant = 0;
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        
        isMenuOpen = !isMenuOpen
    }
    
    
    
    
    
    
    
    
}

