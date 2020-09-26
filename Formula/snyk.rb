class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.401.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.401.0/snyk-macos"
    sha256 "41a5dc8e826abdd741b87dbc5c6ab0785b87b76a27eb7de8f2dbfbcb8b72285a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.401.0/snyk-linux"
    sha256 "fdc262b91c820fe08f35dd5e994a9ef3ebfa14000df368d4fc0e0a013cdf13fe"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
