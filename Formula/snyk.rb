class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.337.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.337.0/snyk-macos"
    sha256 "e2ec4060808ab329c6246359e95106737d4f4c68346f91cbc60758be350920a6"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.337.0/snyk-linux"
    sha256 "cb7188497c6b0d6240608048308d5da40406a6737832ead6ba5a4e6aea1a4f02"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
