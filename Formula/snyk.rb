class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1047.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1047.0/snyk-macos"
    sha256 "8db068ef31d1cdd7669cf1b3b6ae124a83a675c10d3c7ddc332a9c51d6b9ebcb"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1047.0/snyk-linux"
    sha256 "630090ede16662e633ac3de3c292985531a0774ccd4ed08d27bd2271dab529f2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
