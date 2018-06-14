pkg_name="aws-xray-daemon"
pkg_origin="meringu"
pkg_version="2.1.3"
pkg_description="AWS X-Ray Daemon"
pkg_upstream_url="https://aws.amazon.com/xray/"
pkg_source="https://github.com/aws/aws-xray-daemon"
pkg_maintainer="Henry Muru Paenga <meringu@gmail.com>"
pkg_license="Apache 2.0"
pkg_scaffolding="core/scaffolding-go"
pkg_bin_dirs=(bin)

do_download() {
    # TODO: use glide
    go get "$(_sanitize_pkg_source "$pkg_source")/..."
}

do_build() {
  pushd "$scaffolding_go_pkg_path" > /dev/null
  make build-linux
  popd > /dev/null
}

do_install() {
  cp -r "${scaffolding_go_pkg_path}/build/xray/xray" "${pkg_prefix}/bin"
}
