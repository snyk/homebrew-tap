class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.319.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.319.1/snyk-macos"
    sha256 "9dbeadb99f9eb3cf10cb44804775d4dc428d17b1110f7ea6d564ec0ce7b9cc4a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.319.1/snyk-linux"
    sha256 "3fb816d41fae04361aaf9de0b13c2da092f9bfa5d0c52b35a95a14174bcd0ed3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
