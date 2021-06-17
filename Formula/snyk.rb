class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.634.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.634.0/snyk-macos"
    sha256 "fc895cfff01bc88bb9bf9c19e5cfa64c796afa5d1cc18bee0c65ddd56007e233"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.634.0/snyk-linux"
    sha256 "c24c3490b74d2ea663d2ce9079a2336ffac51ccd075a8469d8fccced0d8d5519"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
