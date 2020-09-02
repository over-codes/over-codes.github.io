<!-- @template "post.html" -->
<!-- @title "Table driven tests in Rust" -->

Table driven tests are a valuable testing technique in many places; it is a method
of describing the inputs and expected outputs of a function under test such that
all of the logic of the test, the reptitive part, remains consistent. In Rust,
the best way to do this is a macro (according to at least a few strangers on the
internet!). However, generalizing this macro is a bit hard, so it might be easier
to use a formula and construct your own.

Let's say we had a function, `fn fib(n: i64) -> Result&lt;usize, String&gt;`.
We might want to test it with the inputs 1, 2, 10, -2, and so on. We could write a new
test case for each input, but that's a low of boiler plate, so instead, let's write a small
macro:

```
#[cfg(test)]
mod tests {
    use super::*;
    macro_rules! fib_test {
        ($suite:ident, $($name:ident: $input:expr, $output:expr,)*) => {
            mod $suite {
                use std::error::Error;
            
                use super::*;
                $(
                    #[test]
                    fn $name() -> Result<(), Box<dyn Error>> {
                        let out = fib($input)?;
                        assert_eq!($output, out);
                        Ok(())
                    }
                )*
            }
        }
    }

    fib_test!(my_tests,
        basic: 1, 1,
        fifth: 5, 8,
    );
}
```

This lets us pretty easily test the positive case; but what if we were passed a negative
number? In such cases, it is often easier to test that we were given an error in a seperate
test suite, instead of adding logic to test that in the positive case. For example:

```
    macro_rules! fib_neg_test {
        ($suite:ident, $($name:ident: $input:expr,)*) => {
            mod $suite {
                use super::*;
                $(
                    #[test]
                    fn $name() {
                        let out = fib($input);
                        assert_eq!(true, out.is_err());
                    }
                )*
            }
        }
    }

    fib_neg_test!(my_neg_tests,
        neg_one: -1,
        neg_10: -10,
    );
```

For both of these tests, you will need to adjust the number of expected inputs/outputs,
which is why it is hard to generalize, but using the above as a starting point shouldn't
be too bad! Good luck!