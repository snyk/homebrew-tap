class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.460.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.460.0/snyk-macos"
    sha256 "14b4f96b278525d0919c6eb39c8652a939440ed9eb85873b60f01ec558bbb506"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.460.0/snyk-linux"
    sha256 "f8164cc68dbe817c53909deab1c93c1dc0071ea7d1277b9f7eb9ec326df2d0ff"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
