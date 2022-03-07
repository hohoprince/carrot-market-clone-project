//
//  HomeViewController.swift
//  carrot_market_clona_ios
//
//  Created by 김주영 on 2022/03/03.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addProductButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
    }
    
    func setInit() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HomeViewTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeViewTableViewCell")
        addProductButton.layer.cornerRadius = 30
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewTableViewCell", for: indexPath)
        
        return cell
    }
    
    
}
