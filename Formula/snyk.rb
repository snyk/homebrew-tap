class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1177.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1177.0/snyk-macos"
    sha256 "9c24397834b2f21db46aa856288f8e7867ca2c466d4df81f765aad67f5fb722b"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1177.0/snyk-linux"
    sha256 "59dfc98ee03689ba60a65afaf537d52d69ba6319a6ea5017396127182ed7c23f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
