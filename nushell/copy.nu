# Copies the config.nu file from the nu source directory to the current directory.

if ("config.nu" | path exists) {
  mv -f config.nu config.backup.nu
  echo "config.nu already exists.  Backed up to config.backup.nu"
}

cp -iv $nu.config-path ./config.nu
