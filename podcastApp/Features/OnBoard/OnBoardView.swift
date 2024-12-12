//
//  OnBoardView.swift
//  podcastApp
//
//  Created by Hamit Tırpan on 12.12.2024.
//  
//

import UIKit

final class OnBoardView: BaseView<OnBoardViewController> {
    weak var presenter: ViewToPresenterOnBoardProtocol?
    private let onboardImageView: UIImageView = {
        let imageView = UIImageView(image: .imPodcaster)
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let onboardTitleLabel: UILabel = {
        let label = UILabel()
        label.text = LocaleKeys.Onboarding.title.localized
        label.font = ThemeManager.defaultTheme.fontTheme.titleBoldFont
        label.textColor = currentTheme.colorTheme.textColor
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = LocaleKeys.Onboarding.subtitle.localized
        label.numberOfLines = .zero
        label.font = ThemeManager.defaultTheme.fontTheme.titleFont
        label.textAlignment = .center
        return label
    }()
    
    private lazy var listingButton: UIButton = {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.filled()
        
        configuration.title = LocaleKeys.Onboarding.buttonTitle.localized
        configuration.baseBackgroundColor = appTheme.buttonTheme.backgroundColor
        configuration.contentInsets = ButtonPadding.medium.paddingAll
        configuration.background.cornerRadius = ProductRadius.medium.rawValue
        configuration.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = self.appTheme.fontTheme.subTitleFont
            return outgoing
        }
        
        button.addAction(listenAction, for: .touchUpInside)
        button.configuration = configuration
        return button
    }()
    
    lazy var listenAction: UIAction = UIAction { _ in
        self.presenter?.didTapOnBoardButton()
        }
    
    private lazy var columnStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [onboardTitleLabel, subtitleLabel, listingButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    override func setupView() {
        super.setupView()
        setupLayout()
        setupConstraints()
    }
    
    private func setupLayout() {
        addSubview(onboardImageView)
        addSubview(columnStackView)
    }
    
    func setupConstraints() {
        backgroundColor = appTheme.colorTheme.primaryFixedColor
        
        onboardImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(snp.width).multipliedBy(0.7)
            make.height.equalTo(snp.height).multipliedBy(0.4)
        }
        
        columnStackView.snp.makeConstraints { make in
            make.top.equalTo(onboardImageView.snp.bottom).offset(20)
            make.left.right.equalTo(onboardImageView)
        }
        
    }
    
}
