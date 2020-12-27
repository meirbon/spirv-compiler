# spirv-compiler
A wrapper for shaderc written in Rust with features like include support built in.

## Usage
This library uses shaderc as its backend for shader compilation.
The included wrapping Compiler adds functionality for caching compilation of shaders in memory and in files.
Include support is built-in as well. 

### Setup compiler
``` Rust
use spirv_compiler::*;
let mut compiler = CompilerBuilder::new()
    // Add include dirs
    .with_include_dir("my-include-dir")
    // Add macros
    .with_macro("MY_MACRO", Some("1"))
    // Set source language
    .with_source_language(SourceLanguage::GLSL)
    // Build compiler
    .build()
    // If shaderc fails to initialize, this returns None
    .unwrap();

// Compile from file
let result: Result<Vec<u32>, CompileError> = compiler
    .compile_from_file(
        "test-spirv/test-macro.vert",
        ShaderKind::Vertex,
        false // Set to true if shaders should be cached to filesystem
    );

// Compile from string
let result: Result<Vec<u32>, CompileError> = compiler
    .compile_from_string(
        "#version 450...",
        ShaderKind::Vertex,
        false // Set to true if shaders should be cached to filesystem
    );
```