# Let's keep it as a empty block
_final: _prev: {
  # somepkg = final.stable.somepkg;
  #
  # Patch from an unmerged nixpkgs/upstream PR:
  # somepkg = _prev.somepkg.overrideAttrs (old: {
  #   patches = (old.patches or []) ++ [
  #     (final.fetchpatch {
  #       url = "https://github.com/owner/repo/pull/123.patch";
  #       hash = "sha256-...";
  #     })
  #   ];
  # });
}
