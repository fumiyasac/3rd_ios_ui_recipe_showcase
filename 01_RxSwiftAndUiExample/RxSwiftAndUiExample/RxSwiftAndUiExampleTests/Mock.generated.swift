// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 4.0.4

import SwiftyMocky
import XCTest
import Foundation
import RxSwift
import SwiftyUserDefaults
@testable import RxSwiftAndUiExample


// MARK: - ApiAuthenticatedTokenRepository

open class ApiAuthenticatedTokenRepositoryMock: ApiAuthenticatedTokenRepository, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func find() -> Maybe<ApiAuthenticatedToken> {
        addInvocation(.m_find)
		let perform = methodPerformValue(.m_find) as? () -> Void
		perform?()
		var __value: Maybe<ApiAuthenticatedToken>
		do {
		    __value = try methodReturnValue(.m_find).casted()
		} catch {
			onFatalFailure("Stub return value not specified for find(). Use given")
			Failure("Stub return value not specified for find(). Use given")
		}
		return __value
    }

    open func store(token: ApiAuthenticatedToken) -> Completable {
        addInvocation(.m_store__token_token(Parameter<ApiAuthenticatedToken>.value(`token`)))
		let perform = methodPerformValue(.m_store__token_token(Parameter<ApiAuthenticatedToken>.value(`token`))) as? (ApiAuthenticatedToken) -> Void
		perform?(`token`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_store__token_token(Parameter<ApiAuthenticatedToken>.value(`token`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for store(token: ApiAuthenticatedToken). Use given")
			Failure("Stub return value not specified for store(token: ApiAuthenticatedToken). Use given")
		}
		return __value
    }

    open func clear() -> Completable {
        addInvocation(.m_clear)
		let perform = methodPerformValue(.m_clear) as? () -> Void
		perform?()
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_clear).casted()
		} catch {
			onFatalFailure("Stub return value not specified for clear(). Use given")
			Failure("Stub return value not specified for clear(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_find
        case m_store__token_token(Parameter<ApiAuthenticatedToken>)
        case m_clear

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_find, .m_find): return .match

            case (.m_store__token_token(let lhsToken), .m_store__token_token(let rhsToken)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsToken, rhs: rhsToken, with: matcher), lhsToken, rhsToken, "token"))
				return Matcher.ComparisonResult(results)

            case (.m_clear, .m_clear): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_find: return 0
            case let .m_store__token_token(p0): return p0.intValue
            case .m_clear: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_find: return ".find()"
            case .m_store__token_token: return ".store(token:)"
            case .m_clear: return ".clear()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func find(willReturn: Maybe<ApiAuthenticatedToken>...) -> MethodStub {
            return Given(method: .m_find, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func store(token: Parameter<ApiAuthenticatedToken>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_store__token_token(`token`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func clear(willReturn: Completable...) -> MethodStub {
            return Given(method: .m_clear, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func find(willProduce: (Stubber<Maybe<ApiAuthenticatedToken>>) -> Void) -> MethodStub {
            let willReturn: [Maybe<ApiAuthenticatedToken>] = []
			let given: Given = { return Given(method: .m_find, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Maybe<ApiAuthenticatedToken>).self)
			willProduce(stubber)
			return given
        }
        public static func store(token: Parameter<ApiAuthenticatedToken>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_store__token_token(`token`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
        public static func clear(willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_clear, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func find() -> Verify { return Verify(method: .m_find)}
        public static func store(token: Parameter<ApiAuthenticatedToken>) -> Verify { return Verify(method: .m_store__token_token(`token`))}
        public static func clear() -> Verify { return Verify(method: .m_clear)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func find(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_find, performs: perform)
        }
        public static func store(token: Parameter<ApiAuthenticatedToken>, perform: @escaping (ApiAuthenticatedToken) -> Void) -> Perform {
            return Perform(method: .m_store__token_token(`token`), performs: perform)
        }
        public static func clear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_clear, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - ApiAuthenticatedTokenUserDefault

open class ApiAuthenticatedTokenUserDefaultMock: ApiAuthenticatedTokenUserDefault, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func find() -> Maybe<String> {
        addInvocation(.m_find)
		let perform = methodPerformValue(.m_find) as? () -> Void
		perform?()
		var __value: Maybe<String>
		do {
		    __value = try methodReturnValue(.m_find).casted()
		} catch {
			onFatalFailure("Stub return value not specified for find(). Use given")
			Failure("Stub return value not specified for find(). Use given")
		}
		return __value
    }

    open func store(token: ApiAuthenticatedToken) -> Completable {
        addInvocation(.m_store__token_token(Parameter<ApiAuthenticatedToken>.value(`token`)))
		let perform = methodPerformValue(.m_store__token_token(Parameter<ApiAuthenticatedToken>.value(`token`))) as? (ApiAuthenticatedToken) -> Void
		perform?(`token`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_store__token_token(Parameter<ApiAuthenticatedToken>.value(`token`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for store(token: ApiAuthenticatedToken). Use given")
			Failure("Stub return value not specified for store(token: ApiAuthenticatedToken). Use given")
		}
		return __value
    }

    open func clear() -> Completable {
        addInvocation(.m_clear)
		let perform = methodPerformValue(.m_clear) as? () -> Void
		perform?()
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_clear).casted()
		} catch {
			onFatalFailure("Stub return value not specified for clear(). Use given")
			Failure("Stub return value not specified for clear(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_find
        case m_store__token_token(Parameter<ApiAuthenticatedToken>)
        case m_clear

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_find, .m_find): return .match

            case (.m_store__token_token(let lhsToken), .m_store__token_token(let rhsToken)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsToken, rhs: rhsToken, with: matcher), lhsToken, rhsToken, "token"))
				return Matcher.ComparisonResult(results)

            case (.m_clear, .m_clear): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_find: return 0
            case let .m_store__token_token(p0): return p0.intValue
            case .m_clear: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_find: return ".find()"
            case .m_store__token_token: return ".store(token:)"
            case .m_clear: return ".clear()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func find(willReturn: Maybe<String>...) -> MethodStub {
            return Given(method: .m_find, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func store(token: Parameter<ApiAuthenticatedToken>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_store__token_token(`token`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func clear(willReturn: Completable...) -> MethodStub {
            return Given(method: .m_clear, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func find(willProduce: (Stubber<Maybe<String>>) -> Void) -> MethodStub {
            let willReturn: [Maybe<String>] = []
			let given: Given = { return Given(method: .m_find, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Maybe<String>).self)
			willProduce(stubber)
			return given
        }
        public static func store(token: Parameter<ApiAuthenticatedToken>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_store__token_token(`token`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
        public static func clear(willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_clear, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func find() -> Verify { return Verify(method: .m_find)}
        public static func store(token: Parameter<ApiAuthenticatedToken>) -> Verify { return Verify(method: .m_store__token_token(`token`))}
        public static func clear() -> Verify { return Verify(method: .m_clear)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func find(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_find, performs: perform)
        }
        public static func store(token: Parameter<ApiAuthenticatedToken>, perform: @escaping (ApiAuthenticatedToken) -> Void) -> Perform {
            return Perform(method: .m_store__token_token(`token`), performs: perform)
        }
        public static func clear(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_clear, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - FirstTimeMainOpenStatusUserDefault

open class FirstTimeMainOpenStatusUserDefaultMock: FirstTimeMainOpenStatusUserDefault, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func get() -> Single<Bool> {
        addInvocation(.m_get)
		let perform = methodPerformValue(.m_get) as? () -> Void
		perform?()
		var __value: Single<Bool>
		do {
		    __value = try methodReturnValue(.m_get).casted()
		} catch {
			onFatalFailure("Stub return value not specified for get(). Use given")
			Failure("Stub return value not specified for get(). Use given")
		}
		return __value
    }

    open func changeFalse() -> Completable {
        addInvocation(.m_changeFalse)
		let perform = methodPerformValue(.m_changeFalse) as? () -> Void
		perform?()
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_changeFalse).casted()
		} catch {
			onFatalFailure("Stub return value not specified for changeFalse(). Use given")
			Failure("Stub return value not specified for changeFalse(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_get
        case m_changeFalse

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_get, .m_get): return .match

            case (.m_changeFalse, .m_changeFalse): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_get: return 0
            case .m_changeFalse: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_get: return ".get()"
            case .m_changeFalse: return ".changeFalse()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func get(willReturn: Single<Bool>...) -> MethodStub {
            return Given(method: .m_get, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func changeFalse(willReturn: Completable...) -> MethodStub {
            return Given(method: .m_changeFalse, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func get(willProduce: (Stubber<Single<Bool>>) -> Void) -> MethodStub {
            let willReturn: [Single<Bool>] = []
			let given: Given = { return Given(method: .m_get, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Bool>).self)
			willProduce(stubber)
			return given
        }
        public static func changeFalse(willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_changeFalse, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func get() -> Verify { return Verify(method: .m_get)}
        public static func changeFalse() -> Verify { return Verify(method: .m_changeFalse)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func get(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_get, performs: perform)
        }
        public static func changeFalse(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_changeFalse, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

// MARK: - QuestionnaireStatusUserDefault

open class QuestionnaireStatusUserDefaultMock: QuestionnaireStatusUserDefault, Mock {
    public init(sequencing sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst, stubbing stubbingPolicy: StubbingPolicy = .wrap, file: StaticString = #file, line: UInt = #line) {
        SwiftyMockyTestObserver.setup()
        self.sequencingPolicy = sequencingPolicy
        self.stubbingPolicy = stubbingPolicy
        self.file = file
        self.line = line
    }

    var matcher: Matcher = Matcher.default
    var stubbingPolicy: StubbingPolicy = .wrap
    var sequencingPolicy: SequencingPolicy = .lastWrittenResolvedFirst

    private var queue = DispatchQueue(label: "com.swiftymocky.invocations", qos: .userInteractive)
    private var invocations: [MethodType] = []
    private var methodReturnValues: [Given] = []
    private var methodPerformValues: [Perform] = []
    private var file: StaticString?
    private var line: UInt?

    public typealias PropertyStub = Given
    public typealias MethodStub = Given
    public typealias SubscriptStub = Given

    /// Convenience method - call setupMock() to extend debug information when failure occurs
    public func setupMock(file: StaticString = #file, line: UInt = #line) {
        self.file = file
        self.line = line
    }

    /// Clear mock internals. You can specify what to reset (invocations aka verify, givens or performs) or leave it empty to clear all mock internals
    public func resetMock(_ scopes: MockScope...) {
        let scopes: [MockScope] = scopes.isEmpty ? [.invocation, .given, .perform] : scopes
        if scopes.contains(.invocation) { invocations = [] }
        if scopes.contains(.given) { methodReturnValues = [] }
        if scopes.contains(.perform) { methodPerformValues = [] }
    }





    open func get() -> Single<Bool> {
        addInvocation(.m_get)
		let perform = methodPerformValue(.m_get) as? () -> Void
		perform?()
		var __value: Single<Bool>
		do {
		    __value = try methodReturnValue(.m_get).casted()
		} catch {
			onFatalFailure("Stub return value not specified for get(). Use given")
			Failure("Stub return value not specified for get(). Use given")
		}
		return __value
    }

    open func changeTrue() -> Completable {
        addInvocation(.m_changeTrue)
		let perform = methodPerformValue(.m_changeTrue) as? () -> Void
		perform?()
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_changeTrue).casted()
		} catch {
			onFatalFailure("Stub return value not specified for changeTrue(). Use given")
			Failure("Stub return value not specified for changeTrue(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_get
        case m_changeTrue

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_get, .m_get): return .match

            case (.m_changeTrue, .m_changeTrue): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_get: return 0
            case .m_changeTrue: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_get: return ".get()"
            case .m_changeTrue: return ".changeTrue()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func get(willReturn: Single<Bool>...) -> MethodStub {
            return Given(method: .m_get, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func changeTrue(willReturn: Completable...) -> MethodStub {
            return Given(method: .m_changeTrue, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func get(willProduce: (Stubber<Single<Bool>>) -> Void) -> MethodStub {
            let willReturn: [Single<Bool>] = []
			let given: Given = { return Given(method: .m_get, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Bool>).self)
			willProduce(stubber)
			return given
        }
        public static func changeTrue(willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_changeTrue, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func get() -> Verify { return Verify(method: .m_get)}
        public static func changeTrue() -> Verify { return Verify(method: .m_changeTrue)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func get(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_get, performs: perform)
        }
        public static func changeTrue(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_changeTrue, performs: perform)
        }
    }

    public func given(_ method: Given) {
        methodReturnValues.append(method)
    }

    public func perform(_ method: Perform) {
        methodPerformValues.append(method)
        methodPerformValues.sort { $0.method.intValue() < $1.method.intValue() }
    }

    public func verify(_ method: Verify, count: Count = Count.moreOrEqual(to: 1), file: StaticString = #file, line: UInt = #line) {
        let fullMatches = matchingCalls(method, file: file, line: line)
        let success = count.matches(fullMatches)
        let assertionName = method.method.assertionName()
        let feedback: String = {
            guard !success else { return "" }
            return Utils.closestCallsMessage(
                for: self.invocations.map { invocation in
                    matcher.set(file: file, line: line)
                    defer { matcher.clearFileAndLine() }
                    return MethodType.compareParameters(lhs: invocation, rhs: method.method, matcher: matcher)
                },
                name: assertionName
            )
        }()
        MockyAssert(success, "Expected: \(count) invocations of `\(assertionName)`, but was: \(fullMatches).\(feedback)", file: file, line: line)
    }

    private func addInvocation(_ call: MethodType) {
        self.queue.sync { invocations.append(call) }
    }
    private func methodReturnValue(_ method: MethodType) throws -> StubProduct {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let candidates = sequencingPolicy.sorted(methodReturnValues, by: { $0.method.intValue() > $1.method.intValue() })
        let matched = candidates.first(where: { $0.isValid && MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch })
        guard let product = matched?.getProduct(policy: self.stubbingPolicy) else { throw MockError.notStubed }
        return product
    }
    private func methodPerformValue(_ method: MethodType) -> Any? {
        matcher.set(file: self.file, line: self.line)
        defer { matcher.clearFileAndLine() }
        let matched = methodPerformValues.reversed().first { MethodType.compareParameters(lhs: $0.method, rhs: method, matcher: matcher).isFullMatch }
        return matched?.performs
    }
    private func matchingCalls(_ method: MethodType, file: StaticString?, line: UInt?) -> [MethodType] {
        matcher.set(file: file ?? self.file, line: line ?? self.line)
        defer { matcher.clearFileAndLine() }
        return invocations.filter { MethodType.compareParameters(lhs: $0, rhs: method, matcher: matcher).isFullMatch }
    }
    private func matchingCalls(_ method: Verify, file: StaticString?, line: UInt?) -> Int {
        return matchingCalls(method.method, file: file, line: line).count
    }
    private func givenGetterValue<T>(_ method: MethodType, _ message: String) -> T {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            onFatalFailure(message)
            Failure(message)
        }
    }
    private func optionalGivenGetterValue<T>(_ method: MethodType, _ message: String) -> T? {
        do {
            return try methodReturnValue(method).casted()
        } catch {
            return nil
        }
    }
    private func onFatalFailure(_ message: String) {
        guard let file = self.file, let line = self.line else { return } // Let if fail if cannot handle gratefully
        SwiftyMockyTestObserver.handleFatalError(message: message, file: file, line: line)
    }
}

