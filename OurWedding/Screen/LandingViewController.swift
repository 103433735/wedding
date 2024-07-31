//
//  LandingViewController.swift
//  OurWedding
//
//  Created by Bich.DN on 26/7/24.
//

import UIKit

class LandingViewController: UIViewController {


    @IBOutlet weak var codeDressStackView: UIStackView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var ivTab: [UIImageView]!
    @IBOutlet weak var album: UIView!
    @IBOutlet weak var message: UIView!
    @IBOutlet weak var story: UIView!
    @IBOutlet weak var home: UIView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var vTabbar: UIView!
    @IBOutlet weak var vParent: UIView!
    @IBOutlet weak var vDate: UIView!
    @IBOutlet weak var vPlace: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.setIndex(index: 0)
        configTabbar()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
    }
    
    func configUI() {
        scrollView.insetsLayoutMarginsFromSafeArea = false
        if #available(iOS 13.0, *) {
            scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        } else {
            // Fallback on earlier versions
        }
        scrollView.contentInsetAdjustmentBehavior = .never
        layoutCodeDress()
        vDate.layer.cornerRadius = 40
        vPlace.layer.cornerRadius = 35
    }
    
    func configTabbar() {
        vTabbar.layer.cornerRadius = 35
        vTabbar.clipsToBounds = true
        home.layer.cornerRadius = 25
        album.layer.cornerRadius = 25
        story.layer.cornerRadius = 25
        message.layer.cornerRadius = 25
    }
    
    func setIndex(index:Int) {
        var i = 0
        ivTab.forEach { iv in
            iv.isHighlighted = (i == index)
            i += 1
        }
        i = 0
        
        if index == 0 {
            UIView.animate(withDuration: 0.25, delay: 0) {
                self.scrollView.contentOffset = CGPoint(x: 0.0, y: 0.0)

            }
        } else {
            UIView.animate(withDuration: 0.25, delay: 0) {
                self.scrollView.contentOffset = CGPoint(x: (UIScreen.main.bounds.maxX) * CGFloat(index), y: 0.0)

            }
        }
    }
    
    func layoutCodeDress() {
        codeDressStackView.arrangedSubviews.forEach { view in
            if view == codeDressStackView.arrangedSubviews[0] {
                view.layer.borderWidth = 1
                view.layer.borderColor = UIColor(red: 134, green: 141, blue: 172, alpha: 1).cgColor
            }
            view.layer.cornerRadius = 10
        }
    }
    @IBAction func firstOnPress(_ sender: Any) {
        self.setIndex(index: 0)
    }
    @IBAction func secondOnPress(_ sender: Any) {
        self.setIndex(index: 1)
    }
    @IBAction func thirdOnPress(_ sender: Any) {
        self.setIndex(index: 2)
    }
    @IBAction func forthOnPress(_ sender: Any) {
        self.setIndex(index: 3)
    }
}
