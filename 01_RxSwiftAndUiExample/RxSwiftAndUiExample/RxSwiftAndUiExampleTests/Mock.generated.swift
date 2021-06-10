// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



// Generated with SwiftyMocky 4.0.4

import SwiftyMocky
import XCTest
import Foundation
import RxSwift
import SwiftyUserDefaults
@testable import RxSwiftAndUiExample


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





    open func setApiAuthenticatedToken(_ token: String) -> Completable {
        addInvocation(.m_setApiAuthenticatedToken__token(Parameter<String>.value(`token`)))
		let perform = methodPerformValue(.m_setApiAuthenticatedToken__token(Parameter<String>.value(`token`))) as? (String) -> Void
		perform?(`token`)
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_setApiAuthenticatedToken__token(Parameter<String>.value(`token`))).casted()
		} catch {
			onFatalFailure("Stub return value not specified for setApiAuthenticatedToken(_ token: String). Use given")
			Failure("Stub return value not specified for setApiAuthenticatedToken(_ token: String). Use given")
		}
		return __value
    }

    open func clearApiAuthenticatedToken() -> Completable {
        addInvocation(.m_clearApiAuthenticatedToken)
		let perform = methodPerformValue(.m_clearApiAuthenticatedToken) as? () -> Void
		perform?()
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_clearApiAuthenticatedToken).casted()
		} catch {
			onFatalFailure("Stub return value not specified for clearApiAuthenticatedToken(). Use given")
			Failure("Stub return value not specified for clearApiAuthenticatedToken(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_setApiAuthenticatedToken__token(Parameter<String>)
        case m_clearApiAuthenticatedToken

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_setApiAuthenticatedToken__token(let lhsToken), .m_setApiAuthenticatedToken__token(let rhsToken)):
				var results: [Matcher.ParameterComparisonResult] = []
				results.append(Matcher.ParameterComparisonResult(Parameter.compare(lhs: lhsToken, rhs: rhsToken, with: matcher), lhsToken, rhsToken, "_ token"))
				return Matcher.ComparisonResult(results)

            case (.m_clearApiAuthenticatedToken, .m_clearApiAuthenticatedToken): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case let .m_setApiAuthenticatedToken__token(p0): return p0.intValue
            case .m_clearApiAuthenticatedToken: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_setApiAuthenticatedToken__token: return ".setApiAuthenticatedToken(_:)"
            case .m_clearApiAuthenticatedToken: return ".clearApiAuthenticatedToken()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func setApiAuthenticatedToken(_ token: Parameter<String>, willReturn: Completable...) -> MethodStub {
            return Given(method: .m_setApiAuthenticatedToken__token(`token`), products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func clearApiAuthenticatedToken(willReturn: Completable...) -> MethodStub {
            return Given(method: .m_clearApiAuthenticatedToken, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func setApiAuthenticatedToken(_ token: Parameter<String>, willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_setApiAuthenticatedToken__token(`token`), products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
        public static func clearApiAuthenticatedToken(willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_clearApiAuthenticatedToken, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func setApiAuthenticatedToken(_ token: Parameter<String>) -> Verify { return Verify(method: .m_setApiAuthenticatedToken__token(`token`))}
        public static func clearApiAuthenticatedToken() -> Verify { return Verify(method: .m_clearApiAuthenticatedToken)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func setApiAuthenticatedToken(_ token: Parameter<String>, perform: @escaping (String) -> Void) -> Perform {
            return Perform(method: .m_setApiAuthenticatedToken__token(`token`), performs: perform)
        }
        public static func clearApiAuthenticatedToken(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_clearApiAuthenticatedToken, performs: perform)
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





    open func getFirstTimeMainOpenStatus() -> Single<Bool> {
        addInvocation(.m_getFirstTimeMainOpenStatus)
		let perform = methodPerformValue(.m_getFirstTimeMainOpenStatus) as? () -> Void
		perform?()
		var __value: Single<Bool>
		do {
		    __value = try methodReturnValue(.m_getFirstTimeMainOpenStatus).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getFirstTimeMainOpenStatus(). Use given")
			Failure("Stub return value not specified for getFirstTimeMainOpenStatus(). Use given")
		}
		return __value
    }

    open func setFirstTimeMainOpenFalse() -> Completable {
        addInvocation(.m_setFirstTimeMainOpenFalse)
		let perform = methodPerformValue(.m_setFirstTimeMainOpenFalse) as? () -> Void
		perform?()
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_setFirstTimeMainOpenFalse).casted()
		} catch {
			onFatalFailure("Stub return value not specified for setFirstTimeMainOpenFalse(). Use given")
			Failure("Stub return value not specified for setFirstTimeMainOpenFalse(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getFirstTimeMainOpenStatus
        case m_setFirstTimeMainOpenFalse

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getFirstTimeMainOpenStatus, .m_getFirstTimeMainOpenStatus): return .match

            case (.m_setFirstTimeMainOpenFalse, .m_setFirstTimeMainOpenFalse): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getFirstTimeMainOpenStatus: return 0
            case .m_setFirstTimeMainOpenFalse: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getFirstTimeMainOpenStatus: return ".getFirstTimeMainOpenStatus()"
            case .m_setFirstTimeMainOpenFalse: return ".setFirstTimeMainOpenFalse()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getFirstTimeMainOpenStatus(willReturn: Single<Bool>...) -> MethodStub {
            return Given(method: .m_getFirstTimeMainOpenStatus, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func setFirstTimeMainOpenFalse(willReturn: Completable...) -> MethodStub {
            return Given(method: .m_setFirstTimeMainOpenFalse, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getFirstTimeMainOpenStatus(willProduce: (Stubber<Single<Bool>>) -> Void) -> MethodStub {
            let willReturn: [Single<Bool>] = []
			let given: Given = { return Given(method: .m_getFirstTimeMainOpenStatus, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Bool>).self)
			willProduce(stubber)
			return given
        }
        public static func setFirstTimeMainOpenFalse(willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_setFirstTimeMainOpenFalse, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getFirstTimeMainOpenStatus() -> Verify { return Verify(method: .m_getFirstTimeMainOpenStatus)}
        public static func setFirstTimeMainOpenFalse() -> Verify { return Verify(method: .m_setFirstTimeMainOpenFalse)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getFirstTimeMainOpenStatus(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getFirstTimeMainOpenStatus, performs: perform)
        }
        public static func setFirstTimeMainOpenFalse(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_setFirstTimeMainOpenFalse, performs: perform)
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





    open func getCurrentQuestionnaireStatus() -> Single<Bool> {
        addInvocation(.m_getCurrentQuestionnaireStatus)
		let perform = methodPerformValue(.m_getCurrentQuestionnaireStatus) as? () -> Void
		perform?()
		var __value: Single<Bool>
		do {
		    __value = try methodReturnValue(.m_getCurrentQuestionnaireStatus).casted()
		} catch {
			onFatalFailure("Stub return value not specified for getCurrentQuestionnaireStatus(). Use given")
			Failure("Stub return value not specified for getCurrentQuestionnaireStatus(). Use given")
		}
		return __value
    }

    open func setQuestionnaireStatusTrue() -> Completable {
        addInvocation(.m_setQuestionnaireStatusTrue)
		let perform = methodPerformValue(.m_setQuestionnaireStatusTrue) as? () -> Void
		perform?()
		var __value: Completable
		do {
		    __value = try methodReturnValue(.m_setQuestionnaireStatusTrue).casted()
		} catch {
			onFatalFailure("Stub return value not specified for setQuestionnaireStatusTrue(). Use given")
			Failure("Stub return value not specified for setQuestionnaireStatusTrue(). Use given")
		}
		return __value
    }


    fileprivate enum MethodType {
        case m_getCurrentQuestionnaireStatus
        case m_setQuestionnaireStatusTrue

        static func compareParameters(lhs: MethodType, rhs: MethodType, matcher: Matcher) -> Matcher.ComparisonResult {
            switch (lhs, rhs) {
            case (.m_getCurrentQuestionnaireStatus, .m_getCurrentQuestionnaireStatus): return .match

            case (.m_setQuestionnaireStatusTrue, .m_setQuestionnaireStatusTrue): return .match
            default: return .none
            }
        }

        func intValue() -> Int {
            switch self {
            case .m_getCurrentQuestionnaireStatus: return 0
            case .m_setQuestionnaireStatusTrue: return 0
            }
        }
        func assertionName() -> String {
            switch self {
            case .m_getCurrentQuestionnaireStatus: return ".getCurrentQuestionnaireStatus()"
            case .m_setQuestionnaireStatusTrue: return ".setQuestionnaireStatusTrue()"
            }
        }
    }

    open class Given: StubbedMethod {
        fileprivate var method: MethodType

        private init(method: MethodType, products: [StubProduct]) {
            self.method = method
            super.init(products)
        }


        public static func getCurrentQuestionnaireStatus(willReturn: Single<Bool>...) -> MethodStub {
            return Given(method: .m_getCurrentQuestionnaireStatus, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func setQuestionnaireStatusTrue(willReturn: Completable...) -> MethodStub {
            return Given(method: .m_setQuestionnaireStatusTrue, products: willReturn.map({ StubProduct.return($0 as Any) }))
        }
        public static func getCurrentQuestionnaireStatus(willProduce: (Stubber<Single<Bool>>) -> Void) -> MethodStub {
            let willReturn: [Single<Bool>] = []
			let given: Given = { return Given(method: .m_getCurrentQuestionnaireStatus, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Single<Bool>).self)
			willProduce(stubber)
			return given
        }
        public static func setQuestionnaireStatusTrue(willProduce: (Stubber<Completable>) -> Void) -> MethodStub {
            let willReturn: [Completable] = []
			let given: Given = { return Given(method: .m_setQuestionnaireStatusTrue, products: willReturn.map({ StubProduct.return($0 as Any) })) }()
			let stubber = given.stub(for: (Completable).self)
			willProduce(stubber)
			return given
        }
    }

    public struct Verify {
        fileprivate var method: MethodType

        public static func getCurrentQuestionnaireStatus() -> Verify { return Verify(method: .m_getCurrentQuestionnaireStatus)}
        public static func setQuestionnaireStatusTrue() -> Verify { return Verify(method: .m_setQuestionnaireStatusTrue)}
    }

    public struct Perform {
        fileprivate var method: MethodType
        var performs: Any

        public static func getCurrentQuestionnaireStatus(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_getCurrentQuestionnaireStatus, performs: perform)
        }
        public static func setQuestionnaireStatusTrue(perform: @escaping () -> Void) -> Perform {
            return Perform(method: .m_setQuestionnaireStatusTrue, performs: perform)
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

