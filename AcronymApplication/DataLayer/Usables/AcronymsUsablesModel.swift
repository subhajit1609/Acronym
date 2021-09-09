//
//  LongFormUsables.swift
//  AcronymApplication
//


public struct AcronymsUsablesModel: Usable {
    let shortForm : String?
    var longformList: [AcronymModel] = []
}
public struct AcronymModel: Usable {
    let longForm : String?
}
