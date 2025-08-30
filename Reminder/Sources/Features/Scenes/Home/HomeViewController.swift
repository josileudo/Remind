//
//  HomeViewController.swift
//  Reminder
//
//  Created by Josileudo on 20/08/25.
//

import UIKit

class HomeViewController: UIViewController {
    let contentView: HomeView
    private weak var flowDelegate: HomeFlowDelegate?
    
    init(contentView: HomeView, flowDelegate: HomeFlowDelegate) {
        self.contentView = contentView
        self.flowDelegate = flowDelegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupBindView()
        setupUI()
    }
    
    private func setupBindView(){
         
    }
    
    private func setupUI(){
        self.view.addSubview(contentView)
        self.view.backgroundColor = Colors.primaryGrayBase
        self.navigationController?.navigationBar.isHidden = true
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        buildHierarchy()
    }
    
    private func buildHierarchy() {        
        setupContentViewToBounds(contentView: contentView)
    }
}
