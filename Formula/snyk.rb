class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.437.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.437.0/snyk-macos"
    sha256 "6320c67b105102bdc42f293ddd5c63d6a6efbb5fdee22df3e4447404c11568b0"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.437.0/snyk-linux"
    sha256 "ca6c5476a974dc13202dd3b99110fc4a3ea2ec00df4df5274387a2a3502e2bfe"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
