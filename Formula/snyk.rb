class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.819.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.819.0/snyk-macos"
    sha256 "57ca32e48027d7952b27f6b587dad1d6daf1722ebbaa315767ba795d52e32d5b"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.819.0/snyk-linux"
    sha256 "f1bc71977438e1414001b9685662ebd19bc0b594591697e54e6fc6ee13b769e0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
