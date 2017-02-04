//
//  ViewController.swift
//  UNITHON4TH
//
//  Created by SANGDONKIM on 2017. 2. 3..
//  Copyright © 2017년 SANGDONKIM. All rights reserved.
//

import UIKit
import Material
import GoogleMaps
import CoreLocation
import MapKit


class MainViewController: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {
    fileprivate var menuButton : IconButton!
    fileprivate var searchButton : IconButton!
    fileprivate var textButton : FlatButton!
    
    var btnMyLocation: UIButton?
    var btnMagnify:    UIButton?
    var btnReduce:     UIButton?
    var btnMoveFilter: UIButton?
    var myLocationMarker: GMSMarker?
    var currentZoom: Int = 0
    
    //locaiton
    var locationManager = CLLocationManager()
    var mapView: GMSMapView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareTabBarItem(title: "교환정보", image: Icon.check!, selected: Icon.close!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareBasicUI()
        
        //= GMSMapView.mapWithFrame(CGRectZero, camera:camera)
        //mylocation request
        self.locationManager = CLLocationManager()
        locationManager.delegate = self
        self.locationManager.requestLocation()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        self.currentZoom = 14
        
        let camera = GMSCameraPosition.camera(withLatitude: -33.86,
                                              longitude: 151.20, zoom: Float(self.currentZoom))
        self.mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        //mapView?.isMyLocationEnabled = true
        self.view = self.mapView
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = self.mapView
        
        
        //filter
        self.btnMoveFilter = UIButton()
        self.btnMoveFilter?.frame = CGRect(x: 22.0, y: App.Size.screenHeight - 160, width: 30, height: 30)
        self.btnMoveFilter?.addTarget(self, action: #selector(moveFilterPage), for: .touchUpInside)
        self.btnMoveFilter?.setImage(UIImage(named: "btn-filter"), for: UIControlState())
        self.view.addSubview(self.btnMoveFilter!)
        
        //reduce
        self.btnReduce = UIButton()
        self.btnReduce?.frame = CGRect(x: 22.0, y: (self.btnMoveFilter?.frame.origin.y)! - 40, width: 30, height: 30)
        self.btnReduce?.addTarget(self, action: #selector(mapReduce), for: .touchUpInside)
        self.btnReduce?.setImage(UIImage(named: "btn-reduce"), for: UIControlState())
        self.view.addSubview(self.btnReduce!)
        
        //magnify
        self.btnMagnify = UIButton()
        self.btnMagnify?.frame = CGRect(x: 22.0, y: (self.btnReduce?.frame.origin.y)! - 40, width: 30, height: 30)
        self.btnMagnify?.addTarget(self, action: #selector(mapMagnify), for: .touchUpInside)
        self.btnMagnify?.setImage(UIImage(named: "btn-magnify"), for: UIControlState())
        self.view.addSubview(self.btnMagnify!)
        
        //menu button set
        self.btnMyLocation = UIButton()
        self.btnMyLocation?.frame = CGRect(x: 22.0, y: (self.btnMagnify?.frame.origin.y)! - 40, width: 30, height: 30)
        self.btnMyLocation?.addTarget(self, action: #selector(moveMyLocation), for: .touchUpInside)
        self.btnMyLocation?.setImage(UIImage(named: "btn-move-mylocation"), for: UIControlState())
        self.view.addSubview(self.btnMyLocation!)
    }
    
    func moveMyLocation() {
        self.locationManager.requestLocation()
        self.locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    func mapReduce() {
        self.currentZoom -= 1
        self.mapView?.animate(toZoom: Float(self.currentZoom))
    }
    func mapMagnify() {
        self.currentZoom += 1
        self.mapView?.animate(toZoom: Float(self.currentZoom))
    }
    func moveFilterPage() {
        self.performSegue(withIdentifier: "moveFilterViewController", sender: self)
    }
    
    fileprivate func prepareBasicUI() {
        menuButton = prepareMenuButton()
        
        searchButton = prepareIconButton(icon: Icon.search!)
        searchButton.addTarget(self, action: #selector(onSearchBtnClicked), for: .touchUpInside)
        
        textButton = prepareTextButton(with: "Test")
        textButton.addTarget(self, action: #selector(onTestBtnClicked), for: .touchUpInside)
        
        prepareNavigationItems(left : [menuButton], right : [textButton, searchButton])
        prepareTitle(with : "교환정보")
        prepareTabBarItem(title: "교환정보", image: Icon.check!, selected: Icon.close!)
    }
    
    @objc func onSearchBtnClicked() {
        print("Search")
    }
    
    @objc func onTestBtnClicked() {
        print("Test")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate
        let camera = GMSCameraPosition.camera(withLatitude: locValue.latitude,
                                              longitude: locValue.longitude, zoom: Float(self.currentZoom))
        self.mapView?.camera = camera
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        if self.myLocationMarker == nil {
            self.myLocationMarker = GMSMarker()
            self.myLocationMarker?.position = CLLocationCoordinate2DMake(locValue.latitude, locValue.longitude)
            //        marker.title = "Sydney"
            //        marker.snippet = "Australia"
            self.myLocationMarker?.icon = UIImage(named: "my_position")
            self.myLocationMarker?.map = self.mapView
        }
        
        manager.stopUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to find user's location: \(error.localizedDescription)")
    }
    
    func qwer() {
        
    }
    
    func setFillter () {
        
    }
}
