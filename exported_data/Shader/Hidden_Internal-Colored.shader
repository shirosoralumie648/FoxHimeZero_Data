//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-Colored" {
Properties {
_Color ("Color", Color) = (1,1,1,1)
_SrcBlend ("SrcBlend", Float) = 5
_DstBlend ("DstBlend", Float) = 10
_ZWrite ("ZWrite", Float) = 1
_ZTest ("ZTest", Float) = 4
_Cull ("Cull", Float) = 0
_ZBias ("ZBias", Float) = 0
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend Zero Zero, Zero Zero
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 37372
Program "vp" {
SubProgram "d3d9 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "gles " {
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_MatrixVP;
uniform highp vec4 _Color;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (_glesColor * _Color);
  xlv_COLOR = tmpvar_1;
  gl_Position = (unity_MatrixVP * (unity_ObjectToWorld * tmpvar_2));
}


#endif
#ifdef FRAGMENT
varying lowp vec4 xlv_COLOR;
void main ()
{
  gl_FragData[0] = xlv_COLOR;
}


#endif
"
}
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "metal " {
"#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _Color;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 COLOR0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 COLOR0 [[ user(COLOR0) ]];
    float4 mtl_Position [[ position ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    output.COLOR0 = input.COLOR0 * Globals._Color;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = Globals.hlslcc_mtx4x4unity_ObjectToWorld[0] * input.POSITION0.xxxx + u_xlat0;
    u_xlat0 = Globals.hlslcc_mtx4x4unity_ObjectToWorld[2] * input.POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = Globals.hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = Globals.hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    output.mtl_Position = Globals.hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return output;
}
"
}
SubProgram "glcore " {
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0 * _Color;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 95
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %27 %29 %80 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %15 ArrayStride 15 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpMemberDecorate %17 0 Offset 17 
                                                     OpMemberDecorate %17 1 Offset 17 
                                                     OpMemberDecorate %17 2 Offset 17 
                                                     OpDecorate %17 Block 
                                                     OpDecorate %19 DescriptorSet 19 
                                                     OpDecorate %19 Binding 19 
                                                     OpDecorate %27 RelaxedPrecision 
                                                     OpDecorate %27 Location 27 
                                                     OpDecorate %29 Location 29 
                                                     OpMemberDecorate %78 0 BuiltIn 78 
                                                     OpMemberDecorate %78 1 BuiltIn 78 
                                                     OpMemberDecorate %78 2 BuiltIn 78 
                                                     OpDecorate %78 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %13 = OpTypeInt 32 0 
                                         u32 %14 = OpConstant 4 
                                             %15 = OpTypeArray %7 %14 
                                             %16 = OpTypeArray %7 %14 
                                             %17 = OpTypeStruct %15 %16 %7 
                                             %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %19 = OpVariable Uniform 
                                             %20 = OpTypeInt 32 1 
                                         i32 %21 = OpConstant 2 
                                             %22 = OpTypePointer Uniform %7 
                                             %26 = OpTypePointer Output %7 
                               Output f32_4* %27 = OpVariable Output 
                                Input f32_4* %29 = OpVariable Input 
                                         i32 %32 = OpConstant 0 
                                         i32 %33 = OpConstant 1 
                                         i32 %52 = OpConstant 3 
                              Private f32_4* %56 = OpVariable Private 
                                         u32 %76 = OpConstant 1 
                                             %77 = OpTypeArray %6 %76 
                                             %78 = OpTypeStruct %7 %6 %77 
                                             %79 = OpTypePointer Output %78 
        Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                             %89 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                              Uniform f32_4* %23 = OpAccessChain %19 %21 
                                       f32_4 %24 = OpLoad %23 
                                       f32_4 %25 = OpFMul %12 %24 
                                                     OpStore %9 %25 
                                       f32_4 %28 = OpLoad %9 
                                                     OpStore %27 %28 
                                       f32_4 %30 = OpLoad %29 
                                       f32_4 %31 = OpVectorShuffle %30 %30 1 1 1 1 
                              Uniform f32_4* %34 = OpAccessChain %19 %32 %33 
                                       f32_4 %35 = OpLoad %34 
                                       f32_4 %36 = OpFMul %31 %35 
                                                     OpStore %9 %36 
                              Uniform f32_4* %37 = OpAccessChain %19 %32 %32 
                                       f32_4 %38 = OpLoad %37 
                                       f32_4 %39 = OpLoad %29 
                                       f32_4 %40 = OpVectorShuffle %39 %39 0 0 0 0 
                                       f32_4 %41 = OpFMul %38 %40 
                                       f32_4 %42 = OpLoad %9 
                                       f32_4 %43 = OpFAdd %41 %42 
                                                     OpStore %9 %43 
                              Uniform f32_4* %44 = OpAccessChain %19 %32 %21 
                                       f32_4 %45 = OpLoad %44 
                                       f32_4 %46 = OpLoad %29 
                                       f32_4 %47 = OpVectorShuffle %46 %46 2 2 2 2 
                                       f32_4 %48 = OpFMul %45 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpFAdd %48 %49 
                                                     OpStore %9 %50 
                                       f32_4 %51 = OpLoad %9 
                              Uniform f32_4* %53 = OpAccessChain %19 %32 %52 
                                       f32_4 %54 = OpLoad %53 
                                       f32_4 %55 = OpFAdd %51 %54 
                                                     OpStore %9 %55 
                                       f32_4 %57 = OpLoad %9 
                                       f32_4 %58 = OpVectorShuffle %57 %57 1 1 1 1 
                              Uniform f32_4* %59 = OpAccessChain %19 %33 %33 
                                       f32_4 %60 = OpLoad %59 
                                       f32_4 %61 = OpFMul %58 %60 
                                                     OpStore %56 %61 
                              Uniform f32_4* %62 = OpAccessChain %19 %33 %32 
                                       f32_4 %63 = OpLoad %62 
                                       f32_4 %64 = OpLoad %9 
                                       f32_4 %65 = OpVectorShuffle %64 %64 0 0 0 0 
                                       f32_4 %66 = OpFMul %63 %65 
                                       f32_4 %67 = OpLoad %56 
                                       f32_4 %68 = OpFAdd %66 %67 
                                                     OpStore %56 %68 
                              Uniform f32_4* %69 = OpAccessChain %19 %33 %21 
                                       f32_4 %70 = OpLoad %69 
                                       f32_4 %71 = OpLoad %9 
                                       f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                       f32_4 %73 = OpFMul %70 %72 
                                       f32_4 %74 = OpLoad %56 
                                       f32_4 %75 = OpFAdd %73 %74 
                                                     OpStore %56 %75 
                              Uniform f32_4* %81 = OpAccessChain %19 %33 %52 
                                       f32_4 %82 = OpLoad %81 
                                       f32_4 %83 = OpLoad %9 
                                       f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                       f32_4 %85 = OpFMul %82 %84 
                                       f32_4 %86 = OpLoad %56 
                                       f32_4 %87 = OpFAdd %85 %86 
                               Output f32_4* %88 = OpAccessChain %80 %32 
                                                     OpStore %88 %87 
                                 Output f32* %90 = OpAccessChain %80 %32 %76 
                                         f32 %91 = OpLoad %90 
                                         f32 %92 = OpFNegate %91 
                                 Output f32* %93 = OpAccessChain %80 %32 %76 
                                                     OpStore %93 %92 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "d3d9 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"// shader disassembly not supported on DXBC"
}
SubProgram "gles " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"#version 100

#ifdef VERTEX
attribute vec4 _glesVertex;
attribute vec4 _glesColor;
uniform highp mat4 unity_ObjectToWorld;
uniform highp mat4 unity_StereoMatrixVP[2];
uniform highp int unity_StereoEyeIndex;
uniform highp vec4 _Color;
varying lowp vec4 xlv_COLOR;
void main ()
{
  lowp vec4 tmpvar_1;
  highp vec4 tmpvar_2;
  tmpvar_2.w = 1.0;
  tmpvar_2.xyz = _glesVertex.xyz;
  tmpvar_1 = (_glesColor * _Color);
  xlv_COLOR = tmpvar_1;
  gl_Position = (unity_StereoMatrixVP[unity_StereoEyeIndex] * (unity_ObjectToWorld * tmpvar_2));
}


#endif
#ifdef FRAGMENT
varying lowp vec4 xlv_COLOR;
void main ()
{
  gl_FragData[0] = xlv_COLOR;
}


#endif
"
}
SubProgram "gles3 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
uniform 	int unity_StereoEyeIndex;
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = unity_StereoEyeIndex << 2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 1];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 3] * u_xlat0.wwww + u_xlat2;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "metal " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 _Color;
};

