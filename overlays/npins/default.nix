{ config, lib, ... }:
let
  sources = import ../../npins;
in
final: prev: {
  ghostty-cursor-shaders = sources.ghostty-cursor-shaders;
  hyprsplit = sources.hyprsplit;
  vicinae-extensions = sources.extensions;
}
