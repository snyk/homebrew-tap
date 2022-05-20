class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.934.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.934.0/snyk-macos"
    sha256 "e29d932b876e1fb8cd55699b249e6922d84e95a8a440135ec4202465d8a98fc2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.934.0/snyk-linux"
    sha256 "f81b22208bf9602589c722b1fe084ac20defcfe39c36b4299d9562618a89a4ff"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
