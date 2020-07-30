class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.369.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.369.1/snyk-macos"
    sha256 "d9c8aa8e0a9da3080ba87205fe27f1d8643c4cb7b411ca6d0d9351e95a0d14ce"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.369.1/snyk-linux"
    sha256 "18c64cf2d120c9a126e58371a745cb051e726e9bb174be924ccec5fa86cedc13"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
