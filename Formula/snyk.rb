class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.410.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.410.2/snyk-macos"
    sha256 "9f1bfb252a493fbc47b7b9a26676c7ccf46b607cc5493a22a796cec758f6a3f1"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.410.2/snyk-linux"
    sha256 "a99ef0b581ea911a616a2576efe732b5534de55d0d35880be695a9ce0b870c3a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
