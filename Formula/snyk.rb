class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.334.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.334.0/snyk-macos"
    sha256 "f756c1b0d103aa0d66a5cc4f290280552eee60dbc559424456094f675b86974e"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.334.0/snyk-linux"
    sha256 "0cffda8a91c5356d2f3f612ab15d397e4e968ab109465f0200228a2a84c5326b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
