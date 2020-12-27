#version 450

#include <structs.glsl>

layout(location = 0) in vec4 vertex;
layout(location = 0) out vec4 V;

layout(std430, set = 0, binding = 1) buffer readonly testStructBuffer { TestStruct structs[]; };

void main() {
    V = vertex;
}