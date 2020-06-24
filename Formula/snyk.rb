class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.348.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.348.1/snyk-macos"
    sha256 "8b1b5133a7b5b6a369e6042c50d9860c9cce1c42a1073adcad43a22b462238a2"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.348.1/snyk-linux"
    sha256 "42c0fa9a3faac914faed1dbd5e7b4038ac939ef6f3a7eee0280af16e449dcc42"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
