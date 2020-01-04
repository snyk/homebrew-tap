class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.272.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.272.0/snyk-macos"
    sha256 "62c28ad336fc9542d6b28d29bac6a541cf5428c4cd9a000f79cf2dd50c0fd47a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.272.0/snyk-linux"
    sha256 "89d7a3e62a3dbaacc6dc65c7e4a8570fbeaa62256a635423a258cb5ecf9f3fe8"
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
