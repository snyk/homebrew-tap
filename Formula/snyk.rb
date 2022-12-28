class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1077.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1077.0/snyk-macos"
    sha256 "da4f5522d24398c72f2d41b90c6b4d4f2af8b673a10259b8172036111533841d"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1077.0/snyk-linux"
    sha256 "ba165fc505e36d81607603e5491f5f97bc632eb819e76b15eb7cf0ce1a8837ca"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
