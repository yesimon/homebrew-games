require "formula"

class Rftg < Formula
  homepage "http://keldon.net/rftg/"
  url "https://github.com/yesimon/rftg/archive/v0.8.1.tar.gz"
  sha1 "7e12e13cd3716f74d1a09f8ecd56bfbeb08c3f82"
  head "https://github.com/yesimon/rftg.git", :revision => "3e0df2d4ea44c82de1a52884ac1ff336ddc66604"

  # depends_on "cmake" => :build
  depends_on :x11 # if your formula requires any X11/XQuartz components
  depends_on "gtk+"
  depends_on "gtk-mac-integration"
  depends_on "pkg-config"

  def install
    ENV.m32
    ENV.append_to_cflags %x[pkg-config --cflags gtk-mac-integration].chomp + ' -m32'
    ENV['LIBS'] = %x[pkg-config --libs gtk-mac-integration].chomp
    ENV['LDFLAGS'] = "-framework Cocoa"

    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    system "make"

  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rftg`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
