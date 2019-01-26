ifeq ($(build_os),darwin)
package=libsodium
$(package)_version=1.0.11
$(package)_download_path=https://supernetorg.bintray.com/misc
$(package)_file_name=libsodium-1.0.11.tar.gz
$(package)_sha256_hash=a14549db3c49f6ae2170cbbf4664bd48ace50681045e8dbea7c8d9fb96f9c765
$(package)_dependencies=
$(package)_config_opts=
else
package=libsodium
$(package)_version=1.0.15
$(package)_download_path=https://download.libsodium.org/libsodium/releases/old
$(package)_file_name=$(package)-$($(package)_version).tar.gz
$(package)_sha256_hash=fb6a9e879a2f674592e4328c5d9f79f082405ee4bb05cb6e679b90afe9e178f4
$(package)_dependencies=
$(package)_config_opts=
endif

define $(package)_preprocess_cmds
  cd $($(package)_build_subdir); ./autogen.sh
endef

define $(package)_config_cmds
  $($(package)_autoconf) --enable-static --disable-shared
endef

define $(package)_build_cmds
  $(MAKE)
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef
