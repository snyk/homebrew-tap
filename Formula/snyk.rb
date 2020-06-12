class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.339.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.339.1/snyk-macos"
    sha256 "5ed4441e0406c2fb84d91408274aa4709a1ecb30ef323260f10ec04ee59e1a14"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.339.1/snyk-linux"
    sha256 "0f0dd4edcea70576c60f5d533efe7ca503ece1560ffb57d20b1ecae10cc1404d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
