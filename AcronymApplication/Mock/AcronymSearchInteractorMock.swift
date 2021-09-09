//
//  AcronymSearchInteractorMock.swift
//  AcronymApplication
//


import Foundation
class AcronymSearchInteractorMock: AcronymSearchInteractable {
    var isgetAcronymListCalled: Bool = false
    func getAcronymList(searchStr: String) {
        isgetAcronymListCalled = true
    }
}
