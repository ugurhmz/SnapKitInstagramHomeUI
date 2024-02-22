//
//  ViewController.swift
//  InstagramHomeUISnapkit
//
//  Created by Uğur Hamzaoğlu on 21.02.2024.
//

import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    private let homeTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        settingsUI()
    }

    private func configureVC() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationItem.leftBarButtonItems = makeLeftBarButtonItems()
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
    }
    
    private func settingsUI() {
        homeTableView.dataSource = self
        homeTableView.separatorColor = .clear
        homeTableView.register(StoryTableCell.self, forCellReuseIdentifier: String(describing: StoryTableCell.self))
        homeTableView.register(PostTableCell.self, forCellReuseIdentifier: String(describing: PostTableCell.self))
        view.addSubview(homeTableView)
        homeTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let storyCell = tableView.dequeueReusableCell(withIdentifier: StoryTableCell.identifier, for: indexPath) as! StoryTableCell
            return storyCell
            
        }
        let postCell = tableView.dequeueReusableCell(withIdentifier: PostTableCell.identifier, for: indexPath) as! PostTableCell
        return postCell
    }
    
}


extension HomeVC {
    
    // LEFT ITEMS
    func makeLeftBarButtonItems() -> [UIBarButtonItem] {
          let logoBarButtonItem = UIBarButtonItem(customView: LogoView())
          let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: makeDropdownMenu())
          return [logoBarButtonItem, dropDownButtonItem]
      }

      // RIGHT ITEMS
    func makeRightBarButtonItems() -> [UIBarButtonItem] {
          let addBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app"), style: .plain, target: self, action: #selector(clickBtn))
          let directBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(clickBtn))
          return [directBarButtonItem, addBarButtonItem]
    }
    
    // DropDownMenu
    func makeDropdownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Person", image: UIImage(systemName: "person.2")) { _ in
                  print("Subs")
              }
        let favsItem = UIAction(title: "Favs", image: UIImage(systemName: "star")) { _ in
              print("Favorites")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }
    
    @objc func clickBtn() {}
}
