class Ccrypt < Formula
  desc "Encrypt and decrypt files and streams"
  homepage "https://ccrypt.sourceforge.io/"
  url "https://downloads.sourceforge.net/project/ccrypt/1.11/ccrypt-1.11.tar.gz"
  sha256 "b19c47500a96ee5fbd820f704c912f6efcc42b638c0a6aa7a4e3dc0a6b51a44f"

  bottle do
    sha256 "a4d270d5b5f467870f0b265f6f2d1861762d853df46756a34ac7e6a6d83e2121" => :high_sierra
    sha256 "048295cb4f95c9f0f3c5f1a619141e08c0326b6d8252c62c97608fb028cb48f7" => :sierra
    sha256 "a98ea0f3dbee5e9086bea342ac8291303970b1d8a85344be2b4d91330a919ae9" => :el_capitan
  end

  conflicts_with "ccat", :because => "both install `ccat` binaries"

  fails_with :clang do
    build 318
    cause "Tests fail when optimizations are enabled"
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}",
                          "--with-lispdir=#{share}/emacs/site-lisp/ccrypt"
    system "make", "install"
    system "make", "check"
  end

  test do
    touch "homebrew.txt"
    system bin/"ccrypt", "-e", testpath/"homebrew.txt", "-K", "secret"
    assert_predicate testpath/"homebrew.txt.cpt", :exist?
    refute_predicate testpath/"homebrew.txt", :exist?

    system bin/"ccrypt", "-d", testpath/"homebrew.txt.cpt", "-K", "secret"
    assert_predicate testpath/"homebrew.txt", :exist?
    refute_predicate testpath/"homebrew.txt.cpt", :exist?
  end
end
