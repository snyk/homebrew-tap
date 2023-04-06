class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1140.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1140.0/snyk-macos"
    sha256 "f0b429ab60197e01a39fc23e9adf066dd070f42f262d7488f8161820f1a454b8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1140.0/snyk-linux"
    sha256 "dd39fe099d9beb43efb5edc82e1e18ef8c36f7c078d09aa9393178e1760d523c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
