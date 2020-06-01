class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.333.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.333.0/snyk-macos"
    sha256 "5b882ad93c6fddeabddf4fb91521878857de15daa953175be73207f034924799"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.333.0/snyk-linux"
    sha256 "d3b6338cd8f7b5c2f0f14fcacb788f061000d0034a19ba3b223b2fd50bcac0e3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
