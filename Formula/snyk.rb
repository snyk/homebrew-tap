class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.280.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.280.1/snyk-macos"
    sha256 "10896da96bebaa5e4e695ec91edbda13a0411e522ec09d43326c962da2fcdbec"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.280.1/snyk-linux"
    sha256 "c10008ada7a3819fb9b57019960c513045d13dd2ad8b30acb2e3cf3015659626"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
