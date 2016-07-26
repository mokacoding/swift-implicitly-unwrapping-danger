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

// The problem with implicitly unwrapping is that if for some reason... 🔥
