{ config, pkgs, ... }: {
  home.sessionVariables = {
    EDITOR = "nano";
    # XCURSOR_THEME = "breeze_cursors";
    MOZ_ENABLE_WAYLAND = "1";
    NIXOS_OZONE_WL = "1";
    # QT_QPA_PLATFORM = "wayland";
    AMD_VULKAN_ICD = "RADV";
    RADV_PERFTEST = "aco";
    MESA_LOADER_DRIVER_OVERRIDE = "radeonsi";
    MESA_GL_VERSION_OVERRIDE = "4.6";
    MESA_GLSL_VERSION_OVERRIDE = "460";
    DXVK_ASYNC = "1";
    __GL_SHADER_DISK_CACHE = "1";
    VSCODE_LOCALE = "pt-BR";
  };
}
