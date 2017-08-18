require File.expand_path("../../language/php", __FILE__)

class Phan < Formula
  include Language::PHP::Composer

  desc "Static analyzer for PHP"
  homepage "https://github.com/etsy/phan"
  url "https://github.com/etsy/phan/archive/0.9.4.tar.gz"
  sha256 "af2f405b428949c70b11a7351f890cb3d49fdda25e082fb7e314f4b5c2fe39ee"
  head "https://github.com/etsy/phan.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "aab5e0058a69e2c77b2b509dce89f6dc03b2f2b939504cee0657978f203a0a37" => :sierra
    sha256 "701bd667502e3b3c896246dd5bc9fbe58528c0193ac1595df85ea5e290bd34bf" => :el_capitan
    sha256 "f0f930a0eb1f48009ada35c1ca7118d41ba3c4358c7c2dbc0ddd57e1f1fa9e7f" => :yosemite
  end

  depends_on "php71-ast"
  depends_on "php71"

  def install
    composer_install
    prefix.install Dir["*"]
    bin.install_symlink prefix/"phan"
  end

  test do
    system "#{bin}/phan", "--help"
  end
end
