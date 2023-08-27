//
//  MainViewModelProtocol.swift
//  Ukraine Defense Tracker
//
//  Created by Artem Tkachenko on 27.08.2023.
//

import Foundation

protocol MainViewModelProtocol {
    var losses: [Loss]? { get }
    func loadData()
    func openWebViewController(with path: WebViewURL)
    func openDetailsViewController(_ loss: Loss)
}
