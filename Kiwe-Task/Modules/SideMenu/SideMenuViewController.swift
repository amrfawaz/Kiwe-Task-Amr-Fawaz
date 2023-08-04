//
//  SideMenuViewController.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 04/08/2023.
//

import UIKit

protocol SideMenuDelegate: AnyObject {
    func openProfile()
    func openTermsAndConditions()
    func logout()
}
class SideMenuViewController: UIViewController {

    enum SideMenuItem: String {
        case profile = "sideMenuProfile"
        case termsAndConditions = "sideMenuNews"
        case logout = "sideMenuPayment"
        
        func getItemName() -> String {
            switch self {
            case .profile:
                return "My Profile"
            case .termsAndConditions:
                return "Terms And Conditions"
            case .logout:
                return "Logout"
            }
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            SideMenuCell.register(on: tableView)
        }
    }
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelHello: UILabel!
    @IBOutlet weak var labelSyndicateName: UILabel!
    @IBOutlet weak var labelMemberNameTitle: UILabel!
    @IBOutlet weak var labelPhoneNumberTitle: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var labelMemberNameValue: UILabel!
    @IBOutlet weak var labelPhoneNumberValue: UILabel!
    
    
    @IBOutlet weak var topView: UIView!
    
    
    private var sideMenuItems = [SideMenuItem]()
    var delegate: SideMenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuItems = [.profile, .termsAndConditions, .logout]
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}


extension SideMenuViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sideMenuItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell", for: indexPath) as? SideMenuCell else {
            return UITableViewCell()
        }
        let item = sideMenuItems[indexPath.row]
        cell.labelItemName.text = item.getItemName()
        cell.imageViewItem.image = UIImage(named: item.rawValue)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch sideMenuItems[indexPath.row] {
        case .profile:
            self.dismiss(animated: false) {
                self.delegate?.openProfile()
            }
        case .logout:
            delegate?.logout()
        case .termsAndConditions:
            self.dismiss(animated: false) {
                self.delegate?.openTermsAndConditions()
            }
        }
    }
}
