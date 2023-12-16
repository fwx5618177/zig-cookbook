# Zig Cookbook

[![](https://github.com/zigcc/zig-cookbook/actions/workflows/ci.yml/badge.svg)](https://github.com/zigcc/zig-cookbook/actions/workflows/ci.yml)
[![](https://github.com/zigcc/zig-cookbook/actions/workflows/pages.yml/badge.svg)](https://github.com/zigcc/zig-cookbook/actions/workflows/pages.yml)

[Zig cookbook](https://zigcc.github.io/zig-cookbook/) is a collection of simple Zig programs that demonstrate good practices to accomplish common programming tasks.

# How to use

[The website](https://zigcc.github.io/zig-cookbook/) is generated by [mdbook](https://rust-lang.github.io/mdBook/), `mdbook serve` will start a server at `http://localhost:3000` for preview.

Each recipe is accompanied by an illustrative example named after its corresponding sequence number. These examples can be executed using the command `zig build run-{chapter-num}-{sequence-num}`, or `zig build run-all` to execute all.

> Currently Zig 0.11.0 is required to run those examples.

# Contributing

This cookbook is a work in progress, and we welcome contributions from the community. If you have a favorite recipe that you'd like to share, please submit a [pull request](https://github.com/zigcc/zig-cookbook/pulls).

# Acknowledgment

When working on zig-cookbook, we benefit a lot from several similar projects, thanks for their awesome work.

- [Rust Cookbook](https://github.com/rust-lang-nursery/rust-cookbook)

# License

[CC BY-NC-ND 4.0 DEED](https://creativecommons.org/licenses/by-nc-nd/4.0/)