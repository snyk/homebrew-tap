class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.509.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.509.0/snyk-macos"
    sha256 "ebcb380bb0bf3f35d994c9f9c4aff705acda5614fe04775f7452c16dc1fe7282"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.509.0/snyk-linux"
    sha256 "1227948e084342e221949161e7269e1bfb2dff01d307b663a110b308f8e1cf16"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
