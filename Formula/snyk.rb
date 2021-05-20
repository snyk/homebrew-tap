class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.604.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.604.0/snyk-macos"
    sha256 "78453418638f156a1fe75d7636b81e05ad024e9fa85eea802e820783d312a445"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.604.0/snyk-linux"
    sha256 "61ecb7f08941eb2ac027f0543a8f4175b168cabe9c1748912992d867fd89402e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
