class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.316.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.316.2/snyk-macos"
    sha256 "cfb2d2f98737bdbbd3930d7b2ea408ba0936d2c8036ec674f3e822ff0df63078"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.316.2/snyk-linux"
    sha256 "ef7ab229d3bfcf8c534a4efe90b141a89dc970df2e462b22b15feeaf87257feb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
