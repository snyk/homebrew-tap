class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.753.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.753.0/snyk-macos"
    sha256 "984c9cf955c7e61ee4e21b2ef64c39677c5d3b8e3ef2413bccc7d19281a845f8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.753.0/snyk-linux"
    sha256 "10a908ace2d4e54f214239375b178478c18c32230a7c58bf60333bd468035de6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
