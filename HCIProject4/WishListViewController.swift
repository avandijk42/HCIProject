//
//  WishListViewController.swift
//  HCIProject4
//
//  Created by Humad Syed on 12/15/17.
//  Copyright © 2017 HCI. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController {

    @IBOutlet weak var firstLogo: UIImageView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var firstPlatform: UIImageView!
    @IBOutlet weak var firstDate: UILabel!
    @IBOutlet weak var secondLogo: UIImageView!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var secondPlatform: UIImageView!
    @IBOutlet weak var secondDate: UILabel!
    @IBOutlet weak var thirdLogo: UIImageView!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var thirdPlatform: UIImageView!
    @IBOutlet weak var thirdDate: UILabel!
    @IBOutlet weak var filterButton: UIButton!
    
    @IBOutlet weak var filterOffset: NSLayoutConstraint!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var nameArrow: UIImageView!
    @IBOutlet weak var dateArrow: UIImageView!
    @IBOutlet weak var platformArrow: UIImageView!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var platformButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    // 0 == not selected, 1 == ascending, 2 == descending
    var sortByName = 0
    var sortByDate = 0
    var sortByPlatform = 0
    
    var isPopUpOpen = false
    
    var gameNames = ["Gears of War", "Half Life 2", "Overwatch"]
    var gameLogos = ["gears_of_war_logo", "half_life_logo", "overwatch_icon"]
    var platforms = ["xbox_icon", "steam_icon", "playstation_icon"]
    var dates = ["2006", "2004", "2016"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeArrows()
    }
    
    func initializeArrows() {
        nameArrow.image = nil
        platformArrow.image = nil
        dateArrow.image = nil
    }
    
    @IBAction func nameButtonPressed(_ sender: Any){
        
        initializeArrows()
        sortByDate = 0
        sortByPlatform = 0
        
        if (sortByName == 0 || sortByName == 2) {
            sortByName = 1
            nameArrow.image = UIImage(named: "arrow_up")
        } else {
            sortByName = 2
            nameArrow.image = UIImage(named: "arrow_down")
        }
    }
    
    @IBAction func dateButtonPressed(_ sender: Any){
        
        initializeArrows()
        sortByName = 0
        sortByPlatform = 0
        
        if (sortByDate == 0 || sortByDate == 2) {
            sortByDate = 1
            dateArrow.image = UIImage(named: "arrow_up")
        } else {
            sortByDate = 2
            dateArrow.image = UIImage(named: "arrow_down")
        }
    }
    
    @IBAction func platformButtonPressed(_ sender: Any){
        
        initializeArrows()
        sortByName = 0
        sortByDate = 0
        
        if (sortByPlatform == 0 || sortByPlatform == 2) {
            sortByPlatform = 1
            platformArrow.image = UIImage(named: "arrow_up")
        } else {
            sortByPlatform = 2
            platformArrow.image = UIImage(named: "arrow_down")
        }
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        openClosePopUp()
        sortList()
    }
    
    func openClosePopUp() {
        if (isPopUpOpen) {
            filterOffset.constant = -600
        } else {
            filterOffset.constant = 0
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
        
        isPopUpOpen = !isPopUpOpen
    }
    
    @IBAction func filterButtonPressed(_ sender: Any) {
        openClosePopUp()
    }
    
    func sortList() {
        
        if (sortByName == 1) {
            sortHelper(0, 1, 2)
        } else if (sortByName == 2) {
            sortHelper(2, 1, 0)
        } else if (sortByDate == 1) {
            sortHelper(1, 0, 2)
        } else  if (sortByDate == 2) {
            sortHelper(2, 0, 1)
        } else if (sortByPlatform == 1) {
            sortHelper(2, 1, 0)
        } else if (sortByPlatform == 2) {
            sortHelper(0, 1, 2)
        }
    }
    
    func sortHelper(_ i: Int, _ j: Int, _ k: Int) {
        firstLabel.text = gameNames[i]
        firstLogo.image = UIImage(named: gameLogos[i])
        firstPlatform.image = UIImage(named: platforms[i])
        firstDate.text = dates[i]
        
        secondLabel.text = gameNames[j]
        secondLogo.image = UIImage(named: gameLogos[j])
        secondPlatform.image = UIImage(named: platforms[j])
        secondDate.text = dates[j]
        
        thirdLabel.text = gameNames[k]
        thirdLogo.image = UIImage(named: gameLogos[k])
        thirdPlatform.image = UIImage(named: platforms[k])
        thirdDate.text = dates[k]
    }

}