struct UnityStereoGlobals_Type
{
    float4 hlslcc_mtx4x4unity_StereoMatrixP[8];
    float4 hlslcc_mtx4x4unity_StereoMatrixV[8];
    float4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
    float4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
    float4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
    float4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
    float4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
    float4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
    float3 unity_StereoWorldSpaceCameraPos[2];
    float4 unity_StereoScaleOffset[2];
};

struct UnityStereoEyeIndex_Type
{
    int unity_StereoEyeIndex;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 COLOR0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 COLOR0 [[ user(COLOR0) ]];
    float4 mtl_Position [[ position ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    constant UnityStereoGlobals_Type& UnityStereoGlobals [[ buffer(1) ]],
    constant UnityStereoEyeIndex_Type& UnityStereoEyeIndex [[ buffer(2) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    int u_xlati1;
    float4 u_xlat2;
    output.COLOR0 = input.COLOR0 * Globals._Color;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = Globals.hlslcc_mtx4x4unity_ObjectToWorld[0] * input.POSITION0.xxxx + u_xlat0;
    u_xlat0 = Globals.hlslcc_mtx4x4unity_ObjectToWorld[2] * input.POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = UnityStereoEyeIndex.unity_StereoEyeIndex << 0x2;
    u_xlat2 = u_xlat0.yyyy * UnityStereoGlobals.hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 1];
    u_xlat2 = UnityStereoGlobals.hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = UnityStereoGlobals.hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 2] * u_xlat0.zzzz + u_xlat2;
    output.mtl_Position = UnityStereoGlobals.hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 3] * u_xlat0.wwww + u_xlat2;
    return output;
}
"
}
SubProgram "glcore " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _Color;
layout(std140) uniform UnityStereoGlobals {
	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
	vec3 unity_StereoWorldSpaceCameraPos[2];
	vec4 unity_StereoScaleOffset[2];
};
layout(std140) uniform UnityStereoEyeIndex {
	int unity_StereoEyeIndex;
};
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati1;
vec4 u_xlat2;
void main()
{
    vs_COLOR0 = in_COLOR0 * _Color;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = unity_StereoEyeIndex << 2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 1];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 3] * u_xlat0.wwww + u_xlat2;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 109
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %28 %30 %92 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %28 Location 28 
                                                      OpDecorate %30 Location 30 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                          u32 %16 = OpConstant 8 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeInt 32 1 
                                              %19 = OpTypeStruct %15 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[8]; i32; f32_4;}* %21 = OpVariable Uniform 
                                          i32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Uniform %7 
                                              %27 = OpTypePointer Output %7 
                                Output f32_4* %28 = OpVariable Output 
                                 Input f32_4* %30 = OpVariable Input 
                                          i32 %33 = OpConstant 0 
                                          i32 %34 = OpConstant 1 
                                          i32 %45 = OpConstant 2 
                                              %57 = OpTypePointer Private %18 
                                 Private i32* %58 = OpVariable Private 
                                              %59 = OpTypePointer Uniform %18 
                               Private f32_4* %63 = OpVariable Private 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                             %103 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                               Uniform f32_4* %24 = OpAccessChain %21 %22 
                                        f32_4 %25 = OpLoad %24 
                                        f32_4 %26 = OpFMul %12 %25 
                                                      OpStore %9 %26 
                                        f32_4 %29 = OpLoad %9 
                                                      OpStore %28 %29 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %21 %33 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_4 %37 = OpFMul %32 %36 
                                                      OpStore %9 %37 
                               Uniform f32_4* %38 = OpAccessChain %21 %33 %33 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %30 
                                        f32_4 %41 = OpVectorShuffle %40 %40 0 0 0 0 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                               Uniform f32_4* %46 = OpAccessChain %21 %33 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpLoad %30 
                                        f32_4 %49 = OpVectorShuffle %48 %48 2 2 2 2 
                                        f32_4 %50 = OpFMul %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpFAdd %50 %51 
                                                      OpStore %9 %52 
                                        f32_4 %53 = OpLoad %9 
                               Uniform f32_4* %54 = OpAccessChain %21 %33 %22 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpFAdd %53 %55 
                                                      OpStore %9 %56 
                                 Uniform i32* %60 = OpAccessChain %21 %45 
                                          i32 %61 = OpLoad %60 
                                          i32 %62 = OpShiftLeftLogical %61 %45 
                                                      OpStore %58 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                                          i32 %66 = OpLoad %58 
                                          i32 %67 = OpIAdd %66 %34 
                               Uniform f32_4* %68 = OpAccessChain %21 %34 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpFMul %65 %69 
                                                      OpStore %63 %70 
                                          i32 %71 = OpLoad %58 
                               Uniform f32_4* %72 = OpAccessChain %21 %34 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %63 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %63 %78 
                                          i32 %79 = OpLoad %58 
                                          i32 %80 = OpIAdd %79 %45 
                               Uniform f32_4* %81 = OpAccessChain %21 %34 %80 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 2 2 2 2 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %63 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %63 %87 
                                          i32 %93 = OpLoad %58 
                                          i32 %94 = OpIAdd %93 %22 
                               Uniform f32_4* %95 = OpAccessChain %21 %34 %94 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpVectorShuffle %97 %97 3 3 3 3 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %63 
                                       f32_4 %101 = OpFAdd %99 %100 
                               Output f32_4* %102 = OpAccessChain %92 %33 
                                                      OpStore %102 %101 
                                 Output f32* %104 = OpAccessChain %92 %33 %88 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFNegate %105 
                                 Output f32* %107 = OpAccessChain %92 %33 %88 
                                                      OpStore %107 %106 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "STEREO_INSTANCING_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "gles3 " {
