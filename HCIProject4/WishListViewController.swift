//
//  WishListViewController.swift
//  HCIProject4
//
//  Created by Humad Syed on 12/15/17.
//  Copyright © 2017 HCI. All rights reserved.
//

import UIKit

class WishListViewController: UIViewController{

    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var overwatch: UIView!
    @IBOutlet weak var halflife: UIView!
    @IBOutlet weak var gears: UIView!
    @IBOutlet weak var minecraftPC: UIView!
    @IBOutlet weak var minecraftXbox: UIView!
    
    var cards: [UIView] = []
    var locations: [CGRect] = []
    var info: [(String, Int, String)] = []
    
    var canSwipeLeft = true
    var canSwipeRight = false
    var trash: UIButton? = nil
    open var arrowStates: [ArrowState] = [.off, .off, .off]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cards = [overwatch, halflife, gears]
        locations = cards.map{ (x:UIView) in x.frame }
        info = cards.map{ card in
            let data = card.accessibilityLabel
            let parts = data?.characters.split(separator: " ").map(String.init)
            return (parts![1], Int(parts![2])!, parts![3])
        }
        initializeSwipes()
        roundedAndShadows()
    }
    
    func roundedAndShadows(){
        self.cards.forEach{ card in
            card.layer.cornerRadius = 5
            card.layer.masksToBounds = false
            card.layer.shadowPath = UIBezierPath(rect: card.bounds).cgPath
            card.layer.shadowColor = UIColor.black.cgColor
            card.layer.shadowOffset = CGSize(width: -2, height: 3)
            card.layer.shadowRadius = 2;
            card.layer.shadowOpacity = 0.5
        }
    }
    
    func updateCardData(_ newView: UIView){
        cards.append(newView)
        locations = cards.map{ (x:UIView) in x.frame }
        info = cards.map{ card in
            let data = card.accessibilityLabel
            let parts = data?.characters.split(separator: " ").map(String.init)
            return (parts![1], Int(parts![2])!, parts![3])
        }
        if arrowStates == [.off, .off, .off]{
            sort(by: 0, direction:"up")
        } else {
            for i in 0..<arrowStates.count{
                if arrowStates[i] != .off{
                    let d = arrowStates[i] == .up ? "up" : "down"
                    sort(by: i, direction: d)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "WishlistPopover") {
            let popover = (segue.destination as! ModalViewController)
            popover.arrowStates = arrowStates
            popover.wishlist = self
        }
    }
    
    func initializeSwipes(){
        for (_,card) in cards.enumerated(){
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(WishListViewController.handleSwipe(gesture:)))
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRightOnOverwatch))
            swipeLeft.direction = .left
            swipeRight.direction = .right
            card.addGestureRecognizer(swipeLeft)
            card.addGestureRecognizer(swipeRight)
        }
    }
    
    func handleSwipe(gesture: UISwipeGestureRecognizer){
        print ("\n\n\nTDXCGJVKGCVJFCJGVJ\n\n\n")
        let card = (gesture.view)!
        for constraint in self.view.constraints{
            if (constraint.firstAttribute == .trailing || constraint.secondAttribute == .trailing) && constraint.secondItem as! NSObject == card{
                constraint.constant = 100
            }
        }
        
        
//        if !locations.contains(frame){
//            card.frame = CGRect(x: frame.origin.x - frame.height, y: frame.origin.y, width: frame.width, height: frame.height)
//            trash = UIButton(frame: CGRect(x:frame.origin.x + frame.width - frame.height,
//                                           y: frame.origin.y,
//                                           width: frame.height,
//                                           height: frame.height))
//            trash?.addTarget(self, action: #selector(hideOverwatch), for: .touchDown)
//            trash!.setImage(#imageLiteral(resourceName: "trash"), for: .normal)
//            self.view.addSubview(trash!)
//        }
        
    }
    
    @objc func swipeLeft(on card:UIView){
        let frame = card.frame
        if !locations.contains(frame){
            card.frame = CGRect(x: frame.origin.x - frame.height, y: frame.origin.y, width: frame.width, height: frame.height)
            trash = UIButton(frame: CGRect(x:frame.origin.x + frame.width - frame.height,
                                           y: frame.origin.y,
                                           width: frame.height,
                                           height: frame.height))
            trash?.addTarget(self, action: #selector(hideOverwatch), for: .touchDown)
            trash!.setImage(#imageLiteral(resourceName: "trash"), for: .normal)
            self.view.addSubview(trash!)
        }
    }
    
    @objc func swipeLeft(at index:Int){
        let card = cards[index]
        let frame = card.frame
        if !locations.contains(frame){
            card.frame = CGRect(x: frame.origin.x - frame.height, y: frame.origin.y, width: frame.width, height: frame.height)
            trash = UIButton(frame: CGRect(x:frame.origin.x + frame.width - frame.height,
                                           y: frame.origin.y,
                                           width: frame.height,
                                           height: frame.height))
            trash?.addTarget(self, action: #selector(hideOverwatch), for: .touchDown)
            trash!.setImage(#imageLiteral(resourceName: "trash"), for: .normal)
            self.view.addSubview(trash!)
        }
    }
    
    @objc func removeCard(_ card:UIView){
        card.isHidden = true
        cards.remove(at: cards.index(of: card)!)
    }
    
    func swipeLeftOnOverwatch(){
        let frame = overwatch.frame
        if canSwipeLeft{
            overwatch.frame = CGRect(x: frame.origin.x - frame.height, y: frame.origin.y, width: frame.width, height: frame.height)
            canSwipeLeft = false
            canSwipeRight = true
            trash = UIButton(frame: CGRect(x:frame.origin.x + frame.width - frame.height,
                                               y: frame.origin.y,
                                               width: frame.height,
                                               height: frame.height))
            trash?.addTarget(self, action: #selector(hideOverwatch), for: .touchDown)
            trash!.setImage(#imageLiteral(resourceName: "trash"), for: .normal)
            self.view.addSubview(trash!)
        }
    }
    
    func swipeRightOnOverwatch(){
        let frame = overwatch.frame
        if canSwipeRight{
            overwatch.frame = CGRect(x: frame.origin.x + frame.height, y: frame.origin.y, width: frame.width, height: frame.height)
            canSwipeLeft = true
            canSwipeRight = false
            trash!.isHidden = true
        }
    }
    
    func hideOverwatch(){
        self.overwatch.isHidden = true
        trash?.isHidden = true
    }
    
    @IBAction func searchFinished(_ sender: UITextField) {
        if sender.text?.lowercased() == "minecraft"{
            minecraftPC.isHidden = false
            updateCardData(minecraftPC)
            roundedAndShadows()
            sender.resignFirstResponder()
        }
    }
    
    open func sort(by index:Int, direction:String){
        let inorder = info.sorted{
            let (name1, date1, platform1) = $0
            let (name2, date2, platform2) = $1
            switch(index){
            case 0:
                return direction == "up" ? name1 < name2 : name1 > name2
            case 1:
                return direction == "up" ? date1 < date2 : date1 > date2
            case 2:
                return direction == "up" ? platform1 < platform2 : platform1 > platform2
            default:
                return direction == "up" ? name1 < name2 : name1 > name2
            }
        }
        for i in 0..<inorder.count{
            for card in cards{
                if card.accessibilityLabel?.characters.split(separator: " ").map(String.init)[1] == inorder[i].0{
                    card.frame = locations[i]
                }
            }
        }
        roundedAndShadows()
    }
}
