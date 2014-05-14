require "formula"

class Rftg < Formula
  homepage "http://keldon.net/rftg/"
  url "https://github.com/yesimon/rftg/archive/v0.8.1.tar.gz"
  sha1 "7e12e13cd3716f74d1a09f8ecd56bfbeb08c3f82"
  head "https://github.com/yesimon/rftg.git", :revision => "3e0df2d4ea44c82de1a52884ac1ff336ddc66604"

  depends_on :x11
  depends_on "gtk+"
  depends_on "gtk-mac-integration"
  depends_on "pkg-config"

  def install
    ENV.m32
    ENV.append_to_cflags %x[pkg-config --cflags gtk-mac-integration].chomp + ' -m32'
    ENV['LIBS'] = %x[pkg-config --libs gtk-mac-integration].chomp
    ENV['LDFLAGS'] = "-framework Cocoa"

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"

    system "make"

  end
end
