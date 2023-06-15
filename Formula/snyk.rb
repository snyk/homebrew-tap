class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1180.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1180.0/snyk-macos"
    sha256 "104a61d87a7df839e451e2e095e2b506ece567af1cfd7bcd56ca9593efb73886"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1180.0/snyk-linux"
    sha256 "832607c4808a6090c0b531ca5576f81342cf9c88e5d23d66a11bba5bbe1b0c7c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
