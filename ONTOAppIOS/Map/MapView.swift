//
// Created by Ivanov Ivan on 24.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    @ObservedObject var viewModel = MapViewModel()
    let locationManager = CLLocationManager()
    static private var currentView : MKMapView? = nil
    @Binding var isCreated : Bool

    func makeUIView(context: Context) -> MKMapView {
        if MapView.currentView != nil {
            return MapView.currentView!
        }
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.showsUserLocation = true
        MapView.currentView = mapView
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        if !self.isCreated{
            view.delegate = context.coordinator
            for shop in viewModel.shops {
                let annotation = ShopPointAnnotation(address: "address", phone: "+7-999-888-77-33")
                annotation.title = shop.name
                let latitude = shop.location.latitude
                let longitude = shop.location.longitude
                annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
                view.addAnnotation(annotation)
            }
            if !viewModel.shops.isEmpty {
                self.isCreated = true
            }
        }
        view.showsUserLocation = true
        let status = CLLocationManager.authorizationStatus()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()

        if status == .authorizedAlways || status == .authorizedWhenInUse {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
            let location: CLLocationCoordinate2D = locationManager.location!.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
            let region = MKCoordinateRegion(center: location, span: span)
            view.setRegion(region, animated: true)
        }
    }

    func makeCoordinator() -> MapViewCoordinator{
        MapViewCoordinator(self)
    }

    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        var mapViewController: MapView

        init(_ control: MapView) {
            self.mapViewController = control
        }

        func mapView(_ mapView: MKMapView, viewFor
        annotation: MKAnnotation) -> MKAnnotationView?{
            if annotation is MKUserLocation { return nil }

            if #available(iOS 11.0, *) {
                if annotation is MKClusterAnnotation { return nil }
            }

            let customAnnotationViewIdentifier = "MyAnnotation"

            var pin = mapView.dequeueReusableAnnotationView(withIdentifier: customAnnotationViewIdentifier)
            if pin == nil {
                pin = CustomAnnotationView(annotation: annotation, reuseIdentifier: customAnnotationViewIdentifier)
            } else {
                pin?.annotation = annotation
            }
            pin?.image = UIImage(named: "shop_marker")
            return pin
        }
    }


}
