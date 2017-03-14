//
//  ViewController.swift
//  Snapshot
//
//  Created by ShengHua Wu on 13/03/2017.
//  Copyright © 2017 ShengHuaWu. All rights reserved.
//

import UIKit

// MARK: - View Controller
final class ViewController: UITableViewController {
    // MARK: - States
    enum State {
        case empty
        case normal([String])
        
        fileprivate var count: Int {
            switch self {
            case let .normal(titles):
                return titles.count
            default:
                return 0
            }
        }
        
        fileprivate func getTitle(at index: Int) -> String? {
            switch self {
            case let .normal(titles):
                return titles[index]
            default:
                return nil
            }
        }
    }
    
    // MARK: - Internal Properties
    var state: State = .empty
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        tableView.tableFooterView = UIView(frame: .zero)
        
        let backgroundView = BackgroundView(frame: .zero)
        backgroundView.textLabel.text = "Nothing Here!"
        backgroundView.backgroundColor = UIColor.lightGray
        tableView.backgroundView = backgroundView

        switch state {
        case .empty:
            tableView.backgroundView?.isHidden = false
        case .normal:
            tableView.backgroundView?.isHidden = true;
        }
    }
}

// MARK: - Table View Data Source
extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return state.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description(), for: indexPath)
        cell.textLabel?.text = state.getTitle(at: indexPath.row);
        return cell
    }
}

// MARK: - Backgound View
final class BackgroundView: UIView {
    // MARK: - Internal Properties
    lazy var textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 40.0)
        label.textColor = UIColor.white
        return label
    }()
    
    // MARK: - Designated Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textLabel.sizeToFit()
        textLabel.center = CGPoint(x: bounds.midX, y: bounds.midY)
    }
}
