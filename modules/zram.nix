{ config, lib, pkgs, ... }:

{
  zramSwap = {
    enable = true;
    memoryPercent = 100;
    memoryMax = 8 * 1024 * 1024 * 1024;  # 8GB max
    priority = 100;
    algorithm = "zstd";
  };
}
