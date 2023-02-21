class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1106.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1106.0/snyk-macos"
    sha256 "9175fa82dc2a1721b2258bffb8b1169dbef3fcdd04c0555deb0aa1c3bbef0e93"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1106.0/snyk-linux"
    sha256 "d8ba6976585608b755332104accb702d97235980b3f329a27aec19156bf42ca5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
