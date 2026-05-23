{ config, lib, ... }:
final: prev:
import ../../packages {
  inherit config lib;
  pkgs = final;
}
