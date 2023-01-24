class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1090.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1090.0/snyk-macos"
    sha256 "a52701104c90f912a2b28422cf6bd10fb8a7e2b0ee384a0ab8f7f3d1a4cf1827"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1090.0/snyk-linux"
    sha256 "5fd38aadcef2dddbdfeae0931eae788208421d441dd9feba6d12c7d940a238de"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
