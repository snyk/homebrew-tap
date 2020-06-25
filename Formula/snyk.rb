class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.348.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.348.2/snyk-macos"
    sha256 "8eed8140b34e1ac4c5a1d369b52060274110815352e308e88b5ba5a6c9daf01b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.348.2/snyk-linux"
    sha256 "da443de39d961210f95c1215c67c20f6dade3492f8207040887815e518de9216"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
