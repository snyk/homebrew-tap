class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.278.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.278.0/snyk-macos"
    sha256 "2828399d46b732a1d1433217ba641a70386ccf8d10094924b7273b094629552d"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.278.0/snyk-linux"
    sha256 "8e59b6b24f85afef5d1ee28752f198c3d66c6ac381ad840a4a4e59a8e5ef0551"
  end

  def install
    original = OS.linux? ? "snyk-linux" : "snyk-macos"
    mv original, "snyk"
    bin.install "snyk"
  end

  test do
    system "#{bin}/snyk --version"
  end
end
