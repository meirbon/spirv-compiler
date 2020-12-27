#version 450

layout(location = 0) in vec4 vertex;
#if MY_MACRO
layout(location = 0) out vec4 V;
#endif

void main() {
    V = vertex;
}