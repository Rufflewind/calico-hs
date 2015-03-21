calico-hs
=========

**Quick links:** [documentation][doc]

An experimental prelude library.

Using this prelude
------------------

There are two ways to do this.

### As a library: suitable for executables

You can build this as an ordinary library using Cabal:

    git clone https://github.com/Rufflewind/calico-hs
    cd calico-hs
    cabal install

Afterwards, all you have to do is to

    import Calico

and you'll get everything *and* the kitchen sink.

This approach is suitable for writing executables and rapid
development/prototyping.  It will bring in a lot of dependencies, however.

### By embedding: suitable for libraries

Assuming you're already inside your project directory, run

    git submodule add https://github.com/Rufflewind/calico-hs calico

and then append `calico` to `hs-source-dirs` in the `.cabal` file.  Then
create your customized prelude module that imports the modules that you care
about.  Be sure to include the relevant modules in `other-modules` of the
`.cabal` file as well.

This approach is suitable for writing libraries as it gives you more
flexibility in the choice of dependencies.

[doc]: https://rufflewind.com/calico-hs
