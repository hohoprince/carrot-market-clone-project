//
//  HomeViewController.swift
//  carrot_market_clona_ios
//
//  Created by 김주영 on 2022/03/03.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var showListDataManager: ShowListDataManager = ShowListDataManager()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addProductButton: UIButton!
    
    var userInfoManager = UserInfo.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
        print(userInfoManager.name)
        print(userInfoManager.jwt)
        print("주소 : \(userInfoManager.address)")
        print(" 이미지 주소 : \(userInfoManager.imagePath)")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showListDataManager.ShowList(delegate: self, address: userInfoManager.address, page: 1)
    }
    
    func setInit() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "HomeViewTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeViewTableViewCell")
        addProductButton.layer.cornerRadius = 30
    }
    
    @IBAction func addProductMenu(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "SelectHomeDetailViewController") as? SelectHomeDetailViewController else { return }
        present(vc, animated: false, completion: nil)
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

extension HomeViewController {
    func didSuccessShowList() {
        print("success")
    }
}