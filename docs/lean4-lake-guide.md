# Lean 4 & Lake: A Comprehensive Guide

This document serves as an extended reference for working with [Lean 4](https://leanprover.github.io/) and its official build system, **Lake** (Lean Make). 

It is designed to give both contributors and reviewers a clear understanding of the tooling used in this project, demonstrating a strong grasp of the Lean 4 ecosystem.

---

## What is Lean 4?

Lean 4 is a functional programming language and a theorem prover based on the Calculus of Inductive Constructions. It allows you to:
1. **Write software**: Lean 4 is a fully-fledged, compiled programming language with performance comparable to C or C++.
2. **Prove theorems**: Lean's dependent type system allows you to write formal mathematical proofs and formally verify software correctness.

In this repository, Lean 4 is used to mechanize the theoretical properties of the substitution calculus, ensuring that the defined rules and theorems are mathematically sound and compiler-verified.

## What is Lake?

**Lake** (short for *Lean Make*) is the package manager and build system for Lean 4. It handles everything from fetching dependencies to compiling Lean source files into native executables. 

A standard Lean 4 project is defined by a `lakefile.toml` (or `lakefile.lean`) which specifies the package name, its dependencies, libraries, and executables.

---

## Core Lake Commands

Here is an in-depth look at the main `lake` commands used in a typical workflow.

### 1. `lake build`
This is the most common command. It compiles the current package and all of its dependencies.
- **What it does**: It parses, elaborates, and compiles `.lean` files into `.c` files, which are then compiled into `.o` (object) files by the C compiler, and finally linked together.
- **When to use it**: After cloning the repository, after pulling new changes, or to ensure that everything compiles without errors outside of your editor.

### 2. `lake exe <executable_name>`
Runs a specific executable defined in the `lakefile.toml`.
- **What it does**: It builds the specific `[[lean_exe]]` target and runs the resulting binary.
- **Example**: In this project, running `lake exe LeanSsc` will compile and execute the `Main.lean` entry point.

### 3. `lake clean`
Removes the build directory (usually `.lake/build`).
- **What it does**: Deletes all compiled object files, intermediate C files, and binaries.
- **When to use it**: If you encounter strange caching issues, or if you want to perform a fresh build from scratch to ensure everything is strictly correct.

### 4. `lake update`
Updates the dependencies of the project.
- **What it does**: Modifies the `lake-manifest.json` file to point to the latest commits/versions of the dependencies specified in `lakefile.toml` (such as `mathlib4`), and downloads them.
- **When to use it**: When you need the latest features from an upstream library or when fixing version mismatches.

---

## Interactive Development with Lean 4

Unlike traditional compiled languages, working with Lean 4 is heavily interactive. Lean acts as an LSP (Language Server Protocol) server, providing real-time feedback while you type.

### The VS Code Workflow
1. **Install the Extension**: Ensure you have the `lean4` extension installed in VS Code.
2. **Open a `.lean` file**: When you open any Lean file, the extension automatically starts the Lean language server.
3. **The InfoView Panel**: This is the most important part of developing in Lean. By pressing `Ctrl+Shift+Enter` (or `Cmd+Shift+Enter` on Mac), you can toggle the **Lean InfoView**.
   - As you move your cursor through a proof or a function, the InfoView updates in real-time to show the **current tactic state** (what you are trying to prove and what hypotheses you have), variable types, and error messages.

### Proving and Type Checking
When Lean processes a file, it checks the types of all expressions. If you write a `theorem` and provide a proof using `tactics` (like `intro`, `apply`, `simp`, `rw`), Lean will verify every single step. A file that shows no red squiggly lines in the editor is a file where every theorem has been formally verified as true by the Lean kernel.

---

## Project Structure Overview

A typical Lean project structured by Lake looks like this:

* `lakefile.toml`: The configuration file declaring the package name, executable targets, and external dependencies.
* `lake-manifest.json`: An automatically generated file that locks the exact versions/commits of dependencies to ensure reproducible builds.
* `lean-toolchain`: Specifies the exact version of the Lean compiler used by the project.
* `Main.lean`: The entry point for the executable.
* `SSC/`: The directory containing the actual library code, modules, and theorems.
* `docs/`: Theoretical documentation and guides (like this one!).

## Summary for Reviewers

By utilizing **Lean 4** and **Lake**, this project embraces modern, rigorous methods for formalizing computer science theory. The toolchain ensures that:
- Code and proofs are completely reproducible.
- Dependencies are strictly pinned.
- The theoretical calculus is not just described on paper, but mechanically verified by a trusted kernel.
