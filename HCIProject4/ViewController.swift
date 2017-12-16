//
//  ViewController.swift
//  HCIProject4
//
//  Created by RAISE on 11/29/17.
//  Copyright © 2017 HCI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var chart: UIImageView!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var menuView: UIView!
    var isMenuOpen = false;
    
    var currentViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.layer.shadowOpacity = 1
        loadHome()
    }
    
    func loadHome() {
        let homeViewController = self.storyboard!.instantiateViewController(withIdentifier: "HomeViewController")
        
        self.addChildViewController(homeViewController)
        homeViewController.view.frame = mainView.bounds
        mainView.addSubview(homeViewController.view)
        homeViewController.didMove(toParentViewController: self)
        
        currentViewController = homeViewController
    }
    
    func removePreviousVC() {
        currentViewController.willMove(toParentViewController: nil)
        currentViewController.view.removeFromSuperview()
        currentViewController.removeFromParentViewController()
    }
    
    @IBAction func presentHome(_ sender: Any) {
        removePreviousVC()
        loadHome()
        openCloseMenu()
    }
    
    @IBAction func presentWishList(_ sender: Any) {
        removePreviousVC()
        
        let wishListViewController = self.storyboard!.instantiateViewController(withIdentifier: "WishListViewController")
        
        self.addChildViewController(wishListViewController)
        wishListViewController.view.frame = mainView.bounds
        mainView.addSubview(wishListViewController.view)
        wishListViewController.didMove(toParentViewController: self)
        
        currentViewController = wishListViewController
        
        openCloseMenu()
    }
    
    @IBAction func presentStatistics(_ sender: Any) {
        removePreviousVC()
        
        let statisticsViewController = self.storyboard!.instantiateViewController(withIdentifier: "StatisticsViewController")
        
        self.addChildViewController(statisticsViewController)
        statisticsViewController.view.frame = mainView.bounds
        mainView.addSubview(statisticsViewController.view)
        statisticsViewController.didMove(toParentViewController: self)
        
        currentViewController = statisticsViewController

        openCloseMenu()
    }
    
    @IBAction func presentImport(_ sender: Any) {
        removePreviousVC()
        
        /*
         
         let importViewController = self.storyboard!.instantiateViewController(withIdentifier: "ImportViewController")
         
         self.addChildViewController(importViewController)
         importViewController = mainView.bounds
         mainView.addSubview(statisticsViewController)
         importViewController(toParentViewController: self)
         
         currentViewController = importViewController
         
         */
        
        openCloseMenu()
    }
    
    
    
    func openCloseMenu() {
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
    
    @IBAction func openMenu(_ sender: Any) {
        openCloseMenu()
    }
    
    @IBAction func chart_convert(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0){
            chart.image = #imageLiteral(resourceName: "pie_chart_allgames")
        } else{
            chart.image = #imageLiteral(resourceName: "line_chart_allgames")
        }
    }
    
    @IBAction func money_time_convert(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0) {
            chart.image = #imageLiteral(resourceName: "pie_chart_console")
        } else{
            chart.image = #imageLiteral(resourceName: "line_chart_console")
        }
    }
}

