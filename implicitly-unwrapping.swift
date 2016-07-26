// This line won't compile, because we cannot make nil something that is not
// Optional.
//
//let wontCompile: String = nil
// error: nil cannot initialize specified type 'String'

// These two line are identical. In fact, `Type?` is short for `Optional<Type>`.
let a: Int? = 1
let b: Optional<Int> = 1

let x: String? = "abc"

// This line won't compile, because we cannot call a method of String when it
// is wrapped inside an Optional. That is for our own safety, it prevents us
// from calling a method on nil.
//x.isEmpty
// error: value of optional type 'Optional<String>' not unwrapped; did you mean to use '!' or '?'?

// This syntax "propagates the optionality": the type of `y` is `Optional<Bool>.`
let y = x?.isEmpty
print(y.dynamicType) // Optional<Bool>

// The bang syntax, `!`, "implicitly unwraps" optional values.
// It tells the compiler "don't worry buddy, this Optional value will never be nil."
// This makes the compiler treat `x` as the wrapped type rather than `Optional`.
let z = x!.isEmpty
print(z.dynamicType) // Bool

// The problem with implicitly unwrapping is that if for some reason the
// assumption made by who wrote the code that the implicitly unwrapped value
// would have never been nil was wrong, and such value actually happens to be
// nil, well then the code will crash.

let sneakyNilValue: Optional<String> = nil
_ = sneakyNilValue!.isEmpty
// fatal error: unexpectedly found nil while unwrapping an Optional value
// Current stack trace:
// 0    libswiftCore.dylib                 0x000000010a2fd730 swift_reportError + 132
// 1    libswiftCore.dylib                 0x000000010a319cf0 _swift_stdlib_reportFatalError + 61
// 2    libswiftCore.dylib                 0x000000010a11e300 specialized specialized StaticString.withUTF8Buffer<A> (invoke : (UnsafeBufferPointer<UInt8>) -> A) -> A + 351
// ...
