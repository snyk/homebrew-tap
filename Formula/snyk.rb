class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.434.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.434.0/snyk-macos"
    sha256 "83f341f4fec8e130292cb704a60e96a5e0de7922f0487b36ae6f53c64887b963"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.434.0/snyk-linux"
    sha256 "abcf3cc4343c64dbbcfe5cb95c1ee586f889a35a3fa8191f3ce7c4f9fba05d18"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
