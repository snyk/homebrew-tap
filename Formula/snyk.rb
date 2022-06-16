class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.951.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.951.0/snyk-macos"
    sha256 "5ab3749d556f8ad192faf6dbf005dd39c95c7fc5ca6099ea6b9c4e97d389b03d"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.951.0/snyk-linux"
    sha256 "26a0c49cff126ade842bed2110a7671d5de2040c844aff292931f4baf008ff70"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
