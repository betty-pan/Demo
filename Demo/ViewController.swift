//
//  ViewController.swift
//  Demo
//
//  Created by Betty Pan on 2021/9/21.
//

import UIKit

class DemoViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var colors = [UIColor]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "\(DemoTableViewCell.self)", bundle: nibBundle), forCellReuseIdentifier: "\(DemoTableViewCell.self)")
        tableView.delegate = self
        tableView.dataSource = self

        colors = [
            UIColor.red,
            UIColor.orange,
            UIColor.systemPink,
            UIColor.yellow,
            UIColor.gray,
            UIColor.green,
            UIColor.blue,
            UIColor.cyan,
            UIColor.brown
        ]

    }
}
extension DemoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(DemoTableViewCell.self)", for: indexPath) as? DemoTableViewCell else { return UITableViewCell() }
        cell.setCell(colors: colors)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

}
