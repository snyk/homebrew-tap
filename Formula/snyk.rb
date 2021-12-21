class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.804.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.804.0/snyk-macos"
    sha256 "9e7b83a3627390ba2165e7a87ed043e60b6fa1d0258f4ea6a54762e89a6a1e6e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.804.0/snyk-linux"
    sha256 "d4d2e58482940f6e03b3e068b4853ad6a0cd0f04ba31f65fb09544998e016c7b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
