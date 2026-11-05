# 🛠️ Flex & Bison OOP Language Parser

An interactive, multi-pass Lexical Analyzer and Syntax Parser built using **Flex (Lex)** and **Bison (Yacc)** for a custom Java-like Object-Oriented programming language.

Developed for the **Principles of Programming Languages & Compilers** course (Academic Year 2024, Computer Engineering & Informatics Department, University of Patras).

---

## 📑 Table of Contents

- [✨ Project Features](#-project-features)
- [📐 Language Specifications](#-language-specifications)
- [🛠️ Prerequisites & Installation](#️-prerequisites--installation)
- [🚀 Compilation & Usage](#-compilation--usage)
- [🧪 Test Cases & Examples](#-test-cases--examples)
- [📊 Grammar Summary (BNF Snippet)](#-grammar-summary-bnf-snippet)

---

## ✨ Project Features

This project implements a compiler front-end parser divided into four main feature milestones:

- [x] **Lexical & Syntactic Analysis (60%)**
  - Complete Flex scanner for identifiers, keywords, primitive literals (`int`, `char`, `double`, `boolean`, `String`), and comments (`//` and `/* ... */`).
  - Bison grammar supporting class declarations, nested classes, control flow (`if/else`, `switch/case`), loops (`do-while`, `for`), and I/O (`out.print`).
  - Line tracking for accurate syntax error reporting.

- [x] **Variable Declaration Enhancements (10%)**
  - In-place initialization support (e.g., `int x = 12;`, `public String s = "Hello";`).
  - Multi-variable inline declarations (e.g., `double x, y, z;` and `int a=1, b=2, c=3;`).

- [x] **Symbol Table, Scope & Semantic Checks (20%)**
  - **Declaration Enforcement**: Flags undeclared variables or undefined method calls.
  - **Scope Checking**: Tracks symbol accessibility across global, class, and method scopes.
  - **Constant Folding & Expression Evaluation**: Evaluates arithmetic expressions (`+`, `-`, `*`, `/`) and logs calculated variable assignments at parse time.

- [x] **Advanced Error Recovery (10%)**
  - Non-fatal error reporting mode: Parser continues scanning the source file to report all syntax/semantic errors instead of terminating at the first failure.

---

## 📐 Language Specifications

| Element | Description / Syntax Rules |
| :--- | :--- |
| **Classes** | `public class ClassName { ... }` (Must start with an uppercase letter). Supports nesting. |
| **Data Types** | Primitive: `int`, `char`, `double` (must end with `d`, e.g. `5.99d`), `boolean`. Non-Primitive: `String`. |
| **Control Flow** | `if / else if / else`, `switch / case / default`. |
| **Loops** | `do { ... } while (cond);` and `for (init; cond; step) { ... }`. |
| **Methods** | Java-style declaration syntax with access modifiers (`public`, `private`) and parameter lists. |
| **Comments** | Single-line (`//`) and Block comments (`/* ... */`). |

---

## 🛠️ Prerequisites & Installation

To build and run this parser locally, ensure GCC, Flex, and Bison are installed on your environment.

### Linux / Ubuntu:
```bash
sudo apt update
sudo apt install build-essential flex bison
```

### Windows (MSYS2 / MinGW):
```bash
pacman -S gcc flex bison make
```

---

## 🚀 Compilation & Usage

### 1. Build the Parser
Execute the following commands in your terminal:

```bash
# Generate Flex scanner
flex scanner.l

# Generate Bison parser
bison -d parser.y

# Compile C executable
gcc -o myParser.exe lex.yy.c parser.tab.c -lm
```

### 2. Run the Parser

```bash
./myParser.exe <path_to_test_file>
```

#### Sample Terminal Output:
```text
=== Parsing: test_valid.txt ===
Line 1: Recognized public class 'Main'
Line 4: Assigned x = 45 (Evaluated expression: 15 + 30)
Line 8: Method call 'compute()' verified in Symbol Table.
SUCCESS: Program parsed with zero errors!
```

---

## 🧪 Test Cases & Examples

<details>
<summary><b>🔍 View Valid Code Example</b></summary>

```java
public class Demo {
    private int val = 10;
    
    public void execute() {
        int x = 5, y = 15;
        double pi = 3.14d;
        
        if (x < y) {
            out.print("x is smaller", x);
            val = x * 2 + y; // Evaluated at parse time
        }
    }
}
```
</details>

<details>
<summary><b>⚠️ View Invalid Code Example (Triggers Diagnostics)</b></summary>

```java
public class FailDemo {
    public void test() {
        int a = 10;
        b = 20; // ERROR: Undeclared variable 'b' on line 4
        
        double badDouble = 4.5; // ERROR: Missing 'd' suffix on line 6
    }
}
```
</details>

---

## 📊 Grammar Summary (BNF Snippet)

<details>
<summary><b>📖 Expand BNF Grammar Rules</b></summary>

```bnf
<program>           ::= <class_declaration_list>
<class_declaration> ::= "public" "class" IDENTIFIER "{" <class_body> "}"
<class_body>        ::= <var_decl_list> <method_decl_list>
<var_declaration>   ::= [<modifier>] <type> <var_init_list> ";"
<var_init_list>     ::= <var_init> | <var_init> "," <var_init_list>
<var_init>          ::= IDENTIFIER | IDENTIFIER "=" <expression>
```
</details>
