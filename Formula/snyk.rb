class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.586.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.586.0/snyk-macos"
    sha256 "ace6e2bde41db08176cba6fbd8046c1c6efaa026baef58c3f59718c234008187"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.586.0/snyk-linux"
    sha256 "1c02ab3d93c0dfa575c3889e1c93fb3714770ee331bf157ddc2f7e4aa1d6a713"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
