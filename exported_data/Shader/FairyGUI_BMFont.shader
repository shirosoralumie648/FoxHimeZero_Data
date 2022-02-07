//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FairyGUI/BMFont" {
Properties {
_MainTex ("Base (RGB), Alpha (A)", 2D) = "black" { }
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
_BlendSrcFactor ("Blend SrcFactor", Float) = 5
_BlendDstFactor ("Blend DstFactor", Float) = 10
}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend Zero Zero, Zero Zero
  ColorMask 0 0
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  Fog {
   Mode Off
  }
  GpuProgramID 12184
Program "vp" {
SubProgram "d3d11 " {
Keywords { "NOT_GRAYED" "NOT_CLIPPED" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "NOT_GRAYED" "CLIPPED" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "NOT_GRAYED" "SOFT_CLIPPED" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "GRAYED" "NOT_CLIPPED" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "GRAYED" "CLIPPED" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "GRAYED" "SOFT_CLIPPED" }
"// shader disassembly not supported on DXBC"
}
}
Program "fp" {
SubProgram "d3d11 " {
Keywords { "NOT_GRAYED" "NOT_CLIPPED" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "NOT_GRAYED" "CLIPPED" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "NOT_GRAYED" "SOFT_CLIPPED" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "GRAYED" "NOT_CLIPPED" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "GRAYED" "CLIPPED" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "GRAYED" "SOFT_CLIPPED" }
"// shader disassembly not supported on DXBC"
}
}
}
}
Fallback "FairyGUI/Text"
}