Keywords { "STEREO_INSTANCING_ON" }
"#ifdef VERTEX
#version 300 es

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "metal " {
Keywords { "STEREO_INSTANCING_ON" }
"#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _Color;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 COLOR0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 COLOR0 [[ user(COLOR0) ]];
    float4 mtl_Position [[ position ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    output.COLOR0 = input.COLOR0 * Globals._Color;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = Globals.hlslcc_mtx4x4unity_ObjectToWorld[0] * input.POSITION0.xxxx + u_xlat0;
    u_xlat0 = Globals.hlslcc_mtx4x4unity_ObjectToWorld[2] * input.POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = Globals.hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = Globals.hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    output.mtl_Position = Globals.hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return output;
}
"
}
SubProgram "glcore " {
Keywords { "STEREO_INSTANCING_ON" }
"#ifdef VERTEX
#version 330
#extension GL_ARB_explicit_attrib_location : require

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0 * _Color;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 330
#extension GL_ARB_explicit_attrib_location : require

in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "STEREO_INSTANCING_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 95
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %27 %29 %80 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %15 ArrayStride 15 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpMemberDecorate %17 0 Offset 17 
                                                     OpMemberDecorate %17 1 Offset 17 
                                                     OpMemberDecorate %17 2 Offset 17 
                                                     OpDecorate %17 Block 
                                                     OpDecorate %19 DescriptorSet 19 
                                                     OpDecorate %19 Binding 19 
                                                     OpDecorate %27 RelaxedPrecision 
                                                     OpDecorate %27 Location 27 
                                                     OpDecorate %29 Location 29 
                                                     OpMemberDecorate %78 0 BuiltIn 78 
                                                     OpMemberDecorate %78 1 BuiltIn 78 
                                                     OpMemberDecorate %78 2 BuiltIn 78 
                                                     OpDecorate %78 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %13 = OpTypeInt 32 0 
                                         u32 %14 = OpConstant 4 
                                             %15 = OpTypeArray %7 %14 
                                             %16 = OpTypeArray %7 %14 
                                             %17 = OpTypeStruct %15 %16 %7 
                                             %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %19 = OpVariable Uniform 
                                             %20 = OpTypeInt 32 1 
                                         i32 %21 = OpConstant 2 
                                             %22 = OpTypePointer Uniform %7 
                                             %26 = OpTypePointer Output %7 
                               Output f32_4* %27 = OpVariable Output 
                                Input f32_4* %29 = OpVariable Input 
                                         i32 %32 = OpConstant 0 
                                         i32 %33 = OpConstant 1 
                                         i32 %52 = OpConstant 3 
                              Private f32_4* %56 = OpVariable Private 
                                         u32 %76 = OpConstant 1 
                                             %77 = OpTypeArray %6 %76 
                                             %78 = OpTypeStruct %7 %6 %77 
                                             %79 = OpTypePointer Output %78 
        Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                             %89 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                              Uniform f32_4* %23 = OpAccessChain %19 %21 
                                       f32_4 %24 = OpLoad %23 
                                       f32_4 %25 = OpFMul %12 %24 
                                                     OpStore %9 %25 
                                       f32_4 %28 = OpLoad %9 
                                                     OpStore %27 %28 
                                       f32_4 %30 = OpLoad %29 
                                       f32_4 %31 = OpVectorShuffle %30 %30 1 1 1 1 
                              Uniform f32_4* %34 = OpAccessChain %19 %32 %33 
                                       f32_4 %35 = OpLoad %34 
                                       f32_4 %36 = OpFMul %31 %35 
                                                     OpStore %9 %36 
                              Uniform f32_4* %37 = OpAccessChain %19 %32 %32 
                                       f32_4 %38 = OpLoad %37 
                                       f32_4 %39 = OpLoad %29 
                                       f32_4 %40 = OpVectorShuffle %39 %39 0 0 0 0 
                                       f32_4 %41 = OpFMul %38 %40 
                                       f32_4 %42 = OpLoad %9 
                                       f32_4 %43 = OpFAdd %41 %42 
                                                     OpStore %9 %43 
                              Uniform f32_4* %44 = OpAccessChain %19 %32 %21 
                                       f32_4 %45 = OpLoad %44 
                                       f32_4 %46 = OpLoad %29 
                                       f32_4 %47 = OpVectorShuffle %46 %46 2 2 2 2 
                                       f32_4 %48 = OpFMul %45 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpFAdd %48 %49 
                                                     OpStore %9 %50 
                                       f32_4 %51 = OpLoad %9 
                              Uniform f32_4* %53 = OpAccessChain %19 %32 %52 
                                       f32_4 %54 = OpLoad %53 
                                       f32_4 %55 = OpFAdd %51 %54 
                                                     OpStore %9 %55 
                                       f32_4 %57 = OpLoad %9 
                                       f32_4 %58 = OpVectorShuffle %57 %57 1 1 1 1 
                              Uniform f32_4* %59 = OpAccessChain %19 %33 %33 
                                       f32_4 %60 = OpLoad %59 
                                       f32_4 %61 = OpFMul %58 %60 
                                                     OpStore %56 %61 
                              Uniform f32_4* %62 = OpAccessChain %19 %33 %32 
                                       f32_4 %63 = OpLoad %62 
                                       f32_4 %64 = OpLoad %9 
                                       f32_4 %65 = OpVectorShuffle %64 %64 0 0 0 0 
                                       f32_4 %66 = OpFMul %63 %65 
                                       f32_4 %67 = OpLoad %56 
                                       f32_4 %68 = OpFAdd %66 %67 
                                                     OpStore %56 %68 
                              Uniform f32_4* %69 = OpAccessChain %19 %33 %21 
                                       f32_4 %70 = OpLoad %69 
                                       f32_4 %71 = OpLoad %9 
                                       f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                       f32_4 %73 = OpFMul %70 %72 
                                       f32_4 %74 = OpLoad %56 
                                       f32_4 %75 = OpFAdd %73 %74 
                                                     OpStore %56 %75 
                              Uniform f32_4* %81 = OpAccessChain %19 %33 %52 
                                       f32_4 %82 = OpLoad %81 
                                       f32_4 %83 = OpLoad %9 
                                       f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                       f32_4 %85 = OpFMul %82 %84 
                                       f32_4 %86 = OpLoad %56 
                                       f32_4 %87 = OpFAdd %85 %86 
                               Output f32_4* %88 = OpAccessChain %80 %32 
                                                     OpStore %88 %87 
                                 Output f32* %90 = OpAccessChain %80 %32 %76 
                                         f32 %91 = OpLoad %90 
                                         f32 %92 = OpFNegate %91 
                                 Output f32* %93 = OpAccessChain %80 %32 %76 
                                                     OpStore %93 %92 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "d3d11 " {
Keywords { "STEREO_MULTIVIEW_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "gles3 " {
Keywords { "STEREO_MULTIVIEW_ON" }
"#ifdef VERTEX
#version 300 es
#extension GL_OVR_multiview2 : require

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _Color;
layout(std140) uniform UnityStereoGlobals {
	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
	vec3 unity_StereoWorldSpaceCameraPos[2];
	vec4 unity_StereoScaleOffset[2];
};
layout(std140) uniform UnityStereoEyeIndices {
	vec4 unity_StereoEyeIndices[2];
};
layout(num_views = 2) in;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp float vs_BLENDWEIGHT0;
vec4 u_xlat0;
uint u_xlatu0;
int u_xlati1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = int(gl_ViewID_OVR) << 2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 1];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 3] * u_xlat0.wwww + u_xlat2;
    u_xlatu0 = gl_ViewID_OVR;
    vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "metal " {
Keywords { "STEREO_MULTIVIEW_ON" }
"#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _Color;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 COLOR0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 COLOR0 [[ user(COLOR0) ]];
    float4 mtl_Position [[ position ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    output.COLOR0 = input.COLOR0 * Globals._Color;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = Globals.hlslcc_mtx4x4unity_ObjectToWorld[0] * input.POSITION0.xxxx + u_xlat0;
    u_xlat0 = Globals.hlslcc_mtx4x4unity_ObjectToWorld[2] * input.POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = Globals.hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = Globals.hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    output.mtl_Position = Globals.hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return output;
}
"
}
SubProgram "glcore " {
Keywords { "STEREO_MULTIVIEW_ON" }
"#ifdef VERTEX
#version 330
#extension GL_ARB_explicit_attrib_location : require
#extension GL_OVR_multiview2 : require

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 _Color;
layout(std140) uniform UnityStereoGlobals {
	vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
	vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
	vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
	vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
	vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
	vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
	vec3 unity_StereoWorldSpaceCameraPos[2];
	vec4 unity_StereoScaleOffset[2];
};
layout(std140) uniform UnityStereoEyeIndices {
	vec4 unity_StereoEyeIndices[2];
};
layout(num_views = 2) in;
in  vec4 in_POSITION0;
in  vec4 in_COLOR0;
out vec4 vs_COLOR0;
out float vs_BLENDWEIGHT0;
vec4 u_xlat0;
uint u_xlatu0;
int u_xlati1;
vec4 u_xlat2;
void main()
{
    vs_COLOR0 = in_COLOR0 * _Color;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = int(gl_ViewID_OVR) << 2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 1];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 2] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1 + 3] * u_xlat0.wwww + u_xlat2;
    u_xlatu0 = gl_ViewID_OVR;
    vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
    return;
}

#endif
#ifdef FRAGMENT
#version 330
#extension GL_ARB_explicit_attrib_location : require

in  vec4 vs_COLOR0;
layout(location = 0) out vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan " {
Keywords { "STEREO_MULTIVIEW_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 95
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %27 %29 %80 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %15 ArrayStride 15 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpMemberDecorate %17 0 Offset 17 
                                                     OpMemberDecorate %17 1 Offset 17 
                                                     OpMemberDecorate %17 2 Offset 17 
                                                     OpDecorate %17 Block 
                                                     OpDecorate %19 DescriptorSet 19 
                                                     OpDecorate %19 Binding 19 
                                                     OpDecorate %27 RelaxedPrecision 
                                                     OpDecorate %27 Location 27 
                                                     OpDecorate %29 Location 29 
                                                     OpMemberDecorate %78 0 BuiltIn 78 
                                                     OpMemberDecorate %78 1 BuiltIn 78 
                                                     OpMemberDecorate %78 2 BuiltIn 78 
                                                     OpDecorate %78 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %13 = OpTypeInt 32 0 
                                         u32 %14 = OpConstant 4 
                                             %15 = OpTypeArray %7 %14 
                                             %16 = OpTypeArray %7 %14 
                                             %17 = OpTypeStruct %15 %16 %7 
                                             %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %19 = OpVariable Uniform 
                                             %20 = OpTypeInt 32 1 
                                         i32 %21 = OpConstant 2 
                                             %22 = OpTypePointer Uniform %7 
                                             %26 = OpTypePointer Output %7 
                               Output f32_4* %27 = OpVariable Output 
                                Input f32_4* %29 = OpVariable Input 
                                         i32 %32 = OpConstant 0 
                                         i32 %33 = OpConstant 1 
                                         i32 %52 = OpConstant 3 
                              Private f32_4* %56 = OpVariable Private 
                                         u32 %76 = OpConstant 1 
                                             %77 = OpTypeArray %6 %76 
                                             %78 = OpTypeStruct %7 %6 %77 
                                             %79 = OpTypePointer Output %78 
        Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                             %89 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                              Uniform f32_4* %23 = OpAccessChain %19 %21 
                                       f32_4 %24 = OpLoad %23 
                                       f32_4 %25 = OpFMul %12 %24 
                                                     OpStore %9 %25 
                                       f32_4 %28 = OpLoad %9 
                                                     OpStore %27 %28 
                                       f32_4 %30 = OpLoad %29 
                                       f32_4 %31 = OpVectorShuffle %30 %30 1 1 1 1 
                              Uniform f32_4* %34 = OpAccessChain %19 %32 %33 
                                       f32_4 %35 = OpLoad %34 
                                       f32_4 %36 = OpFMul %31 %35 
                                                     OpStore %9 %36 
                              Uniform f32_4* %37 = OpAccessChain %19 %32 %32 
                                       f32_4 %38 = OpLoad %37 
                                       f32_4 %39 = OpLoad %29 
                                       f32_4 %40 = OpVectorShuffle %39 %39 0 0 0 0 
                                       f32_4 %41 = OpFMul %38 %40 
                                       f32_4 %42 = OpLoad %9 
                                       f32_4 %43 = OpFAdd %41 %42 
                                                     OpStore %9 %43 
                              Uniform f32_4* %44 = OpAccessChain %19 %32 %21 
                                       f32_4 %45 = OpLoad %44 
                                       f32_4 %46 = OpLoad %29 
                                       f32_4 %47 = OpVectorShuffle %46 %46 2 2 2 2 
                                       f32_4 %48 = OpFMul %45 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpFAdd %48 %49 
                                                     OpStore %9 %50 
                                       f32_4 %51 = OpLoad %9 
                              Uniform f32_4* %53 = OpAccessChain %19 %32 %52 
                                       f32_4 %54 = OpLoad %53 
                                       f32_4 %55 = OpFAdd %51 %54 
                                                     OpStore %9 %55 
                                       f32_4 %57 = OpLoad %9 
                                       f32_4 %58 = OpVectorShuffle %57 %57 1 1 1 1 
                              Uniform f32_4* %59 = OpAccessChain %19 %33 %33 
                                       f32_4 %60 = OpLoad %59 
                                       f32_4 %61 = OpFMul %58 %60 
                                                     OpStore %56 %61 
                              Uniform f32_4* %62 = OpAccessChain %19 %33 %32 
                                       f32_4 %63 = OpLoad %62 
                                       f32_4 %64 = OpLoad %9 
                                       f32_4 %65 = OpVectorShuffle %64 %64 0 0 0 0 
                                       f32_4 %66 = OpFMul %63 %65 
                                       f32_4 %67 = OpLoad %56 
                                       f32_4 %68 = OpFAdd %66 %67 
                                                     OpStore %56 %68 
                              Uniform f32_4* %69 = OpAccessChain %19 %33 %21 
                                       f32_4 %70 = OpLoad %69 
                                       f32_4 %71 = OpLoad %9 
                                       f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                       f32_4 %73 = OpFMul %70 %72 
                                       f32_4 %74 = OpLoad %56 
                                       f32_4 %75 = OpFAdd %73 %74 
                                                     OpStore %56 %75 
                              Uniform f32_4* %81 = OpAccessChain %19 %33 %52 
                                       f32_4 %82 = OpLoad %81 
                                       f32_4 %83 = OpLoad %9 
                                       f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                       f32_4 %85 = OpFMul %82 %84 
                                       f32_4 %86 = OpLoad %56 
                                       f32_4 %87 = OpFAdd %85 %86 
                               Output f32_4* %88 = OpAccessChain %80 %32 
                                                     OpStore %88 %87 
                                 Output f32* %90 = OpAccessChain %80 %32 %76 
                                         f32 %91 = OpLoad %90 
                                         f32 %92 = OpFNegate %91 
                                 Output f32* %93 = OpAccessChain %80 %32 %76 
                                                     OpStore %93 %92 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 1
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "d3d9 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "gles " {
""
}
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "gles3 " {
""
}
SubProgram "metal " {
"#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    output.SV_Target0 = input.COLOR0;
    return output;
}
"
}
SubProgram "glcore " {
""
}
SubProgram "vulkan " {
""
}
SubProgram "d3d9 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"// shader disassembly not supported on DXBC"
}
SubProgram "gles " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
""
}
SubProgram "d3d11 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"// shader disassembly not supported on DXBC"
}
SubProgram "gles3 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
""
}
SubProgram "metal " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    output.SV_Target0 = input.COLOR0;
    return output;
}
"
}
SubProgram "glcore " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
""
}
SubProgram "vulkan " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
""
}
SubProgram "d3d11 " {
Keywords { "STEREO_INSTANCING_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "gles3 " {
Keywords { "STEREO_INSTANCING_ON" }
""
}
SubProgram "metal " {
Keywords { "STEREO_INSTANCING_ON" }
"#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    output.SV_Target0 = input.COLOR0;
    return output;
}
"
}
SubProgram "glcore " {
Keywords { "STEREO_INSTANCING_ON" }
""
}
SubProgram "vulkan " {
Keywords { "STEREO_INSTANCING_ON" }
""
}
SubProgram "d3d11 " {
Keywords { "STEREO_MULTIVIEW_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "gles3 " {
Keywords { "STEREO_MULTIVIEW_ON" }
""
}
SubProgram "metal " {
Keywords { "STEREO_MULTIVIEW_ON" }
"#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    output.SV_Target0 = input.COLOR0;
    return output;
}
"
}
SubProgram "glcore " {
Keywords { "STEREO_MULTIVIEW_ON" }
""
}
SubProgram "vulkan " {
Keywords { "STEREO_MULTIVIEW_ON" }
""
}
}
}
}
}