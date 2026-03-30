# Snippets de disassembly

## Cambiar un JZ en un desensamblado

If you've found a jz, it will either look like 74 XX or 0F 84 XX XX XX XX. If it's a 74, change it to 75. If it's the one with 84, change it to 85. This information can be found, among other places, in Intel's manual (volume 2A).

It will not vary between systems, as long as they're all x86 based, and if they aren't then jz and jnz may not even exist...
