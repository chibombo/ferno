//
//  Application+Testing.swift
//  Async
//
//  Created by Austin Astorga on 5/1/18.
//

import Ferno
import XCTVapor

func launch(_ test: (Application) async throws -> Void) async throws {
    let app = Application(.testing)
    defer { app.shutdown() }
    app.ferno.use(
        .default(
            FernoConfiguration(
                basePath: "database-url",
                email: "service-account-email",
                privateKey: "private-key"
            )
        )
    )
    try await test(app)
}
