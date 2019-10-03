class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.230.4"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.230.4/snyk-macos"
    sha256 "5194832dc2af969e30d06f312676f3f14c38fae7bd2c9a0cf43427c4e55a0215"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.230.4/snyk-linux"
    sha256 "52268f56235721887d7f20809a7a816e6c918a7ca3f0f034ef3bf071322d77b0"
  end

  def install
    original = OS.linux? ? "snyk-linux" : "snyk-macos"
    mv original, "snyk"
    bin.install "snyk"
  end

  test do
    system "#{bin}/snyk --version"
  end
end
