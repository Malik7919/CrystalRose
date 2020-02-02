//
//  URLs.swift
//  CrystalRoseTask
//
//  Created by Tech Labs on 12/11/19.
//  Copyright © 2019 Tech Labs. All rights reserved.

import Foundation

struct APIServiceUrl {
    static let main = "https://cpanels.shop/beauty/api/"
    static let mainProfessions = main + endPoint.GetMainProfessions.rawValue
    static let subProfessions = main + endPoint.GetSubProfessions.rawValue
}
enum APIServiceError : Error {
    case invalidURL
    case invalidResponse
}
enum endPoint: String {
    case GetMainProfessions
    case GetSubProfessions
}
enum HTTPStatusCodes: Int {
       // 100 Informational
       case Continue = 100
       case SwitchingProtocols
       case Processing
       // 200 Success
       case OK = 200
       case Created
       case Accepted
       case NonAuthoritativeInformation
       case NoContent
       case ResetContent
       case PartialContent
       case MultiStatus
       case AlreadyReported
       case IMUsed = 226
       // 300 Redirection
       case MultipleChoices = 300
       case MovedPermanently
       case Found
       case SeeOther
       case NotModified
       case UseProxy
       case SwitchProxy
       case TemporaryRedirect
       case PermanentRedirect
       // 400 Client Error
       case BadRequest = 400
       case Unauthorized
       case PaymentRequired
       case Forbidden
       case NotFound
       case MethodNotAllowed
       case NotAcceptable
       case ProxyAuthenticationRequired
       case RequestTimeout
       case Conflict
       case Gone
       case LengthRequired
       case PreconditionFailed
       case PayloadTooLarge
       case URITooLong
       case UnsupportedMediaType
       case RangeNotSatisfiable
       case ExpectationFailed
       case ImATeapot
       case MisdirectedRequest = 421
       case UnprocessableEntity
       case Locked
       case FailedDependency
       case UpgradeRequired = 426
       case PreconditionRequired = 428
       case TooManyRequests
       case RequestHeaderFieldsTooLarge = 431
       case UnavailableForLegalReasons = 451
       // 500 Server Error
       case InternalServerError = 500
       case NotImplemented
       case BadGateway
       case ServiceUnavailable
       case GatewayTimeout
       case HTTPVersionNotSupported
       case VariantAlsoNegotiates
       case InsufficientStorage
       case LoopDetected
       case NotExtended = 510
       case NetworkAuthenticationRequired
   }
