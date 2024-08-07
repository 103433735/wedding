//
//  LandingViewController.swift
//  OurWedding
//
//  Created by Bich.DN on 26/7/24.
//

import UIKit

class LandingViewController: UIViewController {



    @IBOutlet weak var tableView: UITableView!
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
    
    var dataSource = LandingDataSource()
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "cell")
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
                view.layer.borderColor = UIColor(red: 134/255, green: 141/255, blue: 172/255, alpha: 1).cgColor
            }
            view.layer.cornerRadius = view.frame.height / 2
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

extension LandingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.eventArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        if indexPath.row % 2 == 0 {
            cell.bindingData(position: .right,
                             time: dataSource.timeArray[indexPath.row],
                             event: dataSource.eventArray[indexPath.row],
                             image: dataSource.imageArray[indexPath.row])
        } else {
            cell.bindingData(position: .left,
                             time: dataSource.timeArray[indexPath.row],
                             event: dataSource.eventArray[indexPath.row],
                             image: dataSource.imageArray[indexPath.row])
        }
        return cell
    }
    
    
}
