class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.256.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.256.0/snyk-macos"
    sha256 "8f51facb4ee694d8b039505d11b5def83409e428f513bcc3aac46595f4ceab9c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.256.0/snyk-linux"
    sha256 "f960f6e41c6e5ebb3bb163ef17812ddf12f0a3c4fab1b8042a726872073f3824"
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
