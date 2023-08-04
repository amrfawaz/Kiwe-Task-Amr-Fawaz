//
//  HomeViewController.swift
//  Kiwe-Task
//
//  Created by Amr Fawaz on 03/08/2023.
//

import UIKit
import MapKit
import SideMenu

class HomeViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!


    // MARK: - Properties
    private var presenter: HomePresenting
    lazy var locationService = LocationService()
    var mapView: MKMapView!
    var tableView: UITableView! {
        didSet {
            if let tableView = tableView {
                VenueCell.register(on: tableView)
            }
        }
    }
    
    
    // MARK: Object lifecycle
    init(presenter: HomePresenting) {
        self.presenter = presenter
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Venues"
        
        let menuItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .plain, target: self, action: #selector(openSideMenu))
        menuItem.tintColor = .white
        self.navigationItem.leftBarButtonItem = menuItem

        
        
        
        
        presenter.viewDelegate = self
        addTableView()
        presenter.getCurrentLocation()
        segmented.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
    }
    
    @objc func segmentedControlValueChanged(sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            removeMapView()
            addTableView()
        case 1:
            removeTableView()
            addMapView()
        default:
            break
        }
    }
    
    private func addMapView() {
        mapView = MKMapView(frame: containerView.bounds)
        mapView.delegate = self
        containerView.addSubview(mapView)
        
        for venue in presenter.venues ?? [] {
            let marker = MKPointAnnotation()
            marker.coordinate = CLLocationCoordinate2D(latitude: venue.location?.lat ?? 0, longitude: venue.location?.lng ?? 0)
            marker.title = venue.name ?? ""
            mapView.addAnnotation(marker)
        }
        let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: presenter.venues?.first?.location?.lat ?? 0, longitude: presenter.venues?.first?.location?.lng ?? 0), latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(region, animated: true)
    }
    
    private func removeMapView() {
        mapView.removeFromSuperview()
        mapView = nil
    }
    
    private func addTableView() {
        tableView = UITableView(frame: containerView.bounds)
        tableView.dataSource = self
        containerView.addSubview(tableView)
        tableView.reloadData()
    }

    private func removeTableView() {
        tableView.removeFromSuperview()
        tableView = nil
    }
    
    @objc private func openSideMenu() {
        let storyboard = UIStoryboard(name: "SideMenu", bundle: nil)
        let sideMenuNavigationController = storyboard.instantiateViewController(withIdentifier: "SideMenuNavigationController") as? SideMenuNavigationController
        
//        (sideMenuNavigationController?.viewControllers.first as? SideMenuViewController)?.delegate = self
        self.present(sideMenuNavigationController!, animated: true, completion: nil)
    }
}



extension HomeViewController: HomeViewDelegate {
    func getVenuesSuccessfully() {
        tableView.reloadData()
    }
    
    func getVenuesFaild(message: String) {
        showMessage(message: "Can't fetch venues", messageType: .error)
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfVenues()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "VenueCell", for: indexPath) as? VenueCell else {
            return UITableViewCell()
        }
        let venue = presenter.venues?[indexPath.row]
        cell.confiure(name: venue?.name ?? "", category: venue?.categories?.first?.shortName ?? "", address: venue?.location?.formattedAddress?.joined() ?? "")
        return cell
    }
}


extension HomeViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }

        let identifier = "markerIdentifier"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            // You can also customize the pin color here if needed.
        } else {
            annotationView?.annotation = annotation
        }

        return annotationView
    }
}
