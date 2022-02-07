//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-GUITexture" {
Properties {
_MainTex ("Texture", any) = "" { }
}
SubShader {
 Tags { "ForceSupported" = "true" "RenderType" = "Overlay" }
 Pass {
  Tags { "ForceSupported" = "true" "RenderType" = "Overlay" }
  Blend SrcAlpha OneMinusSrcAlpha, One One
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 6186
Program "vp" {
SubProgram "d3d9 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
}
Program "fp" {
SubProgram "d3d9 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
}
}
}
SubShader {
 Tags { "ForceSupported" = "true" "RenderType" = "Overlay" }
 Pass {
  Tags { "ForceSupported" = "true" "RenderType" = "Overlay" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 71898
Program "vp" {
SubProgram "d3d9 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
}
Program "fp" {
SubProgram "d3d9 " {
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
"// shader disassembly not supported on DXBC"
}
}
}
}
}