class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.936.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.936.0/snyk-macos"
    sha256 "e301c2a33825817c3e158345f8bc656b26e4f0bdcac4ee6a1b1bf1fde3681f14"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.936.0/snyk-linux"
    sha256 "7440e3b5605ffa2ad6855093d6d7a2e8c5c0b4de9581a71c07e840b11af12954"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
