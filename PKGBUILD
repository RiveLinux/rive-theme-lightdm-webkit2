# Maintainer: Ryan Scott Lewis <ryanscottlewis@gmail.com>
pkgname=rive-theme-lightdm-webkit2
pkgver=0.0.1
pkgrel=1
pkgdesc="LightDM theme"
arch=("any")
url="https://github.com/RiveLinux/$pkgname"
license=("MIT")
groups=("rive" "rive-desktop" "rive-themes")
makedepends=(
  "rive-devel-tools"
  "nodejs"
)
depends=(
  "lightdm-webkit2-greeter"
)
source=("$pkgname-$pkgver.tar.gz")
sha512sums=("")
install=$pkgname.install

package() {
  cd "$pkgname-$pkgver"
  make deps
  make DESTDIR="$pkgdir/" install
}

