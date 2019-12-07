class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.258.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.258.1/snyk-macos"
    sha256 "e358ef6327e47f2e1741585436f82001cef895787f2e1ebfa7c23cd6ca295d31"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.258.1/snyk-linux"
    sha256 "07110e7acac2cf99c15f627c7ff7ab6348aad71b8e8707f7458963aad5486afd"
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
