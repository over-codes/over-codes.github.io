<!-- @template "post.html" -->
<!-- @title "gRPC in Rust" -->

I use gRPC a fair amount in the daylight, but with more 'traditional' languages like
Go, Python, and Java (of course, also Bash via grpc_cli, but that hardly counts). As
Rust is one of my favorite languages, every now and again the desire to check the 
how well gRPC is supported in that ecosystem strikes me.

And I gotta say, it's getting good. [tonic] seems to be reasonably mature, even supporting
gRPC reflection (which enables easy grpc_cli usage!).

Using tonic, I was able to build a small service which compiled into a static binary that
could be inserted into a `scratch` docker container and run. I'll outline the broad strokes
here, but please take a look at the code at in [oc-metrics].

## Proto files

At first, I simply created the proto files (see [oc-metrics-proto]) in a directory within my
repository; but, when I went to make a client, it became apparent that wouldn't work. The client
wouldn't be able to get to those proto files unless they downloaded the entire repository, which
is silly.

So I ended movng those into their own repository, and my clients can `git submodule add` that.
Problem solved.

## Saving state

In my last project or two, I've begun the pattern of defining a database abstraction layer (dal)
which contains a `Database` trait, and some supporting structures. This has worked fairly well,
but I got tripped up when trying to figure out how to avoid doing extra allocations when passing
data in to the database, versus pulling it out. In the former case, we usually already have the data,
so want to avoid allocating data and want to prefer passing by reference.

In the latter, we need to fetch the data and return an owned object. This means our structs either need
to be duplicated (ugly! one for values by reference, one for owned), or we use the `std::borrow::Cow`
enum. It took me a few minutes to figure out that was the right type; for some reason, it never crossed my
mind that `copy on write` could also mean `share borrowed or owned values`.

With that solved, everything went fairly smoothly. I write a neat little [migration] system, made sure to
test my database layer (to check for SQL errors), and it seems golden.

## The server

The server was so painless to write, I don't have much to say about it. Other than great job to the tonic team!

[tonic]: https://github.com/hyperium/tonic
[oc-metrics]: https://github.com/over-codes/oc-metrics
[oc-metrics-proto]: https://github.com/over-codes/oc-metrics-proto
[migration]: https://github.com/over-codes/oc-metrics/blob/main/src/dal/migrator/mod.rs