class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.236.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.236.0/snyk-macos"
    sha256 "e8d245f1d3faa015af7a555fbdc25357c0641a20fe595b94868d6c785cb68b8e"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.236.0/snyk-linux"
    sha256 "af37c34cb61ec6c7de70fa8107c8b1538a4dfa71d50f96649d5d695934c2275b"
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
