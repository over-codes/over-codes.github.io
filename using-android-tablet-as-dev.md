<!-- @template "post.html" -->
<!-- @title "Using an Android tablet for software development" -->

So, let's suppose you don't have access to a traditional computer (laptop, desktop); how can you learn to code?
Well, it's going to be a bit more difficult that if you had a normal PC, but it can be done on an Android tablet.

To actually learn to code, please take a look at the Way of the Gopher lessons I've been working on. But, instead of
downloading and installing all the tools I talk about in those lessons, refer to this guide. One quick tidbit though;

You need a keyboard and mouse.

Yep. You pretty much need one, or this is going to be very painful for you. It can be done, but please don't. You'll
hate it. Get a cheap bluetooth keyboard/mouse combo, or connect a USB keyboard to your device using an adapter.

Do note though, to copy-paste into Termux, simply hold the left-mouse button down and you will be presented with a
context menu that includes paste. Or, just press with your finger till that menu appears.

## Install Termux

[Termux] is an app which gives you access to a Linux shell. It supports a small package manager, which we will use
in setting things up, and is just a really cool tool. Once you install this from the Store, open and it move on.

[Termux]: https://termux.com/

## Install golang and git

Once you have a shell open (which looks like [this](assets/tmux-screenshot.jpg)), simply type in:

    pkg install golang

then hit enter. This will install the Go compiler. After that, install git:

    pkg install git

We don't need git just yet, but we should now be able to run some Go code.
Below, hit enter after each line; you shouldn't get anything printed back to you until the last step.
If you get a message of some kind, you likely made a type and should try typing that line again.

    mkdir -p ~/go/src/over-codes/hello
    cd ~/go/src/over-codes/hello
    cat <<EOF > main.go
    package main

    import "fmt"

    func main() {
        fmt.Printf("Hello world!\n")
    }
    EOF
    go run .

And hopefully, you see 'Hello world' printed to the screen. Nice.

## Select an editor

In the Way of the Gopher tutorial, I talk about using vscode for editing. We don't have that option
on Android, and due to the way Android security works, there are no really easy ways to get an editor that does
live in your terminal. You could follow the Termux instructions to setup a window manager, but that is a moderate
amount of work. Instead, I suggest you pick and learn one of these editors.

### VIM

VIM is my personal favorite, but there is a learning curve. To get started, install it:

    pkg install vim

Then open vim, and follow the tutorial (it'll tell you type :help, do it)

    vim

To edit a file (after you have it figured out), run:

    vim main.go

Optionally, install vim-go to get a buncha nifty utilities. I suggest you wait on this until you feel confident in
writing some code and navigating the Linux terminal.

### Emacs

Emacs is another really really good editor, but it is a bit bigger than VIM. To use it, install it:

    pkg install emacs

Then run it and follow the on-screen tutorial

    emacs

Optionally, you can install go-mode and a bunch of other utilities from Melpa. I suggest you wait on this until you
feel confident in writing some code and navigating the Linux terminal.

### Nano

Nano is one of the easiest terminal editors to use. You open a file, move the cursor around with the arrow keys, and
type stuff. You press 'ctrl + s' to save, 'ctrl + x' to exit, things like that.

    pkg install nano

And run it with:

    nano

## Profit?

At this point, you should be able to follow the tutorials. I haven't figured out a good way to copy-paste into termux, which
makes some things harder, but you might be able to figure it out.