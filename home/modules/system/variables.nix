{ config, pkgs, ... }: {
  home.sessionVariables = {
    EDITOR = "nano";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    AMD_VULKAN_ICD = "RADV";
    RADV_PERFTEST = "aco";
    MESA_LOADER_DRIVER_OVERRIDE = "radeonsi";
    MESA_GL_VERSION_OVERRIDE = "4.6";
    MESA_GLSL_VERSION_OVERRIDE = "460";
    DXVK_ASYNC = "1";
    __GL_SHADER_DISK_CACHE = "1";
    __GL_SHADER_DISK_CACHE_PATH = "$HOME/.cache/nv-shaders";
    VSCODE_LOCALE = "pt-BR";
    NODE_OPTIONS = "--max-old-space-size=4096";
    LIBVA_DRIVER_NAME = "radeonsi";
  };
}
