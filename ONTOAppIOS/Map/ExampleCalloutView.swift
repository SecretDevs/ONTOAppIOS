//
// Created by Ivanov Ivan on 28.11.2020.
// Copyright (c) 2020 ___FULLUSERNAME___. All rights reserved.
//

import UIKit
import MapKit

protocol ExampleCalloutViewDelegate: class {
    func mapView(_ mapView: MKMapView, didTapDetailsButton button: UIButton, for annotation: MKAnnotation)
}

/// Callout that shows title and subtitle
///
/// This is concrete subclass of `CalloutView` that has two labels. Note, to
/// have the callout resized appropriately, all this class needed to do was
/// update is the constraints between these two labels (which have intrinsic
/// sizes based upon the text contained therein) and the `contentView`.
/// Autolayout takes care of everything else.
///
/// Note, I've added observers for the `title` and `subtitle` properties of
/// the annotation view. Generally you don't need to worry about that, but it
/// can be useful if you're retrieving details about the annotation asynchronously
/// but you want to show the pin while that's happening. You just want to make sure
/// that when the annotation's relevant properties are retrieved, that we update
/// this callout view (if it's being shown at all).

class ExampleCalloutView: CalloutView {

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .callout)

        return label
    }()

    private var addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .caption1)

        return label
    }()

    private var phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .caption1)

        return label
    }()

    private var mondayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .caption1)

        return label
    }()

    private var tuesdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .caption1)

        return label
    }()

    private var wednesdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .caption1)

        return label
    }()

    private var thursdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .caption1)

        return label
    }()

    private var fridayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .caption1)

        return label
    }()

    private var saturdayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .caption1)

        return label
    }()

    private var sundayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .preferredFont(forTextStyle: .caption1)

        return label
    }()

    /*private var detailsButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Details", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 3

        return button
    }()*/

    override init(annotation: MKAnnotation) {
        super.init(annotation: annotation)

        configure()

        updateContents(for: annotation)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Should not call init(coder:)")
    }

    /// Update callout contents

    private func updateContents(for annotation: MKAnnotation) {
        if let customAnnotation = annotation as? ShopPointAnnotation {
            titleLabel.text = customAnnotation.title ?? "Unknown"
            addressLabel.text = customAnnotation.address ?? "Unknown"
            phoneLabel.text = customAnnotation.phone ?? "Unknown"
            mondayLabel.text = "ПН 9:00-21:00"
            tuesdayLabel.text = "ВТ 9:00-21:00"
            wednesdayLabel.text = "СР 9:00-21:00"
            thursdayLabel.text = "ЧТ 9:00-21:00"
            fridayLabel.text = "ПТ 9:00-21:00"
            saturdayLabel.text = "СБ 9:00-21:00"
            sundayLabel.text = "ВС 9:00-21:00"
        }
    }

    /// Add constraints for subviews of `contentView`

    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(titleLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(mondayLabel)
        contentView.addSubview(tuesdayLabel)
        contentView.addSubview(wednesdayLabel)
        contentView.addSubview(thursdayLabel)
        contentView.addSubview(fridayLabel)
        contentView.addSubview(saturdayLabel)
        contentView.addSubview(sundayLabel)
        //contentView.addSubview(detailsButton)
        //detailsButton.addTarget(self, action: #selector(didTapDetailsButton(_:)), for: .touchUpInside)

        let views: [String: UIView] = [
            "titleLabel": titleLabel,
            "addressLabel": addressLabel,
            "phoneLabel": phoneLabel,
            "mondayLabel": mondayLabel,
            "tuesdayLabel": tuesdayLabel,
            "wednesdayLabel": wednesdayLabel,
            "thursdayLabel": thursdayLabel,
            "fridayLabel": fridayLabel,
            "saturdayLabel": saturdayLabel,
            "sundayLabel": sundayLabel
            //"detailsButton": detailsButton
        ]

        let vflStrings = [
            "V:|-[titleLabel]-[addressLabel]-[phoneLabel]-[mondayLabel]-[tuesdayLabel]-[wednesdayLabel]-[thursdayLabel]-[fridayLabel]-[saturdayLabel]-[sundayLabel]-|",
            "H:|-[titleLabel]-|",
            "H:|-[addressLabel]-|",
            "H:|-[phoneLabel]-|",
            "H:|-[mondayLabel]-|",
            "H:|-[tuesdayLabel]-|",
            "H:|-[wednesdayLabel]-|",
            "H:|-[thursdayLabel]-|",
            "H:|-[fridayLabel]-|",
            "H:|-[saturdayLabel]-|",
            "H:|-[sundayLabel]-|"
            //"H:|-[detailsButton]-|"
        ]

        for vfl in vflStrings {
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: vfl, metrics: nil, views: views))
        }
    }

    // This is an example method, defined by `CalloutView`, which is called when you tap on the callout
    // itself (but not one of its subviews that have user interaction enabled).

    override func didTouchUpInCallout(_ sender: Any) {
        print("didTouchUpInCallout")
    }

    /// Callout detail button was tapped
    ///
    /// This is an example action method for tapping the button we added in this subclass.
    /// You'd probably either have a button like this method, or not have a button and use
    /// the above `didTouchUpCallout`, above, but not both. But I'm showing both, so you
    /// can pick whichever you prefer.
    ///
    /// If you want the view controller to do something when you tap on the button, you would:
    ///
    ///  - Want to declare a protocol to which your map view delegate will conform; and
    ///  - Actually see if map view's delegate conforms to this protocol and, if so, call the method.
    ///
    /// - Parameter sender: The button we tapped on in the callout.

    @objc func didTapDetailsButton(_ sender: UIButton) {
        if let mapView = mapView, let delegate = mapView.delegate as? ExampleCalloutViewDelegate {
            delegate.mapView(mapView, didTapDetailsButton: sender, for: annotation!)
        }
    }

    /// Map view
    ///
    /// Navigate up view hierarchy until we find `MKMapView`.

    var mapView: MKMapView? {
        var view = superview
        while view != nil {
            if let mapView = view as? MKMapView { return mapView }
            view = view?.superview
        }
        return nil
    }
}

