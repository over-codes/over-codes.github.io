<!-- @template "home.html" -->
<!-- @title "The blog of an over-coder" -->
# Blog

## Recent posts

[gRPC in Rust](rust-grpc.html)

[Using an Android tablet for software development](using-android-tablet-as-dev.html)

[Way of the Gopher -- Lesson 1](https://htmlpreview.github.io/?https://github.com/over-codes/way-of-the-gopher/blob/main/slides/lesson01_journey_begins/presentation.html#slide1); the starting of a tutorial to get people started with Go as their first programming language!

[My tools](tools.html); a short summary of the tools I'm using in my day to day. Nerds might find this interesting, even if most people don't :).

[Voting 2020](election-2020.html)

## Welcome to my humble beginnings
And so a new life begins; I created this alter ego so I can speak more freely without worry
of what friends, family, and most importantly, work, thinks. I aim to maintain a clear
seperation of my real life from this account, but, if you do know me, I might share things
with you which could lead to this blog. Welcome.

First and foremost, I have grown and realized there is more to life than code, even though I
still consider code a fundamental part of my life. This blog is about me speaking, on whatever
topics I wish (but, spoiler alert, it will be mostly technical). The first order of business
is to create some rules about how I will approach writing software. Why? I am well-known for
starting things which I don't finish, and it would be nice to avoid that trap (again). So,
some simple rules for my projects on this account:

- Keep the scope small; no project should take longer than a weekend to complete. If I think
    I need to write something larger than that, I should break it apart.
- Once a project is finished, I should never have to touch it again. The greatest cost in software
    development is maintainence. I should do my best to write software once, the right away, and
    never reopen a project after I have marked it as complete.
- When possible, reuse rather than redo. This goes for both reusing of my projects, and reusing
    well-known projects where it is reasonable. This rule is a bit more fungible though, since half
    the fun of coding is writing something, and if I spend all my time looking at existing solutions,
    I'll never get too write.

With those rules in mind, my first task is already very obvious. I need a tool to generate my
Github pages (aka, this blog) for me. Ideally, most of the content I write should be content and not
markup, so naturally, we will roll with markdown as the authoring language. At this point, I don't want
to bother with a hosting solution, so we will just generate HTML files which get uploaded to Github.
So, step 1, write a Markdown parser, and step 2, write something to use that markdown parser along with a template
file to generate meaningful HTML.

And already, we break rule 3. There are a TON of Markdown parsers out there, but most of them seem to go
from Markdown to some other language (HTML), which tend to make them not super extensible. I'm also aware
of some pretty well-known tools (Jekll) which are often used for this purpose, but I hate Ruby.

Over-codes Markdown parser (oc-markdown) is a Markdown parser written in Rust which produces a AST that
can be in other software to render markdown.

## Markdown is terrible

It turns out Markdown is stupid complex to implement, with a ton of edge conditions and annoying
little gotchas. There is no way I can implement this by myself, in a weekend, in a way that won't
have issues. But! Looking at Rust, there seems to be a decent solution already out there that exposes
the AST for me to do things with! It's called pulldown-cmark, and seems to be perfect for what I want.

Plan revision: write a wrapper for pulldown-cmark which allows me to add metadata at the front
of each Markdown file describing things like title, publish date, etc.. It should also scan a folder
and generate HTML for each markdown file which keeps a consistent theme across all markdown files.

## Tech-tips

[Table driven tests in Rust](rust-table-driven-tests.html); Table driven tests are a valuable
testing technique in many places; it is a method of describing the inputs and expected outputs
of a function under test such that all of the logic of the test, the reptitive part, remains consistent.
In Rust, the best way to do this is a macro (according to at least a few strangers on the
internet!). However, generalizing this macro is a bit hard, so it might be easier
to use a formula and construct your own.

[My tools](tools.html); a short summary of the tools I'm using in my day to day. Nerds might find this interesting, even if most people don't :).

## My projects

- oc-genblog -- a tool to convert Markdown files to HTML. Status: v1
- oc-markdown -- a markdown parser written in Rust. Status: aborted