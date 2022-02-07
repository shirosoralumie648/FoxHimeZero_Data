//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Live2D Cubism/Unlit" {
Properties {
_MainTex ("Main Texture", 2D) = "white" { }
cubism_ModelOpacity ("Model Opacity", Float) = 1
_SrcColor ("Source Color", Float) = 0
_DstColor ("Destination Color", Float) = 0
_SrcAlpha ("Source Alpha", Float) = 0
_DstAlpha ("Destination Alpha", Float) = 0
[Toggle(CUBISM_MASK_ON)] cubism_MaskOn ("Mask?", Float) = 0
cubism_MaskTexture ("cubism_Internal", 2D) = "white" { }
cubism_MaskTile ("cubism_Internal", Vector) = (0,0,0,0)
cubism_MaskTransform ("cubism_Internal", Vector) = (0,0,0,0)
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend Zero Zero, Zero Zero
  ZWrite Off
  Cull Off
  GpuProgramID 18776
Program "vp" {
SubProgram "d3d9 " {
Keywords { "CUBISM_MASK_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "CUBISM_MASK_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "CUBISM_MASK_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "CUBISM_MASK_OFF" }
"// shader disassembly not supported on DXBC"
}
}
Program "fp" {
SubProgram "d3d9 " {
Keywords { "CUBISM_MASK_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "CUBISM_MASK_ON" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d9 " {
Keywords { "CUBISM_MASK_OFF" }
"// shader disassembly not supported on DXBC"
}
SubProgram "d3d11 " {
Keywords { "CUBISM_MASK_OFF" }
"// shader disassembly not supported on DXBC"
}
}
}
}
}