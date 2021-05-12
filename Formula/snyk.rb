class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.592.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.592.0/snyk-macos"
    sha256 "41f24dba99d4e6ea04ca32722fe0f743af8bc436ce0e9ff5d3daca63c7919a15"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.592.0/snyk-linux"
    sha256 "06e821d99a3e2ca0be3925d31e7c801041426fe335bfbaa3ac5fdb3c1354d1c3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
