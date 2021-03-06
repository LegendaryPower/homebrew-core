class Libntlm < Formula
  desc "Implements Microsoft's NTLM authentication"
  homepage "https://www.nongnu.org/libntlm/"
  url "https://www.nongnu.org/libntlm/releases/libntlm-1.4.tar.gz"
  sha256 "8415d75e31d3135dc7062787eaf4119b984d50f86f0d004b964cdc18a3182589"

  bottle do
    cellar :any
    rebuild 1
    sha256 "16f8a36b728098991792d9a1f83090997db76123545250e09953b8607a943885" => :high_sierra
    sha256 "3ecf99f8e70bbbcdef3a6ce5f6fb6c887ed2a85421faf1af0b59ac7d87ae3d7d" => :sierra
    sha256 "c8da369479c9e222ee9e89af8da7991bed067ee3a1e496220226c9adc883d4a2" => :el_capitan
    sha256 "605133351d91c2a3f0f2899deef01b6536143ffe804495fb19b6e134511e2a8c" => :yosemite
    sha256 "800b5d2108aa693a47f6559797ef1c6fb3c906ecd35607e57eb96ad10cd7c78b" => :mavericks
    sha256 "9f44dc14df7fdcb4657bb9ccae97c2df5e23977025ee202cfe2f615ed7ee9597" => :mountain_lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
