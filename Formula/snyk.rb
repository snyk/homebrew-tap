class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.563.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.563.0/snyk-macos"
    sha256 "e53eafca4ed59bc842f4f91f0320ac66c5eb06e5ebfe6e0462bfde0cb1f761d7"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.563.0/snyk-linux"
    sha256 "255f8fad93c7db7f9400a98c8ca8a7478ea745054bc7c0d3a5ac52493932946d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
